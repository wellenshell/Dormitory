//
//  Pubic.m
//  LuxShare
//
//  Created by MingMing on 16/7/23.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "Public.h"
#import <UIKit/UIKit.h>
@implementation Public
// 等比压缩图片
+(UIImage *)scaleToSize:(UIImage *)img size:( CGSize )size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}


@end
