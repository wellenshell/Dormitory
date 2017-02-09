//
//  UIFONT.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/30.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "UIFONT.h"

@implementation UIFONT

+(CGFloat)fontWithDevice:(CGFloat)fontSize{
    float with = [UIScreen mainScreen].bounds.size.width;
    if (with == 414) {
        fontSize = fontSize+2;
    }else if (with == 375){
        fontSize = fontSize+1.5;
    }else if (with == 320){
        fontSize = fontSize;
    }else if (with>414){
        fontSize = fontSize+20;
    }
        return fontSize;
}
@end
