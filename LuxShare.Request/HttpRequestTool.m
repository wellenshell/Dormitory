//
//  HttpRequestTool.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "HttpRequestTool.h"
#import "Header.h"
@implementation HttpRequestTool
//******************  登录请求
+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
       
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



//*********** 根据工号或者姓名获取个人信息
+(void)getPersonInfo:(NSString*)code completeWithData:(void (^)(PeopleM*people))complete{
 
   
  NSLog(@"-----%@---------",[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmployees?code=%@",code]);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  
    [manager GET:[NSString stringWithFormat:@"http://116.6.133.149:8888/api/EmpInfo/Employee/GetEmployees?code=%@",code] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSArray *data = [dic objectForKey:@"Data"];
            if ([data isKindOfClass:[NSNull class]]||data.count == 0) {
                
                LXAlertView *alert=[[LXAlertView alloc] initWithTitle:@"温馨提示" message:@"您所查询的人员不存在" cancelBtnTitle:@"确定" otherBtnTitle:nil clickIndexBlock:^(NSInteger clickIndex) {
                   
                }];
                [alert showLXAlertView];
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

//************  根据工号获取人物头像
+(void)getPersonImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   
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


//判断又没有权限
+(void)sendLoginRequest:(NSString*)code completeWithData:(void (^)(BOOL isSuccess))complete{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
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




@end
