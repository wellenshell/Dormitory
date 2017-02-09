//
//  QueQinModel.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/21.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "QueQinModel.h"

@implementation QueQinModel
+(QueQinModel*)getQueQin:(NSDictionary*)dic{
 
    QueQinModel*que = [[QueQinModel alloc]init];
    if ([[dic objectForKey:@"Remark"] isKindOfClass:[NSNull class]]) {
        que.Remark = @" ";
    }else{
        que.Remark = [dic objectForKey:@"Remark"];
    }
    if ([[dic objectForKey:@"AbsenceTime"] isKindOfClass:[NSNull class]]) {
        que.AbsenceTime = @" ";
    }else{
        que.AbsenceTime = [dic objectForKey:@"AbsenceTime"];
    }
    if ([[dic objectForKey:@"EmpName"] isKindOfClass:[NSNull class]]) {
        que.EmpName = @" ";
    }else{
        que.EmpName = [dic objectForKey:@"EmpName"];
    }
    if ([[dic objectForKey:@"EmpCode"] isKindOfClass:[NSNull class]]) {
        que.EmpCode = @" ";
    }else{
        que.EmpCode = [dic objectForKey:@"EmpCode"];
    }
    
    if ([[dic objectForKey:@"DeptName"] isKindOfClass:[NSNull class]]) {
        que.DeptName = @" ";
    }else{
        que.DeptName = [dic objectForKey:@"DeptName"];
    }
    if ([[dic objectForKey:@"DateTime"] isKindOfClass:[NSNull class]]) {
        que.DateTime = @" ";
    }else{
        que.DateTime = [dic objectForKey:@"DateTime"];
    }
    
    if ([[dic objectForKey:@"LeaveName"] isKindOfClass:[NSNull class]]) {
        que.LeaveName = @" ";
    }else{
        que.LeaveName = [dic objectForKey:@"LeaveName"];
    }

    if ([[dic objectForKey:@"Did"] isKindOfClass:[NSNull class]]) {
        que.Did = 1;
    }else{
        que.Did = [[dic objectForKey:@"Did"]integerValue];
    }
    return que;
}
@end
