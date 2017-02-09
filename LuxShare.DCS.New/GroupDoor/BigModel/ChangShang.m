//
//  ChangShang.m
//  Luxshare.DCS
//
//  Created by MingMing on 16/8/17.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "ChangShang.h"

@implementation ChangShang
+(ChangShang*)getChangShang:(NSDictionary*)dicData{
    
    ChangShang *chang = [[ChangShang alloc]init];
    
    
    if ([[dicData objectForKey:@"CallerCorpName"] isKindOfClass:[NSNull class]]) {
        chang.CallerCorpName = @"null";
    }else{
        chang.CallerCorpName = [dicData objectForKey:@"CallerCorpName"];
    }
    
    if ([[dicData objectForKey:@"CallerID"] isKindOfClass:[NSNull class]]) {
        chang.CallerID = @"null";
    }else{
        chang.CallerID = [dicData objectForKey:@"CallerID"];
    }
    
    if ([[dicData objectForKey:@"CallerName"] isKindOfClass:[NSNull class]]) {
        chang.CallerName = @"null";
    }else{
       chang.CallerName = [dicData objectForKey:@"CallerName"];
    }
    
    
    if ([[dicData objectForKey:@"Id"] isKindOfClass:[NSNull class]]) {
        chang.Id = @"null";
    }else{
         chang.Id = [dicData objectForKey:@"Id"];
    }
    
    if ([[dicData objectForKey:@"PlanOutTime"] isKindOfClass:[NSNull class]]) {
        chang.PlanOutTime = @"null";
    }else{
        chang.PlanOutTime = [dicData objectForKey:@"PlanOutTime"];
    }
    
    return chang;
}
@end
