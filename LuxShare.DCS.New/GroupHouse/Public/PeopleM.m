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
    
 
//    if ([[dicData objectForKey:@"LeaveDate"] isKindOfClass:[NSNull class]]) {
//        model.LeaveType = @"Null";
//    }else{
         model.LeaveType = [dicData objectForKey:@"LeaveDate"];
  //  }
    
    
    if ([[dicData objectForKey:@"CompanyCode"] isKindOfClass:[NSNull class]]) {
        model.CompanyCode = @"";
    }else{
        model.CompanyCode = [dicData objectForKey:@"CompanyCode"];
    }
    
    if ([[dicData objectForKey:@"Name"] isKindOfClass:[NSNull class]]) {
        model.EmpName = @"";
    }else{
       model.EmpName = [dicData objectForKey:@"Name"];
    }

    
    if ([[dicData objectForKey:@"Birthday"] isKindOfClass:[NSNull class]]) {
        model.Birthday = @"";
    }else{
        model.Birthday = [dicData objectForKey:@"Birthday"];
    }
    
    if ([[dicData objectForKey:@"Telephone"] isKindOfClass:[NSNull class]]) {
        model.Telephone = @"";
    }else{
         model.Telephone = [dicData objectForKey:@"Telephone"];
    }

    if ([[dicData objectForKey:@"EduExplain"] isKindOfClass:[NSNull class]]) {
        model.EduExplain = @"";
    }else{
        model.EduExplain = [dicData objectForKey:@"EduExplain"];
    }
    if ([[dicData objectForKey:@"School"] isKindOfClass:[NSNull class]]) {
        model.School = @"";
    }else{
        model.School = [dicData objectForKey:@"School"];
    }
    if ([[dicData objectForKey:@"Major"] isKindOfClass:[NSNull class]]) {
        model.Major = @"";
    }else{
        model.Major = [dicData objectForKey:@"Major"];
    }

    if ([[dicData objectForKey:@"Address"] isKindOfClass:[NSNull class]]) {
        model.Address = @"";
    }else{
       model.Address = [dicData objectForKey:@"Address"];
    }

    
    if ([[dicData objectForKey:@"GraduateDate"] isKindOfClass:[NSNull class]]) {
        model.GraduateDate = @"";
    }else{
       model.GraduateDate = [dicData objectForKey:@"GraduateDate"];
    }
    
    if ([[dicData objectForKey:@"IdentityCard"] isKindOfClass:[NSNull class]]) {
        model.IdentityCard = @"";
    }else{
        model.IdentityCard = [dicData objectForKey:@"IdentityCard"];
    }

    if ([[dicData objectForKey:@"ContractStart"] isKindOfClass:[NSNull class]]) {
        model.ContractStart = @"";
    }else{
         model.ContractStart = [dicData objectForKey:@"ContractStart"];
    }

    if ([[dicData objectForKey:@"SalaryLevelName"] isKindOfClass:[NSNull class]]) {
        model.SalaryLevelName = @"";
    }else{
         model.SalaryLevelName = [dicData objectForKey:@"SalaryLevelName"];
    }
    
    if ([[dicData objectForKey:@"DeptCode"] isKindOfClass:[NSNull class]]) {
        model.DeptCode = @"";
    }else{
         model.DeptCode = [dicData objectForKey:@"DeptCode"];
    }
    
    if ([[dicData objectForKey:@"Code"] isKindOfClass:[NSNull class]]) {
        model.EmpCode = @"";
    }else{
        model.EmpCode = [dicData objectForKey:@"Code"];
    }
       
    if ([[dicData objectForKey:@"Email"] isKindOfClass:[NSNull class]]) {
         model.Email = @"";
    }else{
        model.Email = [dicData objectForKey:@"Email"];
    }
    
    if ([[dicData objectForKey:@"TitleName"] isKindOfClass:[NSNull class]]) {
        model.TitleName= @"";
    }else{
        model.TitleName = [dicData objectForKey:@"TitleName"];
    }
    if ([[dicData objectForKey:@"DeptName"] isKindOfClass:[NSNull class]]) {
        model.DeptName = @"";
    }else{
        model.DeptName = [dicData objectForKey:@"DeptName"];
    }
    if ([[dicData objectForKey:@"CompanyName"] isKindOfClass:[NSNull class]]) {
         model.Assets  = @"";
    }else{
       model.Assets = [dicData objectForKey:@"CompanyName"];
    }
    if ([[dicData objectForKey:@"DirectBossEmpName"] isKindOfClass:[NSNull class]]) {
        model.DirectBossEmpName = @"";
    }else{
        model.DirectBossEmpName = [dicData objectForKey:@"DirectBossEmpName"];
    }

    if ([[dicData objectForKey:@"Gender"] isEqualToString:@"F"]) {
        model.Gender = @"女";
    }else{
        model.Gender = @"男";
    }
    if ([[dicData objectForKey:@"Dormitory"] isKindOfClass:[NSNull class]]) {
        model.Dormitory = @"";
    }else{
        model.Dormitory = [dicData objectForKey:@"Dormitory"];
    }

    
    return model;
}
@end
