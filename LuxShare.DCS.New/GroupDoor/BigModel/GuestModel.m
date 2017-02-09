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
    
    if ([[dic objectForKey:@"Id"] isKindOfClass:[NSNull class]]) {
        model.guestId = @"null";
    }else{
        model.guestId = [dic objectForKey:@"Id"];
    }
    
    if ([[dic objectForKey:@"GuestCompany"] isKindOfClass:[NSNull class]]) {
         model.GuestCompany = @"null";
    }else{
        model.GuestCompany = [dic objectForKey:@"GuestCompany"];
    }
    
    if ([[dic objectForKey:@"ReceptionName"] isKindOfClass:[NSNull class]]) {
        model.ReceptionName = @"null";
    }else{
       model.ReceptionName = [dic objectForKey:@"ReceptionName"];
    }
    
    if ([[dic objectForKey:@"CheckTime"] isKindOfClass:[NSNull class]]) {
         model.CheckTime = @"null";
    }else{
        model.CheckTime = [dic objectForKey:@"CheckTime"];
    }
    
    if ([[dic objectForKey:@"GuestItem"] isKindOfClass:[NSNull class]]) {
        model.GuestItem = @"null";
    }else{
        model.GuestItem = [dic objectForKey:@"GuestItem"];
    }
    
    if ([[dic objectForKey:@"Plant"] isKindOfClass:[NSNull class]]) {
        model.Plant  = @"null";
    }else{
         model.Plant = [dic objectForKey:@"Plant"];
    }
    
    if ([[dic objectForKey:@"GuestName"] isKindOfClass:[NSNull class]]) {
        model.GuestName = @"null";
    }else{
         model.GuestName = [dic objectForKey:@"GuestName"];
    }
    

    
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
