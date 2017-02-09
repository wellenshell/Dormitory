//
//  Test.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/11/1.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "Test.h"
#import "Person.h"
@implementation Test

-(void)test1
{
    NSMutableArray<Person *> *arr = [NSMutableArray array];
    [arr addObject:[Person new]];
}


@end
