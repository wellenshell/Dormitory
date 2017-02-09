//
//  PeopleModel.m
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "PeopleModel.h"

@implementation PeopleModel
+(PeopleModel*)getPeople:(NSDictionary*)dicData{
    PeopleModel *model = [[PeopleModel alloc]init];
    model.EmpCode = [dicData objectForKey:@"EmpCode"];
    model.EmpName = [dicData objectForKey:@"EmpName"];
    model.BookCancelTime = [dicData objectForKey:@"BookCancelTime"];
    model.DeptName = [dicData objectForKey:@"DeptName"];
    model.IsTake = [dicData objectForKey:@"IsTake"];

    return model;
 
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.EmpCode forKey:@"EmpCode"];
    [aCoder encodeObject:self.EmpName forKey:@"EmpName"];
    [aCoder encodeObject:self.DeptName forKey:@"DeptName"];
    [aCoder encodeObject:self.BookCancelTime forKey:@"BookCancelTime"];
    [aCoder encodeObject:self.IsTake forKey:@"IsTake"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        
        self.EmpName = [aDecoder decodeObjectForKey:@"EmpName"];
        self.EmpCode = [aDecoder decodeObjectForKey:@"EmpCode"];
        self.DeptName = [aDecoder decodeObjectForKey:@"DeptName"];
        self.BookCancelTime = [aDecoder decodeObjectForKey:@"BookCancelTime"];
        self.IsTake = [aDecoder decodeObjectForKey:@"IsTake"];
        
    }
    return self;
}

@end
