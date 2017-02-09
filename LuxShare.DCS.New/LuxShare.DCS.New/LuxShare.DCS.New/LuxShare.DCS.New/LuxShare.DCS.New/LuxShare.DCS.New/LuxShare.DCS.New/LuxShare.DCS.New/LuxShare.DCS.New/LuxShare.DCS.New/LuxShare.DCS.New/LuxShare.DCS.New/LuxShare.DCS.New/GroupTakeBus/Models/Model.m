//
//  Model.m
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/27.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "Model.h"

@implementation Model

-(UIView *)returnTitleView:(NSString*)title{
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0,SCREENWIDTH, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.textColor = [UIColor whiteColor];
    lab.frame = CGRectMake(0, 20,SCREENWIDTH, 44);
    lab.userInteractionEnabled = YES;
    lab.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:17];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = title;
    [bigView addSubview:lab];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftBtn setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [lab addSubview:_leftBtn];
    _leftBtn.sd_layout
    .leftSpaceToView(lab,3)
    .heightIs(30)
    .widthIs(30)
    .topSpaceToView(lab,10);
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [lab addSubview:_rightBtn];
    _rightBtn.sd_layout
    .rightSpaceToView(lab,5)
    .heightIs(44)
    .widthIs(50)
    .topSpaceToView(lab,0);

    return bigView;
}
@end
