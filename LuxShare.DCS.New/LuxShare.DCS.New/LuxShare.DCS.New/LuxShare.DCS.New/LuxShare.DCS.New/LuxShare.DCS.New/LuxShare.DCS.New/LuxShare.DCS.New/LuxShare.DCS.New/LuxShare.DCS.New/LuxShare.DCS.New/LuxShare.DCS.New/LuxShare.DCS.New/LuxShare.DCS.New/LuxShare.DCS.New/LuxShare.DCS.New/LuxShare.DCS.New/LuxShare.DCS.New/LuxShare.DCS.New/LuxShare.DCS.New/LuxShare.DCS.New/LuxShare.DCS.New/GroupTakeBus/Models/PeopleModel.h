//
//  PeopleModel.h
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleModel : NSObject<NSCoding>

@property(nonatomic,copy)NSString *EmpCode;
@property(nonatomic,copy)NSString *EmpName;
@property(nonatomic,copy)NSString* DeptName;
@property(nonatomic,copy)NSString  *IsTake;
@property(nonatomic,copy)NSString*BookCancelTime;



+(PeopleModel*)getPeople:(NSDictionary*)dicData;


@end
