//
//  PeopleModel.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "PeopleM.h"
#import "Header.h"
@implementation PeopleM

+(PeopleM*)getPersonal:(NSDictionary*)dicData{
    
    PeopleM *model = [[PeopleM alloc]init];
    
 
        model.Birthday = [dicData objectForKey:@"Birthday"];
        model.Telephone = [dicData objectForKey:@"Telephone"];
        model.EduExplain = [dicData objectForKey:@"EduExplain"];
        model.School = [dicData objectForKey:@"School"];
        model.Major = [dicData objectForKey:@"Major"];
        model.Address = [dicData objectForKey:@"Address"];
        model.GraduateDate = [dicData objectForKey:@"GraduateDate"];
        model.IdentityCard = [dicData objectForKey:@"IdentityCard"];
        model.ContractStart = [dicData objectForKey:@"ContractStart"];
        model.SalaryLevelName = [dicData objectForKey:@"SalaryLevelName"];
        model.DeptCode = [dicData objectForKey:@"DeptCode"];
        model.EmpCode = [dicData objectForKey:@"Code"];
        model.EmpName = [dicData objectForKey:@"Name"];
        model.LeaveType = [dicData objectForKey:@"LeaveDate"];
        model.CompanyCode = [dicData objectForKey:@"CompanyCode"];
    
    if ([[dicData objectForKey:@"Email"] isKindOfClass:[NSNull class]]) {
         model.Email = @"Null";
    }else{
        model.Email = [dicData objectForKey:@"Email"];
    }
    
    if ([[dicData objectForKey:@"TitleName"] isKindOfClass:[NSNull class]]) {
        model.TitleName= @"NULL";
    }else{
        model.TitleName = [dicData objectForKey:@"TitleName"];
    }
    if ([[dicData objectForKey:@"DeptName"] isKindOfClass:[NSNull class]]) {
        model.DeptName = @"NULL";
    }else{
        model.DeptName = [dicData objectForKey:@"DeptName"];
    }
    if ([[dicData objectForKey:@"CompanyName"] isKindOfClass:[NSNull class]]) {
         model.Assets  = @"NULL";
    }else{
       model.Assets = [dicData objectForKey:@"CompanyName"];
    }

    
    if ([[dicData objectForKey:@"DirectBossEmpName"] isKindOfClass:[NSNull class]]) {
        model.DirectBossEmpName = @"Null";
    }else{
        model.DirectBossEmpName = [dicData objectForKey:@"DirectBossEmpName"];
    }

    if ([[dicData objectForKey:@"Gender"] isEqualToString:@"F"]) {
        model.Gender = @"女";
    }else{
        model.Gender = @"男";
    }
    
    
    return model;
}
@end
