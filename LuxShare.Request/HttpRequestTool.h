//
//  HttpRequestTool.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "PeopleM.h"


@interface HttpRequestTool : NSObject

// 登录
+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete;
// 根据工号读取人物信息
+(void)getPersonInfo:(NSString*)code completeWithData:(void (^)(PeopleM*people))complete;

//根据工号获取人物头像
+(void)getPersonImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete;

//判断又没有权限
+(void)sendLoginRequest:(NSString*)code completeWithData:(void (^)(BOOL isSuccess))complete;

@end
