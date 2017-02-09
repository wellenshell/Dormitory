//
//  Request.m
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/27.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "Request.h"

@implementation Request
////******************  登录请求
//+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete{
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//   NSString *co = [code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    [co stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/Account/CheckUser?empCode=%@&&password=%@",co,password] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        
//        if ([[dicData objectForKey:@"success"]integerValue] == 1) {
//            complete(YES);
//        }else{
//            complete(NO);
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//    
//}
//根据司机工号查询车的班次
+(void)checkBusNumber:(NSString*)code completeWithData:(void (^)(BusModel*model))complete null:(void (^)(NSMutableArray*arr))complet{
    NSString *co = [code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [co stringByReplacingOccurrencesOfString:@" " withString:@""];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
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
        NSLog(@"fail:%@",error);
        
    }];
    
    

}




@end
