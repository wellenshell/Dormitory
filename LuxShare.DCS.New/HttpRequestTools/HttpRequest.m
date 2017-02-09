//
//  HttpRequest.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "HttpRequest.h"
#import "Header.h"
#import "Thing.h"
#define kManager AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];manager.responseSerializer = [AFHTTPResponseSerializer serializer];

@implementation HttpRequest
//******************  登录请求
+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password uuid:(NSString*)UUID completeWithData:(void (^)(BOOL isSuccess))complete{
    
    
    kManager;
    manager.requestSerializer.timeoutInterval = 10.0f;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:code forKey:@"code"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:UUID forKey:@"UUID"];
    
    [manager POST:@"http://spc.luxshare-ict.com:19999/api/Account/Login" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"-1--%@",dicData);
        if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
            complete(YES);
        }else{
            complete(NO);
           
                LXAlertView *alert=[[LXAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"%@",[dicData objectForKey:@"ErrMsg"]] cancelBtnTitle:@"确定" otherBtnTitle:nil clickIndexBlock:^(NSInteger clickIndex) {
                    
                }];
                [alert showLXAlertView];

        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        complete(NO);
        [manager.operationQueue cancelAllOperations];
    }];

}


#pragma mark----------------------------宿舍
//*********** 根据工号或者姓名获取个人信息
+(void)getPersonInfo:(NSString*)code completeWithData:(void (^)(PeopleM*people))complete{
    
    kManager;
    @synchronized (self) {
        [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Employee/GetEmployee?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSDictionary *data = [dic objectForKey:@"Data"];
            if ([data isKindOfClass:[NSNull class]]||data.count == 0) {
                
                complete(nil);
                [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
                return ;
                
            }else{
                
                PeopleM *model = [PeopleM getPersonal:data];
                complete(model);
            }
        }else{
            complete(nil);
        }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
        
    }
}

//************  根据工号获取人物头像
+(void)getPersonImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete{
    
   kManager;
    @synchronized (self) {
        [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Employee/GetEmpPhoto?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
           
            if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
                NSString *imageUrl = [dic objectForKey:@"Data"];
                if ([imageUrl isKindOfClass:[NSNull class]]) {
                    
                    complete(nil);
                    [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
                }else{
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
                    complete(image);
                }
            }else{
                complete(nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
        }];
 
    }
    
    
}


//判断又没有权限
+(void)sendLogin:(NSString*)code completeWithData:(void (^)(BOOL isSuccess))complete{
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Employee/GetAppRoom?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
            complete(YES);
        }else{
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dicData objectForKey:@"ErrMsg"]]];
            complete(NO);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

// 根据工号获取邮箱
+(void)getPersonEmail:(NSString*)code completeWithData:(void (^)(NSString*email))complete{
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Employee/GetEmail?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            complete([dicData objectForKey:@"Data"]);
        }else{
            complete(nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
//根据工号获取上级主管
+(void)getPersonBoss:(NSString*)code completeWithData:(void (^)(NSString*boss))complete{
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Employee/GetSuperiortBoss?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSDictionary*data = [dicData objectForKey:@"Data"];
            NSString*boss = [data objectForKey:@"m_Item2"];
            complete(boss);
        }else{
            complete(nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    

}
#pragma mark------------------------门禁
//*********** 根据工号或者姓名获取个人信息
+(void)getPersonalInfo:(NSString*)code completeWithData:(void (^)(PeopleModeller*people))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/FixedAssets/GetFixedAssets?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *data = [dic objectForKey:@"Data"];
        if ([data isKindOfClass:[NSNull class]]) {
            complete(nil);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
           
        }else{
            
            PeopleModeller *model = [PeopleModeller getPersonal:data];
            complete(model);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
// 判断在不在职
+(void)getPersonLeave:(NSString*)code completeWithData:(void (^)(NSString *leaveData))complete{
    
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmployees?code=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            for (NSDictionary *d in dataArr) {
                NSString*leave = [d objectForKey:@"LeaveDate"];
                complete(leave);
                
             
            }
            
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


//***************  根据工号获取来访者信息
+(void)getGuestInfo:(NSString*)code completeWithData:(void (^)(NSMutableArray*guestArr))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    kManager;
    
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/Scheduled/Receive?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (![dataArr isKindOfClass:[NSNull class]]) {
                for (NSDictionary*dic in dataArr) {
                    GuestModel *model = [GuestModel getModelInfo:dic];
                    
                    [arr addObject:model];
                }
                complete(arr);
            }else{
                complete(arr);
            }
        }else{
            complete(arr);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        complete(nil);
//        [manager.operationQueue cancelAllOperations];
    }];
    
}

//***********  获取已经进厂的人员信息
+(void)getDidComGuestInfo:(NSString*)code guest:(NSMutableArray*)ids things:(NSMutableArray*)things completeWithData:(void (^)(NSMutableArray*guestArr))complete{
    
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:co forKey:@"EmpCode"];
    [dic setObject:ids forKey:@"Ids"];
    [dic setObject:things forKey:@"items"];
    
    [manager POST:@"http://spc.luxshare-ict.com:19999/api/Scheduled/Inventory" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *dataArr = [dic objectForKey:@"Data"];
        if (dataArr.count != 0) {
            for (NSDictionary *dic in dataArr) {
                GuestModel *model = [GuestModel getModelInfo:dic];
                [arr addObject:model];
                
            }
            complete(arr);
        }else{
            complete(arr);
        }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
    
}


// ******************* 根据资产编号获取资产信息
+(void)getThingsInfo:(NSString*)code completeWithData:(void (^)(ThingsModel*thing))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/FixedAssets/GetEmpAssets?code=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"---------%@",dic);
        if ([[dic objectForKey:@"Data"] isKindOfClass:[NSNull class]]) {
            complete(nil);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
        }else{
            NSArray *dataArr = [dic objectForKey:@"Data"];
            for (NSDictionary*dataDic in dataArr) {
                ThingsModel *model = [ThingsModel getModelInfo:dataDic];
                complete(model);
                
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
    
    
}
// ******************* 根据工号获取资产信息
+(void)getThingInfo:(NSString*)code completeWithData:(void (^)(Thing*thing))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/api/FixedAssets/GetFixedAssets?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"Data"] isKindOfClass:[NSNull class]]) {
            complete(nil);
        }else{
            NSDictionary*d = [dic objectForKey:@"Data"];
            
                Thing *model = [Thing getModelInfo:d];
                complete(model);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}


// 获取待离开人员信息
+(void)getManufacturerInfo:(NSString *)code completeWithData:(void (^)(NSMutableArray*ar))complete{
    
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://spc.luxshare-ict.com:19999/Api/Scheduled/Leave?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (dataArr.count != 0) {
                for (NSDictionary*dic in dataArr) {
                    GuestModel *model = [GuestModel getModelInfo:dic];
                    
                    [arr addObject:model];
                }
                complete(arr);
            }else{
                complete(arr);
            }
        }else{
            complete(arr);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
// 获取确定离开人员信息
+(void)getleaveInfo:(NSString *)code ids:(NSMutableArray*)idsArr completeWithData:(void (^)(NSMutableArray*ar))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:co forKey:@"EmpCode"];
    [dic setObject:idsArr forKey:@"Ids"];
    
    
    [manager POST:@"http://spc.luxshare-ict.com:19999/Api/Scheduled/SendList" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"--%@",dic);
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (dataArr.count != 0) {
                for (NSDictionary *dic in dataArr) {
                    GuestModel *model = [GuestModel getModelInfo:dic];
                    [arr addObject:model];
                    
                }
                complete(arr);
            }else{
                complete(arr);
                [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"] ]];
            }
            
        }else{
           [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"] ]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
    
}


//获取厂商入厂信息
+(void)getPeopelInto:(NSString*)CallerId code:(NSString*)EmpCode Company:(NSString*)CompanyCode completeWithData:(void (^)(ChangShang*chang))complete{
    
    kManager;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:CallerId forKey:@"CallerId"];
    [dic setObject:EmpCode forKey:@"EmpCode"];
    [dic setObject:CompanyCode forKey:@"CompanyCode"];
    
    
    [manager POST:@"http://spc.luxshare-ict.com:19999/api/Scheduled/SupplierIn" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data = [dic objectForKey:@"Data"];
        if (data.count == 0) {
            complete(nil);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
        }else{
        ChangShang *chang = [ChangShang getChangShang:data];
        complete(chang);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
    }];
    
}
// 厂商离厂
+(void)getPeopelOut:(NSString*)CallerId code:(NSString*)EmpCode Company:(NSString*)CompanyCode completeWithData:(void (^)(ChangShang*chang))complete{
   kManager;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:CallerId forKey:@"CallerId"];
    [dic setObject:EmpCode forKey:@"EmpCode"];
    [dic setObject:CompanyCode forKey:@"CompanyCode"];
    
    
    [manager POST:@"http://spc.luxshare-ict.com:19999/api/Scheduled/SupplierIn" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *data = [dic objectForKey:@"Data"];
        NSLog(@"--%@",data);
        if (data.count != 0) {
            ChangShang *chang = [ChangShang getChangShang:data];
            complete(chang);
        }else{
            complete(nil);
            [KPromptBox showKPromptBoxWithMassage:[NSString stringWithFormat:@"%@",[dic objectForKey:@"ErrMsg"]]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}





@end
