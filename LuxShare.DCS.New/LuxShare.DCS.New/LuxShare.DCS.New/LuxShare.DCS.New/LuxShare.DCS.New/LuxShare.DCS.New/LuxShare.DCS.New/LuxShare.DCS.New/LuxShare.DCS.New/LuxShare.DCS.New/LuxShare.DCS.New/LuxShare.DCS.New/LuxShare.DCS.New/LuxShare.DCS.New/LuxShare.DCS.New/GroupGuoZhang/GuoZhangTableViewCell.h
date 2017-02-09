//
//  GuoZhangTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/18.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface GuoZhangTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView*leftImage;
//@property(nonatomic,strong)UILabel*lab;
@property(nonatomic,strong)UILabel*gongDan;
@property(nonatomic,strong)UILabel*gongNumber;
@property(nonatomic,strong)UITextField *tfNumber;
@property(nonatomic,strong)UIImageView*imageRight;
@property(nonatomic,strong)UILabel*labTime;
@property(nonatomic,strong)UILabel*time;
@property(nonatomic,strong)UILabel*yuTime;
@property(nonatomic,strong)UIImageView*beiImage;
@property(nonatomic,strong)UIButton*leftButton;

-(id)initWithGuoZhang;
-(CGSize)getString:(NSString*)str size:(NSInteger)number;
-(void)getReturnString:(NSString*)str;

@end
