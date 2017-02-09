//
//  Thing.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/11/1.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "Thing.h"

@implementation Thing
+(Thing*)getModelInfo:(NSDictionary*)dic{
    Thing *model = [[Thing alloc]init];
    
    if ([[dic objectForKey:@"EmpCode"] isKindOfClass:[NSNull class]]) {
        model.EmpCode = @"null";
    }else{
        model.EmpCode = [dic objectForKey:@"EmpCode"];
    }
    
    
    if ([[dic objectForKey:@"EmpName"] isKindOfClass:[NSNull class]]) {
        model.EmpName = @"null";
    }else{
        model.EmpName = [dic objectForKey:@"EmpName"];
    }
    if ([[dic objectForKey:@"Gender"] isKindOfClass:[NSNull class]]) {
        model.Gender = @"null";
    }else{
        model.Gender = [dic objectForKey:@"Gender"];
    }
    
    if ([[dic objectForKey:@"DeptName"] isKindOfClass:[NSNull class]]) {
        model.DeptName = @"null";
    }else{
        model.DeptName = [dic objectForKey:@"DeptName"];
    }
    
    
    if ([[dic objectForKey:@"Title"] isKindOfClass:[NSNull class]]) {
        model.Title = @"null";
    }else{
        model.Title = [dic objectForKey:@"Title"];
    }
    
    
    
    if ([[dic objectForKey:@"Assets"] isKindOfClass:[NSNull class]]) {
        model.Assets = @"暂未登记";
    }else{
        model.Assets = [dic objectForKey:@"Assets"];
    }
    
    
    return model;
}
@end
