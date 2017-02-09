//
//  KaoQinModel.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/20.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "KaoQinModel.h"

@implementation KaoQinModel

+(KaoQinModel*)getKaoQin:(NSDictionary*)dic{
    KaoQinModel*kao = [[KaoQinModel alloc]init];
    
    
    kao.Riqi = [dic objectForKey:@"Riqi"];
    
 

    if ([[dic objectForKey:@"Daka1"] isKindOfClass:[NSNull class]]) {
        kao.Daka1 = @" ";
    }else{
        kao.Daka1 = [dic objectForKey:@"Daka1"];
    }
    if ([[dic objectForKey:@"Daka2"] isKindOfClass:[NSNull class]]) {
        kao.Daka2 = @" ";
    }else{
        kao.Daka2 = [dic objectForKey:@"Daka2"];
    }
    if ([[dic objectForKey:@"Daka3"] isKindOfClass:[NSNull class]]) {
        kao.Daka3 = @" ";
    }else{
        kao.Daka3 = [dic objectForKey:@"Daka3"];
    }
    if ([[dic objectForKey:@"Daka4"] isKindOfClass:[NSNull class]]) {
        kao.Daka4 = @" ";
    }else{
        kao.Daka4 = [dic objectForKey:@"Daka4"];
    }
    
    if ([[dic objectForKey:@"Beizhu"] isKindOfClass:[NSNull class]]) {
        kao.Beizhu = @" ";
    }else{
        kao.Beizhu = [dic objectForKey:@"Beizhu"];
    }
    
    
    
    return kao;
}

@end
