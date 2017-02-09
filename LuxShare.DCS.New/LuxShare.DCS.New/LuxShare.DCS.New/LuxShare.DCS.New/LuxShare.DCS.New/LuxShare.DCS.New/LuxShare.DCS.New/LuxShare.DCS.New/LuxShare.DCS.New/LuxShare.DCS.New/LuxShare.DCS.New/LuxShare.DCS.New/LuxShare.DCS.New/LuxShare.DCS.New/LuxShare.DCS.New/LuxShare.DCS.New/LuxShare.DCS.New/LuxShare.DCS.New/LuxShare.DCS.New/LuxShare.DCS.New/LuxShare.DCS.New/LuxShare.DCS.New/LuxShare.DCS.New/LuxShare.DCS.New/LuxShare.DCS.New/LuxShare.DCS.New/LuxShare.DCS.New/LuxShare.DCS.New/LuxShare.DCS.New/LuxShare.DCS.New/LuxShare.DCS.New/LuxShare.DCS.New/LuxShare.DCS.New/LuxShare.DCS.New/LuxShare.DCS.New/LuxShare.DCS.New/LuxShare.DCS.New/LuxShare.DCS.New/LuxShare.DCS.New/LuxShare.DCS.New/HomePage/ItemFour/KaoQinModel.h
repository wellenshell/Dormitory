//
//  KaoQinModel.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/20.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KaoQinModel : NSObject
@property(nonatomic,copy)NSString*Riqi;
@property(nonatomic,copy)NSString*Daka1;
@property(nonatomic,copy)NSString*Daka2;
@property(nonatomic,copy)NSString*Daka3;
@property(nonatomic,copy)NSString*Daka4;
@property(nonatomic,copy)NSString*Beizhu;
+(KaoQinModel*)getKaoQin:(NSDictionary*)dic;
@end
