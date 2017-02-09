//
//  LingModel.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/14.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "LingModel.h"

@implementation LingModel
+(LingModel*)getLineModel:(NSDictionary*)dicData{
    LingModel *model = [[LingModel alloc]init];
    
    
    model.WorkOrderCode = [dicData objectForKey:@"WorkOrderCode"];
    model.MaterialCode = [dicData objectForKey:@"MaterialCode"];
    model.MaterialName = [dicData objectForKey:@"MaterialName"];
    model.Quantity = [dicData objectForKey:@"Quantity"];
    model.ProfitceterCode = [dicData objectForKey:@"ProfitceterCode"];
    
    
    return model;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.WorkOrderCode forKey:@"WorkOrderCode"];
    [aCoder encodeObject:self.MaterialCode forKey:@"MaterialCode"];
    [aCoder encodeObject:self.MaterialName forKey:@"MaterialName"];
    [aCoder encodeObject:self.Quantity forKey:@"Quantity"];
    [aCoder encodeObject:self.ProfitceterCode forKey:@"ProfitceterCode"];
    [aCoder encodeObject:self.EmpCode forKey:@"EmpCode"];
    [aCoder encodeObject:self.Line forKey:@"Line"];
    [aCoder encodeInteger:self.DemandQuantity forKey:@"DemandQuantity"];
    [aCoder encodeObject:self.DemandTime forKey:@"DemandTime"];
    
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        
        self.WorkOrderCode = [aDecoder decodeObjectForKey:@"WorkOrderCode"];
        self.MaterialCode = [aDecoder decodeObjectForKey:@"MaterialCode"];
        self.MaterialName = [aDecoder decodeObjectForKey:@"MaterialName"];
        self.Quantity = [aDecoder decodeObjectForKey:@"Quantity"];
        self.ProfitceterCode = [aDecoder decodeObjectForKey:@"ProfitceterCode"];
        self.EmpCode = [aDecoder decodeObjectForKey:@"EmpCode"];
        self.Line = [aDecoder decodeObjectForKey:@"Line"];
        self.DemandQuantity = [aDecoder decodeIntegerForKey:@"DemandQuantity"];
        self.DemandTime = [aDecoder decodeObjectForKey:@"DemandTime"];
        
    }
    return self;
}

@end
