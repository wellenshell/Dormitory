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
    chang.CallerCorpName = [dicData objectForKey:@"CallerCorpName"];
    chang.CallerID = [dicData objectForKey:@"CallerID"];
    chang.CallerName = [dicData objectForKey:@"CallerName"];
    chang.Id = [dicData objectForKey:@"Id"];
    chang.PlanOutTime = [dicData objectForKey:@"PlanOutTime"];
   
    return chang;
}
@end
