//
//  ThingsModel.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/15.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThingsModel : NSObject


@property(nonatomic,copy)NSString*Code;
@property(nonatomic,copy)NSString*Model;
@property(nonatomic,copy)NSString*SaveBy;
@property(nonatomic,copy)NSString*SavedByName;
@property(nonatomic,copy)NSString*CompanyName;
@property(nonatomic,copy)NSString*SavedByDeptName;

+(ThingsModel*)getModelInfo:(NSDictionary*)dic;

@end
