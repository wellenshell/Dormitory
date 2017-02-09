//
//  BeiTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/14.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeiTableViewCell : UITableViewCell
//@property(nonatomic,strong)UIButton*leftButton;
//@property(nonatomic,strong)UIImageView*leftImage;



@property(nonatomic,strong)UIView*v;
@property(nonatomic,strong)UILabel*labGongDan;
@property(nonatomic,strong)UILabel*labGongNumber;
@property(nonatomic,strong)UILabel*gongDan;
@property(nonatomic,strong)UILabel*gongNumber;
@property(nonatomic,strong)UILabel*pinMingLab;
@property(nonatomic,strong)UILabel*pinMing;
@property(nonatomic,strong)UILabel*labStatue;
@property(nonatomic,strong)UILabel*statue;
@property(nonatomic,strong)UILabel*lab;


@property(nonatomic,strong)UITextField *tfNumber;
@property(nonatomic,strong)UIImageView*imageRight;
@property(nonatomic,strong)UILabel*labTime;
@property(nonatomic,strong)UILabel*time;

@property(nonatomic,strong)UILabel*labTimeStart;
@property(nonatomic,strong)UILabel*timeStart;
@property(nonatomic,strong)UILabel*labName;

-(id)initWithBeiLiao;
-(CGSize)getString:(NSString*)str size:(NSInteger)number;
-(void)getReturnString:(NSString*)str;
@end
