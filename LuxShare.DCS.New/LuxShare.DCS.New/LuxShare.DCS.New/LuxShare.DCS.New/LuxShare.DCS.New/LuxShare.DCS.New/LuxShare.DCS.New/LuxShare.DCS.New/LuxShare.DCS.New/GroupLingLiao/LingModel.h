//
//  LingModel.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/14.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LingModel : NSObject<NSCoding>


@property(nonatomic,copy)NSString *WorkOrderCode;
@property(nonatomic,copy)NSString*MaterialCode;
@property(nonatomic,copy)NSString*MaterialName;
@property(nonatomic,copy)NSString*Quantity;
@property(nonatomic,copy)NSString*ProfitceterCode;
@property(nonatomic,copy)NSString*EmpCode;
@property(nonatomic,copy)NSString*Line;
@property(nonatomic,assign)NSInteger DemandQuantity;
@property(nonatomic,copy)NSString*DemandTime;
@property(nonatomic,assign)NSInteger quanty;
+(LingModel*)getLineModel:(NSDictionary*)dicData;
@end
