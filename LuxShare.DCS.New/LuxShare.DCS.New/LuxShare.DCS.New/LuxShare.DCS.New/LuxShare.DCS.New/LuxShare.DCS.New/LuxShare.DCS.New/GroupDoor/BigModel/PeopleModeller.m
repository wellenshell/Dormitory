//
//  PeopleModel.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "PeopleModeller.h"

@implementation PeopleModeller

+(PeopleModeller*)getPersonal:(NSDictionary*)dicData{
    
    PeopleModeller *model = [[PeopleModeller alloc]init];
   
        model.EmpCode = [dicData objectForKey:@"EmpCode"];
        model.EmpName = [dicData objectForKey:@"EmpName"];
        model.Gender = [dicData objectForKey:@"Gender"];
        model.Assets = [dicData objectForKey:@"Assets"];
        
    if ([[dicData objectForKey:@"DeptName"] isKindOfClass:[NSNull class]]) {
        
        model.DeptName = @"NULL";
    }else{
        model.DeptName = [dicData objectForKey:@"DeptName"];
    }
    if ([[dicData objectForKey:@"Title"] isKindOfClass:[NSNull class]]) {
        
        model.Title  = @"NULL";
    }else{
        model.Title = [dicData objectForKey:@"Title"];
    }

    return model;
}
@end
