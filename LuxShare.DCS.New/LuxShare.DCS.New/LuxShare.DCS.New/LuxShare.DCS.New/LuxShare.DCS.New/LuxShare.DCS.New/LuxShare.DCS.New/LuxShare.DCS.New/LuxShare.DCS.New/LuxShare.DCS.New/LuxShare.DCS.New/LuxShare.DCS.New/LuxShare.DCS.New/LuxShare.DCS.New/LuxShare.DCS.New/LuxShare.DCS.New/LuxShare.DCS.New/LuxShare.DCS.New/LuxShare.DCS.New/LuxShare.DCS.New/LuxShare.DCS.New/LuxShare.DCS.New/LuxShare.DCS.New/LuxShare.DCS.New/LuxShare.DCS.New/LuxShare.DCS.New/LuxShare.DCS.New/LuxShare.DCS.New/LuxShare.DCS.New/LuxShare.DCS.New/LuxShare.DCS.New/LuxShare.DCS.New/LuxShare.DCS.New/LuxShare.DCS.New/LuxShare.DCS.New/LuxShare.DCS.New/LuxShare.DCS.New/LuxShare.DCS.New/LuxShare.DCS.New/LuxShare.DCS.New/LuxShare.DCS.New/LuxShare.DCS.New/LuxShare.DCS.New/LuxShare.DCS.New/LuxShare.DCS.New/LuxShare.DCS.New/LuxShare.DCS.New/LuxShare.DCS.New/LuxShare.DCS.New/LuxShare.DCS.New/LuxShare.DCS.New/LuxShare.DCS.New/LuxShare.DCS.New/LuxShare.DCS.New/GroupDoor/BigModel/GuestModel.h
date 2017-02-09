//
//  GuestModel.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/15.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <Foundation/Foundation.h>
// 用归档的时候 要将所有的内容进行编码 解码
@interface GuestModel : NSObject<NSCoding>

@property(nonatomic,copy)NSString*guestId;
@property(nonatomic,copy)NSString*GuestCompany;
@property(nonatomic,copy)NSString*GuestName;
@property(nonatomic,copy)NSString*ReceptionName;
@property(nonatomic,copy)NSString*CheckTime;
@property(nonatomic,copy)NSString*GuestItem;
@property(nonatomic,copy)NSString*Plant;

+(GuestModel*)getModelInfo:(NSDictionary*)dic;
//编码
- (void)encodeWithCoder:(NSCoder *)aCoder;
//解码
- (id)initWithCoder:(NSCoder *)aDecoder;
@end
