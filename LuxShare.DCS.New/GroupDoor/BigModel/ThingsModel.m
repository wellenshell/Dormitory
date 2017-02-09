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
    
    if ([[dic objectForKey:@"Code"] isKindOfClass:[NSNull class]]) {
        model.Code = @" ";
    }else{
        model.Code = [dic objectForKey:@"Code"];
    }
    
    
    if ([[dic objectForKey:@"Model"] isKindOfClass:[NSNull class]]) {
        model.Model = @" ";
    }else{
       model.Model = [dic objectForKey:@"Model"];
    }
    if ([[dic objectForKey:@"SaveBy"] isKindOfClass:[NSNull class]]) {
        model.SaveBy = @" ";
    }else{
         model.SaveBy = [dic objectForKey:@"SaveBy"];
    }
    
    if ([[dic objectForKey:@"SavedByName"] isKindOfClass:[NSNull class]]) {
        model.SavedByName = @" ";
    }else{
       model.SavedByName = [dic objectForKey:@"SavedByName"];
    }
    
    
    if ([[dic objectForKey:@"CompanyName"] isKindOfClass:[NSNull class]]) {
        model.CompanyName = @" ";
    }else{
         model.CompanyName = [dic objectForKey:@"CompanyName"];
    }
    
    
    
    if ([[dic objectForKey:@"SavedByDeptName"] isKindOfClass:[NSNull class]]) {
        model.SavedByDeptName = @" ";
    }else{
          model.SavedByDeptName = [dic objectForKey:@"SavedByDeptName"];
    }

    
    return model;

}

@end
