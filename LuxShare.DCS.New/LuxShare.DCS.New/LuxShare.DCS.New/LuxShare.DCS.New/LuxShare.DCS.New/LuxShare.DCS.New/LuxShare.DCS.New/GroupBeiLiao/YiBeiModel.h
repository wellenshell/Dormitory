//
//  YiBeiModel.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/27.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YiBeiModel : NSObject
@property(nonatomic,copy)NSString*DemandTime;
@property(nonatomic,assign)NSInteger DemandQuantity;
@property(nonatomic,assign)NSInteger Status;
@property(nonatomic,assign)NSInteger ActualQuantity;
@property(nonatomic,copy)NSString*GetOrderTime;
@property(nonatomic,copy)NSString*Line;
@property(nonatomic,copy)NSString*MaterialCode;
@property(nonatomic,copy)NSString*MaterialName;
@property(nonatomic,copy)NSString*ProfitceterCode;
@property(nonatomic,copy)NSString*StockTime;
@property(nonatomic,copy)NSString*SignForTime;
@property(nonatomic,copy)NSString*ApplyTime;
@property(nonatomic,copy)NSString*WorkOrderCode;
@property(nonatomic,copy)NSString*Background;




@property(nonatomic,copy)NSString*StockEmpCode;
@property(nonatomic,copy)NSString*StockEmpName;
@property(nonatomic,copy)NSString*SignEmpCode;
@property(nonatomic,copy)NSString*SignEmpName;
@property(nonatomic,copy)NSString*ApplyEmpCode;
@property(nonatomic,copy)NSString*ApplyEmpName;




+(YiBeiModel*)getSmellModel:(NSDictionary*)dicData;
@end
