//
//  PeopleModel.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PeopleM : NSObject
@property(nonatomic,copy)NSString *Birthday;
@property(nonatomic,copy)NSString *Telephone;
@property(nonatomic,copy)NSString *EduExplain;
@property(nonatomic,copy)NSString *School;
@property(nonatomic,copy)NSString *Major;
@property(nonatomic,copy)NSString *Address;
@property(nonatomic,copy)NSString *GraduateDate;
@property(nonatomic,copy)NSString *IdentityCard;
@property(nonatomic,copy)NSString *TitleName;
@property(nonatomic,copy)NSString *ContractStart;
@property(nonatomic,copy)NSString *Email;

@property(nonatomic,copy)NSString *SalaryLevelName;
@property(nonatomic,copy)NSString *DirectBossEmpName;
@property(nonatomic,copy)NSString *DeptCode;
@property(nonatomic,copy)NSString *EmpName;
@property(nonatomic,copy)NSString *EmpCode;
@property(nonatomic,copy)NSString *Gender;
@property(nonatomic,copy)NSString *DeptName;
@property(nonatomic,copy)NSString *Assets;
@property(nonatomic,copy)NSString *LeaveType;
@property(nonatomic,strong)UIImage *imgSmell;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,copy)NSString *titleN;
@property(nonatomic,copy)NSString *deName;
@property(nonatomic,copy)NSString *CompanyCode;
+(PeopleM*)getPersonal:(NSDictionary*)dicData;

@end
