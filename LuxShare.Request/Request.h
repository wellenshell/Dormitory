//
//  Request.h
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/27.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
#import "BusModel.h"
#import "PeopleModel.h"
@interface Request : NSObject

//// 登录
//+(void)sendLoginRequest:(NSString*)code pasword:(NSString*)password completeWithData:(void (^)(BOOL isSuccess))complete;
//根据司机工号查询车的班次
+(void)checkBusNumber:(NSString*)code completeWithData:(void (^)(BusModel*model))complete null:(void (^)(NSMutableArray*arr))complet;

//根据班次查询车的班次
+(void)checkBusPeople:(NSString*)shiftCode completeWithData:(void (^)(PeopleModel*model))complete;

//根据班次和人员列表更新数据
+(void)refushPeople:(NSString*)shiftCode list:(NSMutableArray*)empList completeWithData:(void (^)(PeopleModel*model))complete;


@end
