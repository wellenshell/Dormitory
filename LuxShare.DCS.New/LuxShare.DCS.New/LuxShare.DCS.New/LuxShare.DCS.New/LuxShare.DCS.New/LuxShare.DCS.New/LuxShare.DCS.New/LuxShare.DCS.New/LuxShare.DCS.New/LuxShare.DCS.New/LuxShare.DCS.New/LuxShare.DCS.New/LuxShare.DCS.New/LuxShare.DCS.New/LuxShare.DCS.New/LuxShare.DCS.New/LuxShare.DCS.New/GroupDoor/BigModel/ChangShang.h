//
//  ChangShang.h
//  Luxshare.DCS
//
//  Created by MingMing on 16/8/17.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangShang : NSObject

@property(nonatomic,copy)NSString *CallerCorpName;
@property(nonatomic,copy)NSString *CallerID;
@property(nonatomic,copy)NSString* CallerName;
@property(nonatomic,copy)NSString  *Id;
@property(nonatomic,copy)NSString*PlanOutTime;





+(ChangShang*)getChangShang:(NSDictionary*)dicData;


@end
