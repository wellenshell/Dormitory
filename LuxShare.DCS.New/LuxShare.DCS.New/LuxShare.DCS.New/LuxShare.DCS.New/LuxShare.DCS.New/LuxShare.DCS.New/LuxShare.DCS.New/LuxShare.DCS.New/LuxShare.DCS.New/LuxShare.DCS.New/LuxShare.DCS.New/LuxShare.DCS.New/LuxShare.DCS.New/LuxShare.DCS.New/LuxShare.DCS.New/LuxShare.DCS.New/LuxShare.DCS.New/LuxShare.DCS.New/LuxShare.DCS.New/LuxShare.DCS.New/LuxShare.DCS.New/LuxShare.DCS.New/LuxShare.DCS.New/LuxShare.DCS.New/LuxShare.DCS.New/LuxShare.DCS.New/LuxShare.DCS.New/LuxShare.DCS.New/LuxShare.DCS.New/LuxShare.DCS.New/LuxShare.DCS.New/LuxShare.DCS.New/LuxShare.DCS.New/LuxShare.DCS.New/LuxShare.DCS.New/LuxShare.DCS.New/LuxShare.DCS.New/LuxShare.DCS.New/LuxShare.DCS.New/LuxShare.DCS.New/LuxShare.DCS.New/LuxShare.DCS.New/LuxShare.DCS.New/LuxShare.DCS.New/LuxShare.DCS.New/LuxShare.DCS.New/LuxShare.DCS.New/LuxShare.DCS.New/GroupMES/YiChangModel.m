//
//  YiChangModel.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/8.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "YiChangModel.h"

@implementation YiChangModel

+(YiChangModel*)getYiChang:(NSDictionary*)dicData{
    
    YiChangModel *chang = [[YiChangModel alloc]init];
    chang.CompanyName = [dicData objectForKey:@"CompanyName"];
    chang.ProfitceterName = [dicData objectForKey:@"ProfitceterName"];
    chang.AreaDes = [dicData objectForKey:@"AreaDes"];
    chang.CaseName = [dicData objectForKey:@"CaseName"];
    chang.LeadersName = [dicData objectForKey:@"LeadersName"];
    chang.TypeDes = [dicData objectForKey:@"TypeDes"];
    chang.CatDes = [dicData objectForKey:@"CatDes"];
    chang.CatDDes = [dicData objectForKey:@"CatDDes"];
    if ([[dicData objectForKey:@"AddRemark"] isKindOfClass:[NSNull class]]) {
        chang.AddRemark = @"NULL";
    }else{
    chang.AddRemark = [dicData objectForKey:@"AddRemark"];
    }
    chang.CallByName = [dicData objectForKey:@"CallByName"];
    chang.CallTel = [dicData objectForKey:@"CallTel"];
    chang.CallTime = [dicData objectForKey:@"CallTime"];
    

    
    return chang;
}

@end
