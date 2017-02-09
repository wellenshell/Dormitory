//
//  GuestModel.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/15.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "GuestModel.h"

@implementation GuestModel

+(GuestModel*)getModelInfo:(NSDictionary*)dic{
    
    GuestModel *model = [[GuestModel alloc]init];
    model.guestId = [dic objectForKey:@"Id"];
    model.GuestCompany = [dic objectForKey:@"GuestCompany"];
    model.ReceptionName = [dic objectForKey:@"ReceptionName"];
    model.CheckTime = [dic objectForKey:@"CheckTime"];
    model.GuestItem = [dic objectForKey:@"GuestItem"];
    model.Plant = [dic objectForKey:@"Plant"];
    model.GuestName = [dic objectForKey:@"GuestName"];
    
    return model;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.guestId forKey:@"guestId"];
    [aCoder encodeObject:self.GuestCompany forKey:@"GuestCompany"];
    [aCoder encodeObject:self.ReceptionName forKey:@"ReceptionName"];
    [aCoder encodeObject:self.CheckTime forKey:@"CheckTime"];
    [aCoder encodeObject:self.GuestItem forKey:@"GuestItem"];
    [aCoder encodeObject:self.Plant forKey:@"Plant"];
    [aCoder encodeObject:self.GuestName forKey:@"GuestName"];

}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        
        self.guestId = [aDecoder decodeObjectForKey:@"guestId"];
        self.GuestCompany = [aDecoder decodeObjectForKey:@"GuestCompany"];
        self.ReceptionName = [aDecoder decodeObjectForKey:@"ReceptionName"];
        self.CheckTime = [aDecoder decodeObjectForKey:@"CheckTime"];
        self.GuestItem = [aDecoder decodeObjectForKey:@"GuestItem"];
        self.Plant = [aDecoder decodeObjectForKey:@"Plant"];
        self.GuestName = [aDecoder decodeObjectForKey:@"GuestName"];
       
    }
    return self;
}


@end
