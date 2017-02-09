//
//  HttpRequestTool.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "PeopleModeller.h"
#import "GuestModel.h"
#import "ThingsModel.h"
#import "ManufacturerModel.h"
#import "ChangShang.h"
@interface HttpRequest : NSObject


//// 登录
//+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete;
// 判断在不在职
+(void)getPersonLeave:(NSString*)code completeWithData:(void (^)(NSString *leaveData))complete;
// 根据工号读取人物信息
+(void)getPersonalInfo:(NSString*)code completeWithData:(void (^)(PeopleModeller*people))complete;

//根据工号获取人物头像
+(void)getPersonalImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete;

//根据工号获取来访者信息
+(void)getGuestInfo:(NSString*)code completeWithData:(void (^)(NSMutableArray*guestArr))complete;

//获取已经进厂的人员信息
+(void)getDidComGuestInfo:(NSString*)code guest:(NSArray*)ids things:(NSArray*)things completeWithData:(void (^)(NSMutableArray*guestArr))complete;

//根据资产编号获取资产信息
+(void)getThingsInfo:(NSString*)code completeWithData:(void (^)(ThingsModel*thing))complete;

// 获取待离开人员信息
+(void)getManufacturerInfo:(NSString *)code completeWithData:(void (^)(NSMutableArray*ar))complete;

// 获取确定离开人员信息
+(void)getleaveInfo:(NSString *)code ids:(NSMutableArray*)idsArr completeWithData:(void (^)(NSMutableArray*ar))complete;

// 获取厂商入厂信息
+(void)getPeopelInto:(NSString*)CallerId code:(NSString*)EmpCode Company:(NSString*)CompanyCode completeWithData:(void (^)(ChangShang*chang))complete;

// 厂商离厂
+(void)getPeopelOut:(NSString*)CallerId code:(NSString*)EmpCode Company:(NSString*)CompanyCode completeWithData:(void (^)(ChangShang*chang))complete;




@end
