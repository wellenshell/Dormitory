//
//  HttpRequest.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleM.h"
#import "BusModel.h"
#import "PeopleModel.h"
#import "PeopleModeller.h"
#import "ThingsModel.h"
#import "ChangShang.h"
#import "YiChangModel.h"
#import "LingModel.h"
#import "KaoQinModel.h"
#import "QueQinModel.h"
@interface HttpRequest : NSObject

//----------------------------宿舍
// 登录
+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete;
// 根据工号读取人物信息
+(void)getPersonInfo:(NSString*)code completeWithData:(void (^)(PeopleM*people))complete;

//根据工号获取人物头像
+(void)getPersonImage:(NSString*)code completeWithData:(void (^)(UIImage*imageData))complete;

//判断又没有权限
+(void)sendLoginRequest:(NSString*)code completeWithData:(void (^)(BOOL isSuccess))complete;


//----------------------------乘车
+(void)checkBusNumber:(NSString*)code completeWithData:(void (^)(BusModel*model))complete null:(void (^)(NSMutableArray*arr))complet;

//根据班次查询车的班次
+(void)checkBusPeople:(NSString*)shiftCode completeWithData:(void (^)(PeopleModel*model))complete;

//根据班次和人员列表更新数据
+(void)refushPeople:(NSString*)shiftCode list:(NSMutableArray*)empList completeWithData:(void (^)(PeopleModel*model))complete;

//----------------------------门禁
// 判断在不在职
+(void)getPersonLeave:(NSString*)code completeWithData:(void (^)(NSString *leaveData))complete;
// 根据工号读取人物信息
+(void)getPersonalInfo:(NSString*)code completeWithData:(void (^)(PeopleModeller*people))complete;

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


//-------------------------------生产异常
// 待处理的异常
+(void)getYiChang:(NSString *)code completeWithData:(void (^)(YiChangModel*yichang))complete;

//-------------------------------领料
//根据工号获取线别
+(void)getLine:(NSString*)code completeWithData:(void (^)(NSMutableArray*lineArr))complete;
//根据线别获取工单号
+(void)getGongDan:(NSString*)code line:(NSString*)line completeWithData:(void (^)(NSMutableArray*GongArr))complete;
//根据工单号获取料号列表
+(void)getLiaoHao:(NSString*)dan  code:(NSString*)EmpCode completeWithData:(void (^)(LingModel*ling))complete;
//下单

+(void)XiaDan:(NSString*)code line:(NSString*)line pro:(NSString*)pro work:(NSString*)workCode list:(NSMutableArray*)list completeWithData:(void (^)(BOOL isOk))complete;
//-----------------------------考勤
//考勤
+(void)kaoQin:(NSString*)EmpCode dt:(NSString*)td completeWithData:(void (^)( KaoQinModel*kao))complete;
//缺勤
+(void)QueQin:(NSString*)EmpCode dt:(NSString*)td completeWithData:(void (^)( QueQinModel*que))complete;
//-----------------------------备料
//未完成的领料单
+(void)getBeiLiao:(NSString*)code completeWithData:(void (^)(NSMutableArray*BeiArr))complete;
//已完成的领料单
+(void)getBeiLiaoYi:(NSString*)code completeWithData:(void (^)(NSMutableArray*BeiArr))complete;


//查询
//+(void)getBeiLiao:(NSString*)code completeWithData:(void (^)(NSMutableArray*BeiArr))complete;
//领单
+(void)getLingDan:(NSString*)code idd:(NSInteger)danId completeWithData:(void (^)(BOOL isLing))complete;
//确定修改
+(void)getChanged:(NSString*)code idd:(NSInteger)danId number:(NSInteger)aNumber completeWithData:(void (^)(NSInteger number))complete;
//备料完成
+(void)finish:(NSString*)code idd:(NSArray*)Ids completeWithData:(void (^)(BOOL isSure))complete;
@end
