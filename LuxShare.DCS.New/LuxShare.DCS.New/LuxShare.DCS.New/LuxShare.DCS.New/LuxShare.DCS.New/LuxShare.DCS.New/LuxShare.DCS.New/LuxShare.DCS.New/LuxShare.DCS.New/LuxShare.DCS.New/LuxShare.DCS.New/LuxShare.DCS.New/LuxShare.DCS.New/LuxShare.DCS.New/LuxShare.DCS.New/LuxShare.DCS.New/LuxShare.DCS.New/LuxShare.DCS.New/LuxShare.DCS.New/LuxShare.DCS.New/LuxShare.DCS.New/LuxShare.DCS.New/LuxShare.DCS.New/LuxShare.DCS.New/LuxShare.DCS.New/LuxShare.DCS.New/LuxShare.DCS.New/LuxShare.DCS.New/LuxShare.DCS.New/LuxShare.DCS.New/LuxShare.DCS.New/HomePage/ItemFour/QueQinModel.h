//
//  QueQinModel.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/21.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueQinModel : NSObject
@property(nonatomic,copy)NSString*DateTime;
@property(nonatomic,copy)NSString*LeaveName;
@property(nonatomic,copy)NSString*EmpName;
@property(nonatomic,copy)NSString*Remark;
@property(nonatomic,copy)NSString*EmpCode;
@property(nonatomic,copy)NSString*DeptName;
@property(nonatomic,copy)NSString*AbsenceTime;
@property(nonatomic,assign)NSInteger Did;

+(QueQinModel*)getQueQin:(NSDictionary*)dic;
@end
