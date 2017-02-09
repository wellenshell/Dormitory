//
//  HttpRequest.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "HttpRequest.h"
#import "Header.h"
#import "SmellModel.h"
#import "YiBeiModel.h"

#define kManager AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];manager.responseSerializer = [AFHTTPResponseSerializer serializer];

@implementation HttpRequest
//******************  登录请求
+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete{
    
   kManager;
    @synchronized (self) {
        [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/Account/CheckUser?empCode=%@&&password=%@",code,password] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
            if ([[dicData objectForKey:@"success"]integerValue] == 1) {
                complete(YES);
            }else{
                complete(NO);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];

    }
    
    
}

//根据司机工号查询车的班次
+(void)checkBusNumber:(NSString*)code completeWithData:(void (^)(BusModel*model))complete null:(void (^)(NSMutableArray*arr))complet{
    NSString *co = [code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [co stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    kManager;
    NSMutableArray *ar = [[NSMutableArray alloc]initWithCapacity:0];
    
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/Api/Bus/GetBusShiftsByDriver?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
            NSArray *data = [dicData objectForKey:@"Data"];
            if ([data isKindOfClass:[NSNull class]] || data.count == 0) {
                complet(ar);
            }else{
                for (NSDictionary *dicData in data) {
                    BusModel *model = [BusModel getBus:dicData];
                    complete(model);
                }
           }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
    }];
}

//根据班次查询车的人员
+(void)checkBusPeople:(NSString*)shiftCode completeWithData:(void (^)(PeopleModel*model))complete{
    kManager;
    NSString *url = [NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/Api/Bus/GetRideListByShiftCode?shiftCode=%@",shiftCode];
    NSString *newUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:newUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *data = [dicData objectForKey:@"Data"];
        if ([data isKindOfClass:[NSNull class]]) {
            
        }else{
            for (NSDictionary *dicData in data) {
                PeopleModel*model = [PeopleModel getPeople:dicData];
                complete(model);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
//根据班次和人员列表更新数据
+(void)refushPeople:(NSString*)shiftCode list:(NSMutableArray*)empList completeWithData:(void (^)(PeopleModel*model))complete{
    
   kManager;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:shiftCode forKey:@"shiftCode"];
    for (int i = 0; i<empList.count; i++) {
        [dic setObject:empList[i] forKey:@"empList"];
        
    }
    [manager POST:@"http://dcs.luxshare-ict.com:19999/Api/Bus/ChecKIn" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *arr = [dicData objectForKey:@"Data"];
        if ([arr isKindOfClass:[NSNull class]]) {
            
        }else{
            
        }
        NSLog(@"---%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        
    }];
    
    
    
}

#pragma mark----------------------------宿舍
//*********** 根据工号或者姓名获取个人信息
+(void)getPersonInfo:(NSString*)code completeWithData:(void (^)(PeopleM*people))complete{
    
    
    NSLog(@"-----%@---------",[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmployees?code=%@",code]);
   kManager;
    @synchronized (self) {
        [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmployees?code=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSArray *data = [dic objectForKey:@"Data"];
            if ([data isKindOfClass:[NSNull class]]||data.count == 0) {
                
                [KPromptBox showKPromptBoxWithMassage:@" 您所查询的人员不存在"];
                return ;
                
            }else{
                
                if (data.count >10) {
                    for (int i =0; i<10; i++) {
                        PeopleM *model = [PeopleM getPersonal:[data objectAtIndex:i]];
                        complete(model);
                        
                    }
                }else{
                    for (NSDictionary *dic in data) {
                        PeopleM *model = [PeopleM getPersonal:dic];
                        complete(model);
                        
                    }
                    
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   }];
 
    }
}

//************  根据工号获取人物头像
+(void)getPersonImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete{
    
   kManager;
    @synchronized (self) {
        [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmpPhoto?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
            if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
                NSString *imageUrl = [dic objectForKey:@"Data"];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
                complete(image);
            }else{
                
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
        }];
 
    }
    
    
}


//判断又没有权限
+(void)sendLoginRequest:(NSString*)code completeWithData:(void (^)(BOOL isSuccess))complete{
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/Employee/GetAppRoom?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
            complete(YES);
        }else{
            complete(NO);
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
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/FixedAssets/GetFixedAssets?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *data = [dic objectForKey:@"Data"];
        if ([data isKindOfClass:[NSNull class]]) {
            
            [KPromptBox showKPromptBoxWithMassage:@"您所查询的人员不存在或者已经离职"];
           
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
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/Scheduled/Receive?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (dataArr != nil) {
                for (NSDictionary*dic in dataArr) {
                    GuestModel *model = [GuestModel getModelInfo:dic];
                    
                    [arr addObject:model];
                }
                complete(arr);
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
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
    
    [manager POST:@"http://dcs.luxshare-ict.com:19999/api/Scheduled/Inventory" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *dataArr = [dic objectForKey:@"Data"];
        for (NSDictionary *dic in dataArr) {
            GuestModel *model = [GuestModel getModelInfo:dic];
            [arr addObject:model];
            
        }
        complete(arr);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
    
}


// ******************* 根据资产编号获取资产信息
+(void)getThingsInfo:(NSString*)code completeWithData:(void (^)(ThingsModel*thing))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/FixedAssets/GetEmpAssets?code=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"Data"] isKindOfClass:[NSNull class]]) {
            [KPromptBox showKPromptBoxWithMassage:@" 您所查询的资产不存在"];
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


// 获取待离开人员信息
+(void)getManufacturerInfo:(NSString *)code completeWithData:(void (^)(NSMutableArray*ar))complete{
    
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
   kManager;
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/Api/Scheduled/Leave?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (dataArr != nil) {
                for (NSDictionary*dic in dataArr) {
                    GuestModel *model = [GuestModel getModelInfo:dic];
                    
                    [arr addObject:model];
                }
                complete(arr);
            }else{
                return ;
            }
        }else{
            [KPromptBox showKPromptBoxWithMassage:[dic objectForKey:@"ErrMsg"]];
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
    
    
    [manager POST:@"http://dcs.luxshare-ict.com:19999/Api/Scheduled/SendList" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"--%@",dic);
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            for (NSDictionary *dic in dataArr) {
                GuestModel *model = [GuestModel getModelInfo:dic];
                [arr addObject:model];
                
            }
            complete(arr);
        }else{
            
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
    
    
    [manager POST:@"http://dcs.luxshare-ict.com:19999/api/Scheduled/SupplierIn" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data = [dic objectForKey:@"Data"];
        
        ChangShang *chang = [ChangShang getChangShang:data];
        complete(chang);
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
    
    
    [manager POST:@"http://dcs.luxshare-ict.com:19999/api/Scheduled/SupplierIn" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data = [dic objectForKey:@"Data"];
        NSLog(@"------%@---",dic);
        ChangShang *chang = [ChangShang getChangShang:data];
        complete(chang);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}




//生产异常
+(void)getYiChang:(NSString *)code completeWithData:(void (^)(YiChangModel*yichang))complete{
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/ExHandle/GetHandlePending?empCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSArray *dataArr = [dic objectForKey:@"Data"];
            if (dataArr != nil) {
                for (NSDictionary*dic in dataArr) {
                    YiChangModel *model = [YiChangModel getYiChang:dic];
                   complete(model);
                }
                
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];

}

#pragma mark--------------------------领料
//获取线别
+(void)getLine:(NSString*)code completeWithData:(void (^)(NSMutableArray*lineArr))complete{
    
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Product/GetLine?EmpCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            if ([dic objectForKey:@"Data"] != nil) {
                for (NSString*str in [dic objectForKey:@"Data"]) {
                    [dataArr addObject:str];
                }
                complete(dataArr);
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];

}
//根据线别获取工单号
+(void)getGongDan:(NSString*)code line:(NSString*)line completeWithData:(void (^)(NSMutableArray*GongArr))complete{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableArray *gongArr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Product/GetWorkOrder?EmpCode=%@&Line=%@",code,line] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            if ([dic objectForKey:@"Data"] != nil) {
                for (NSString*str in [dic objectForKey:@"Data"]) {
                    [gongArr addObject:str];
                }
                complete(gongArr);
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];

}
//根据工单号获取料号列表
+(void)getLiaoHao:(NSString*)dan  code:(NSString*)EmpCode completeWithData:(void (^)(LingModel*ling))complete{
    
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Product/GetMaterialCode?EmpCode=%@&WorkOrderCode=%@",EmpCode,dan] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"---%@",dic);
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            if ([dic objectForKey:@"Data"] != nil) {
                for (NSDictionary*di in [dic objectForKey:@"Data"]) {
                    LingModel *model = [LingModel getLineModel:di];
                     complete(model);
                }
               
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

//下单
+(void)XiaDan:(NSString*)code line:(NSString*)line pro:(NSString*)pro work:(NSString*)workCode list:(NSMutableArray*)list completeWithData:(void (^)(BOOL isOk))complete{
    kManager;
  
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:code forKey:@"EmpCode"];
    [dic setObject:pro forKey:@"ProfitceterCode"];
    [dic setObject:workCode forKey:@"WorkOrderCode"];
    [dic setObject:line forKey:@"line"];
    [dic setObject:list forKey:@"List"];

    
    [manager POST:@"http://dcs.luxshare-ict.com:9999/api/Product/OrderBook" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic2 = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"--123-%@",dic2);
        
        if ([[dic2 objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            [KPromptBox showKPromptBoxWithMassage:[dic2 objectForKey:@"ErrMsg"]];
            complete(YES);
        }else{
            [KPromptBox showKPromptBoxWithMassage:[dic2 objectForKey:@"ErrMsg"]];
            complete(NO);
        }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--error:%@",error);
        
    }];

}
#pragma mark---------------------------考勤
+(void)kaoQin:(NSString*)EmpCode dt:(NSString*)td completeWithData:(void (^)( KaoQinModel*kao))complete{
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Personnel/GetAttendance?EmpCode=%@&dt=%@",EmpCode,td] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            if ([dic objectForKey:@"Data"] != nil) {
                for (NSDictionary*di in [dic objectForKey:@"Data"]) {
                     KaoQinModel*model = [KaoQinModel getKaoQin:di];
                    complete(model);
                }
                
            }else{
                return ;
            }
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];

}
//缺勤
+(void)QueQin:(NSString*)EmpCode dt:(NSString*)td completeWithData:(void (^)( QueQinModel*que))complete{
    
    kManager;
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Personnel/GetEmpAbsen?EmpCode=%@&dt=%@",EmpCode,td] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            
            if ([dic objectForKey:@"Data"] != nil) {
              NSArray*DataDetailArr = [[dic objectForKey:@"Data"] objectForKey:@"DataDetail"];
                for (NSDictionary*smellDic in DataDetailArr) {
                    QueQinModel*que = [QueQinModel getQueQin:smellDic];
                    complete(que);
                }
            }else{
            }
        }else{
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];

}

#pragma mark-----------------------备料
//----------------------------未完成的领料单
+(void)getBeiLiao:(NSString*)code completeWithData:(void (^)(NSMutableArray*BeiArr))complete{
    kManager;
    NSMutableArray *bigAr = [[NSMutableArray alloc]initWithCapacity:0];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Product/GetOrder?EmpCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"---%@",dic);
        NSArray *arr = [dic objectForKey:@"Data"];
        
        for (NSDictionary*smellDic in arr) {
            NSArray*g = [smellDic objectForKey:@"g"];
            for (NSDictionary*d in g) {
                SmellModel *smell = [SmellModel getSmellModel:d];
                [bigAr addObject:smell];
            }
            
        }
        complete(bigAr);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--12---%@",error);
        
    }];
    
}

//已完成的领料单
+(void)getBeiLiaoYi:(NSString*)code completeWithData:(void (^)(NSMutableArray*BeiArr))complete{
   
        kManager;
        NSMutableArray *bigAr = [[NSMutableArray alloc]initWithCapacity:0];
   
        [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:9999/api/Product/GetOrderFinish?EmpCode=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"---%@",dic);
            if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
                
                            if ([dic objectForKey:@"Data"] != nil) {
                                for (NSDictionary*dis in [dic objectForKey:@"Data"]) {
                
                                    NSMutableArray* _bigArr = [[NSMutableArray alloc]init];
                                    NSDictionary*dic = [dis objectForKey:@"head"];
                
                                    [_bigArr addObject:[dic objectForKey:@"CompanyName"]];
                                    [_bigArr addObject:[dic objectForKey:@"ProfitceterCode"]];
                                   [_bigArr addObject:[dic objectForKey:@"Line"]];
                                    NSArray *arr = [dis objectForKey:@"g"];
                                    NSMutableArray* _smellArr = [[NSMutableArray alloc]init];
                
                                    for (NSDictionary *dd in arr) {
                                        YiBeiModel *smell = [YiBeiModel getSmellModel:dd];
                                        [_smellArr addObject:smell];
                                    }
                
                                    [_bigArr addObject:_smellArr];
                                    [bigAr addObject:_bigArr];
                                }
                                NSLog(@"--11---%@",bigAr);
                                complete(bigAr);
                            }else{
                                return ;
                            }
                        }else{
                            
                        }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"--12---%@",error);
               
        }];

}
//领单
+(void)getLingDan:(NSString*)code idd:(NSInteger)danId completeWithData:(void (^)(BOOL isLing))complete{
   kManager;
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@(danId) forKey:@"Id"];
    [dic setObject:code forKey:@"EmpCode"];
    
    
    
    [manager POST:@"http://dcs.luxshare-ict.com:9999/api/Product/ReceiveOrder" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            complete(YES);
        }else{
            complete(NO);
        }
        [KPromptBox showKPromptBoxWithMassage:[dic objectForKey:@"ErrMsg"]];
        
         NSLog(@"--dic:%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--error:%@",error);
           }];

}
//确定修改
+(void)getChanged:(NSString*)code idd:(NSInteger)danId number:(NSInteger)aNumber completeWithData:(void (^)(NSInteger number))complete{
   kManager;
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@(danId) forKey:@"Id"];
    [dic setObject:code forKey:@"EmpCode"];
    [dic setObject:@(aNumber) forKey:@"ActualQuantity"];
    
    
    [manager POST:@"http://dcs.luxshare-ict.com:9999/api/Product/EditQuantity" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            NSDictionary*dicc = [dic objectForKey:@"Data"];
           NSInteger numberr = [[dicc objectForKey:@"ActualQuantity"]integerValue];
            complete(numberr);
        }else{
           
        }
       // [KPromptBox showKPromptBoxWithMassage:[dic objectForKey:@"ErrMsg"]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--error:%@",error);
           }];

}
//备料完成
+(void)finish:(NSString*)code idd:(NSArray*)Ids completeWithData:(void (^)(BOOL isSure))complete{
    kManager;
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:Ids forKey:@"Ids"];
    [dic setObject:code forKey:@"EmpCode"];
    
    [manager POST:@"http://dcs.luxshare-ict.com:9999/api/Product/OrderFinish" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"---%@",dic);
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
            complete(YES);
        }else{
            complete(NO);
       }
        LXAlertView *alert=[[LXAlertView alloc] initWithTitle:nil message:[dic objectForKey:@"ErrMsg"] cancelBtnTitle:@"确定" otherBtnTitle:nil clickIndexBlock:^(NSInteger clickIndex) {
            
        }];
        [alert showLXAlertView];
        //[KPromptBox showKPromptBoxWithMassage:[dic objectForKey:@"ErrMsg"]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--error:%@",error);
       
    }];

}
@end
