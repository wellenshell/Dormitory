//
//  HttpRequestTool.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "HttpRequest.h"
#import "Header.h"
@implementation HttpRequest


////******************  登录请求
//+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete{
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
//    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//     NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
//     [dic setObject:co forKey:@"code"];
//     [dic setObject:password forKey:@"password"];
//    
//   
//        [manager POST:@"http://dcs.luxshare-ict.com:19999/api/Account/Login" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            
//            NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//
//                if ([[dicData objectForKey:@"IsSuccess"]integerValue] == 1) {
//                    complete(YES);
//                }else{
//                    complete(NO);
//                }
//        
//            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"fail:%@",error);
//            
//        }];
// 
//    
//    
//}

//*********** 根据工号或者姓名获取个人信息
+(void)getPersonalInfo:(NSString*)code completeWithData:(void (^)(PeopleModeller*people))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/FixedAssets/GetFixedAssets?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *data = [dic objectForKey:@"Data"];
        if ([data isKindOfClass:[NSNull class]]) {
            LXAlertView *alert=[[LXAlertView alloc] initWithTitle:@"温馨提示" message:@"您所查询的人员不存在或者已经离职" cancelBtnTitle:@"确定" otherBtnTitle:nil clickIndexBlock:^(NSInteger clickIndex) {
                
            }];
            [alert showLXAlertView];
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

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
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

//************  根据工号获取人物头像
+(void)getPersonalImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete{
    
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/Employee/GetEmpPhoto?empCode=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"-------%@",dic);
        if ([[dic objectForKey:@"IsSuccess"]integerValue] == 1) {
        NSString *imageUrl = [dic objectForKey:@"Data"];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
        complete(image);
        }else{
            
      }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];


}

//***************  根据工号获取来访者信息
+(void)getGuestInfo:(NSString*)code completeWithData:(void (^)(NSMutableArray*guestArr))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:@"http://dcs.luxshare-ict.com:19999/api/FixedAssets/GetEmpAssets?code=%@",co] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[dic objectForKey:@"Data"] isKindOfClass:[NSNull class]]) {
            LXAlertView *alert=[[LXAlertView alloc] initWithTitle:@"温馨提示" message:@"您所查询的资产不存在" cancelBtnTitle:@"确定" otherBtnTitle:nil clickIndexBlock:^(NSInteger clickIndex) {
                
            }];
            [alert showLXAlertView];
            
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

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
             
         }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
// 获取确定离开人员信息
+(void)getleaveInfo:(NSString *)code ids:(NSMutableArray*)idsArr completeWithData:(void (^)(NSMutableArray*ar))complete{
    NSString *co = [code stringByReplacingOccurrencesOfString:@" "  withString:@""];
    [co stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
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
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
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
@end
