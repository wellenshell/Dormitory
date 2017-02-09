//
//  PeopleModel.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/11.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleModeller : NSObject

@property(nonatomic,copy)NSString *EmpName;
@property(nonatomic,copy)NSString *EmpCode;
@property(nonatomic,copy)NSString* Gender;
@property(nonatomic,copy)NSString  *DeptName;
@property(nonatomic,copy)NSString*Title;
@property(nonatomic,copy)NSString *Assets;
@property(nonatomic,copy)NSString *leaveData;




+(PeopleModeller*)getPersonal:(NSDictionary*)dicData;

@end
