//
//  ThingsModel.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/15.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "ThingsModel.h"

@implementation ThingsModel

+(ThingsModel*)getModelInfo:(NSDictionary*)dic{
    ThingsModel *model = [[ThingsModel alloc]init];
    
    model.Code = [dic objectForKey:@"Code"];
    model.Model = [dic objectForKey:@"Model"];
    model.SaveBy = [dic objectForKey:@"SaveBy"];
    model.SavedByName = [dic objectForKey:@"SavedByName"];
    model.CompanyName = [dic objectForKey:@"CompanyName"];
    model.SavedByDeptName = [dic objectForKey:@"SavedByDeptName"];
  
  
    
    return model;

}

@end
