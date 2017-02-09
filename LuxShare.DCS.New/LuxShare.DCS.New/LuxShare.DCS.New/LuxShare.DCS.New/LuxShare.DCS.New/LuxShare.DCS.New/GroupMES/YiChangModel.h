//
//  YiChangModel.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/8.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YiChangModel : NSObject


@property(nonatomic,copy)NSString*CompanyName;
@property(nonatomic,copy)NSString*ProfitceterName;
@property(nonatomic,copy)NSString*CaseName;
@property(nonatomic,copy)NSString*AreaDes;
@property(nonatomic,copy)NSString*LeadersName;
@property(nonatomic,copy)NSString*TypeDes;
@property(nonatomic,copy)NSString*CatDDes;
@property(nonatomic,copy)NSString*CatDes;
@property(nonatomic,copy)NSString*AddRemark;

@property(nonatomic,copy)NSString*CallByName;
@property(nonatomic,copy)NSString*CallTel;
@property(nonatomic,copy)NSString*CallTime;


+(YiChangModel*)getYiChang:(NSDictionary*)dicData;
@end
