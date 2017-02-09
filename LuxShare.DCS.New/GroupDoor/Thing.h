//
//  Thing.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/11/1.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Thing : NSObject

@property(nonatomic,copy)NSString*EmpCode;
@property(nonatomic,copy)NSString*EmpName;
@property(nonatomic,copy)NSString*Gender;
@property(nonatomic,copy)NSString*DeptName;
@property(nonatomic,copy)NSString*Title;
@property(nonatomic,copy)NSString*Assets;

+(Thing*)getModelInfo:(NSDictionary*)dic;
@end
