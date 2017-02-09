//
//  GuoZhangTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/18.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "GuoZhangTableViewCell.h"

@implementation GuoZhangTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithGuoZhang{
    if (self == [super init]) {
//        
//        UIView*v = [[UIView alloc]init];
//        v.backgroundColor = [UIColor whiteColor];
//        v.layer.borderColor = [UIColor grayColor].CGColor;
//        v.layer.borderWidth = .5;
//        [self addSubview:v];
//        v.sd_layout
//        .leftSpaceToView(self,5)
//        .rightSpaceToView(self,5)
//        .topSpaceToView(self,10)
//        .heightIs(120);
        
//        _leftImage = [[UIImageView alloc]init];
//        _leftImage.image = [UIImage imageNamed:@"lineBie"];
//        [v addSubview:_leftImage];
//        _leftImage.sd_layout
//        .leftSpaceToView(v,10)
//        .heightIs(25)
//        .widthIs(20)
//        .topSpaceToView(v,10);
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        _leftButton.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(30)
        .widthIs(30)
        .topSpaceToView(self,10);

        
//        _lab = [[UILabel alloc]init];
//        _lab.text = @"  线别";
//        _lab.textAlignment = NSTextAlignmentLeft;
//        _lab.font = [UIFont systemFontOfSize:14];
//        [v addSubview:_lab];
//        _lab.sd_layout
//        .leftSpaceToView(_leftImage,5)
//        .widthIs([self getString:_lab.text size:14].width)
//        .heightIs(30)
//        .topSpaceToView(v,8);
        
        _gongDan = [[UILabel alloc]init];
        _gongDan.text = @"  工 单";
        _gongDan.textAlignment = NSTextAlignmentLeft;
        _gongDan.font = [UIFont systemFontOfSize:14];
        [self addSubview:_gongDan];
        _gongDan.sd_layout
        .leftSpaceToView(self,5)
        .widthIs(10)
        .heightIs(30)
        .topSpaceToView(_leftButton,10);
        
        
        _gongNumber = [[UILabel alloc]init];
        _gongNumber.text = @" (料号)";
        [self getReturnString:_gongNumber.text];
        _gongNumber.textAlignment = NSTextAlignmentLeft;
        _gongNumber.font = [UIFont systemFontOfSize:12];
        [self addSubview:_gongNumber];
        _gongNumber.sd_layout
        .leftSpaceToView(self,8)
        .topSpaceToView(_gongDan,0)
        .heightIs(20)
        .widthIs(10);
        
        _yuTime = [[UILabel alloc]init];
        _yuTime.text = @"预：16-09-10 14:20";
        _yuTime.textColor = [UIColor blackColor];
        _yuTime.font = [UIFont systemFontOfSize:12];
        [self addSubview:_yuTime];
        _yuTime.sd_layout
        .rightSpaceToView(self,5)
        .widthIs([self getString:_yuTime.text size:12].width)
        .heightIs(25)
        .topSpaceToView(self,10);
        
        
        _beiImage = [[UIImageView alloc]init];
        _beiImage.image = [UIImage imageNamed:@"bei"];
        [self addSubview:_beiImage];
        _beiImage.sd_layout
        .rightSpaceToView(_yuTime,10)
        .topSpaceToView(self,10)
        .widthIs(40)
        .heightIs(40);
        
        
        _imageRight = [[UIImageView alloc]init];
        _imageRight.image = [UIImage imageNamed:@"ch"];
        [self addSubview:_imageRight];
        _imageRight.sd_layout
        .rightSpaceToView(self,self.frame.size.width/2-70)
        .topSpaceToView(_leftButton,0)
        .heightIs(20)
        .widthIs(20);
        
        
        _tfNumber = [[UITextField alloc]init];
        _tfNumber.textColor = [UIColor redColor];
        _tfNumber.font = [UIFont systemFontOfSize:14];
        _tfNumber.textAlignment = NSTextAlignmentCenter;
        _tfNumber.borderStyle = UITextBorderStyleNone;
        _tfNumber.enabled = NO;
        [self addSubview:_tfNumber];
        _tfNumber.sd_layout
        .leftSpaceToView(_imageRight,2)
        .topSpaceToView(_leftButton,0)
        .heightIs(30)
        .widthIs(30);
        
        
        
        _labTime = [[UILabel alloc]init];
        _labTime.text = @"备:";
        _labTime.textColor = [UIColor orangeColor];
        _labTime.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:_labTime];
        _labTime.sd_layout
        .rightSpaceToView(self,self.frame.size.width/2-40)
        .topSpaceToView(_imageRight,15)
        .heightIs(30)
        .widthIs([self getString:_labTime.text size:13].width);
        
        
        
        _time = [[UILabel alloc]init];
        _time.text = @"16-09-10 15:30";
        _time.backgroundColor = [UIColor orangeColor];
        _time.layer.cornerRadius = 10;
        _time.clipsToBounds = YES;
        _time.textAlignment = NSTextAlignmentCenter;
        _time.textColor = [UIColor whiteColor];
        _time.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:_time];
        _time.sd_layout
        .leftSpaceToView(_labTime,5)
        .topSpaceToView(_imageRight,17)
        .heightIs(25)
        .widthIs([self getString:_time.text size:13].width+10);
        
        
    }
    return self;
}
-(CGSize)getString:(NSString*)str size:(NSInteger)number{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:number],NSFontAttributeName, nil]];
    
    return size;
}


-(void)getReturnString:(NSString*)str{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedStr setAttributes:dic range:NSMakeRange(1, str.length-2)];
    _gongNumber.attributedText = AttributedStr;
    
}


@end
