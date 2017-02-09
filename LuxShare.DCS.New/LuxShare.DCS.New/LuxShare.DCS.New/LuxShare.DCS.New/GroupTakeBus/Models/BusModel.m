//
//  BusModel.m
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "BusModel.h"

@implementation BusModel


+(BusModel*)getBus:(NSDictionary*)dicData;{
    
    BusModel *model = [[BusModel alloc]init];
    model.ShiftCode = [dicData objectForKey:@"ShiftCode"];
    model.StartTime = [dicData objectForKey:@"StartTime"];
    model.PlateNumber = [dicData objectForKey:@"PlateNumber"];
    model.Departure = [dicData objectForKey:@"Departure"];
    model.Destination = [dicData objectForKey:@"Destination"];
    model.ModifyByName = [dicData objectForKey:@"ModifyByName"];
    model.ModifyBy = [dicData objectForKey:@"ModifyBy"];
    
    return model;
}

@end
