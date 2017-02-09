//
//  BusModel.h
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusModel : NSObject

@property(nonatomic,copy)NSString *ShiftCode;
@property(nonatomic,copy)NSString *StartTime;
@property(nonatomic,copy)NSString* ModifyByName;
@property(nonatomic,copy)NSString  *PlateNumber;
@property(nonatomic,copy)NSString*Departure;
@property(nonatomic,copy)NSString *Destination;
@property(nonatomic,copy)NSString *ModifyBy;


+(BusModel*)getBus:(NSDictionary*)dicData;


@end
