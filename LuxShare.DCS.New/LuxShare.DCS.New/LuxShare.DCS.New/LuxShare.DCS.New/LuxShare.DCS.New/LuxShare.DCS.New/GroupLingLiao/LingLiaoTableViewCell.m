//
//  LingLiaoTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/13.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "LingLiaoTableViewCell.h"
#import <SDAutoLayout.h>
@implementation LingLiaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithLingLiao{
    if (self == [super init]) {
        
//        UIView*v = [[UIView alloc]init];
//        v.backgroundColor = [UIColor whiteColor];
//        v.layer.borderColor = [UIColor grayColor].CGColor;
//        v.layer.borderWidth = .5;
//        [self addSubview:v];
//        v.sd_layout
//        .leftSpaceToView(self,5)
//        .rightSpaceToView(self,5)
//        .topSpaceToView(self,10)
//        .heightIs(110);
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        _leftButton.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(25)
        .widthIs(25)
        .topSpaceToView(self,10);
        
        _lab = [[UILabel alloc]init];
        _lab.text = @" 料号";
        _lab.textAlignment = NSTextAlignmentLeft;
        _lab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_lab];
        _lab.sd_layout
        .leftSpaceToView(_leftButton,5)
        .widthIs(40)
        .heightIs(30)
        .topSpaceToView(self,8);
        
        labNamed = [[UILabel alloc]init];
        labNamed.text = @"品名:";
        labNamed.font = [UIFont systemFontOfSize:14];
        [self addSubview:labNamed];
        labNamed.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_leftButton,3)
        .heightIs(30)
        .widthIs(40);

        
        
        _labName = [[UILabel alloc]init];
        _labName.numberOfLines = 0;
        _labName.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labName];
        _labName.sd_layout
        .leftSpaceToView(labNamed,2)
        .topSpaceToView(_leftButton,8)
        .heightIs(30)
        .widthIs(10);

        _labNumber = [[UILabel alloc]init];
        _labNumber.textAlignment = NSTextAlignmentLeft;
        _labNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labNumber];
        _labNumber.sd_layout
        .leftSpaceToView(_lab,5)
        .rightEqualToView(self)
        .heightIs(25)
        .topSpaceToView(self,12);
        
        
        _imageS = [[UIImageView alloc]init];
        _imageS.image = [UIImage imageNamed:@"ch"];
        [self addSubview:_imageS];
        _imageS.sd_layout
        .leftSpaceToView(self,13)
        .topSpaceToView(_labName,20)
        .heightIs(20)
        .widthIs(20);
        
        
        _tfNumber = [[UITextField alloc]init];
        _tfNumber.placeholder = @"需求数量";
        [_tfNumber setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
        _tfNumber.font = [UIFont systemFontOfSize:14];
        _tfNumber.textAlignment = NSTextAlignmentCenter;
        _tfNumber.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_tfNumber];
        _tfNumber.sd_layout
        .leftSpaceToView(_imageS,8)
        .topSpaceToView(_labName,13)
        .heightIs(30)
        .widthIs([self getString:@" 需求数量 " size:14].width+20);
        
        
        
        
        
        _tfTime = [UIButton buttonWithType:UIButtonTypeCustom];
         [_tfTime setTitle:@"需求时间" forState:UIControlStateNormal];
        [_tfTime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _tfTime.titleLabel.font = [UIFont systemFontOfSize:14];
        _tfTime.layer.cornerRadius = 8;
        _tfTime.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1].CGColor;
        _tfTime.layer.borderWidth = .6;
        [self addSubview:_tfTime];
        _tfTime.sd_layout
        .rightSpaceToView(self,10)
        .topSpaceToView(_labName,12)
        .heightIs(30)
        .widthIs(self.frame.size.width/2);

        _time = [[UIImageView alloc]init];
        _time.image = [UIImage imageNamed:@"changeAcount"];
        [self addSubview:_time];
        _time.sd_layout
        .rightSpaceToView(_tfTime,5)
        .topSpaceToView(_labName,20)
        .heightIs(20)
        .widthIs(20);

        
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
    _labNumber.attributedText = AttributedStr;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
