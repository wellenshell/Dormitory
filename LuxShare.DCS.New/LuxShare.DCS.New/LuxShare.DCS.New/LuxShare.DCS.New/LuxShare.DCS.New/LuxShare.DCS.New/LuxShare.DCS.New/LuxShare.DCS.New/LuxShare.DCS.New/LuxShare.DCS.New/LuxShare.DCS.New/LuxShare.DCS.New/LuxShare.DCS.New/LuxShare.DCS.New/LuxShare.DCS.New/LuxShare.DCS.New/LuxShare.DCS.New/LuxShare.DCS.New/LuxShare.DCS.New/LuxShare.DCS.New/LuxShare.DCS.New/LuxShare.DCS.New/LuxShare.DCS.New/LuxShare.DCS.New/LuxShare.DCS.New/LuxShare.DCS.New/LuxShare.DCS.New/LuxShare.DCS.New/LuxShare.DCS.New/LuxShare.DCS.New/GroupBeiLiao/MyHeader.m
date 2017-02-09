//
//  MyHeader.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/26.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "MyHeader.h"
#import "Header.h"
@implementation MyHeader

-(id)initWithHeader{
    if (self == [super init]) {
        
     
        
    }
    return self;
}
-(CGSize)getString:(NSString*)str size:(NSInteger)number{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:number],NSFontAttributeName, nil]];
    
    return size;
}

@end
