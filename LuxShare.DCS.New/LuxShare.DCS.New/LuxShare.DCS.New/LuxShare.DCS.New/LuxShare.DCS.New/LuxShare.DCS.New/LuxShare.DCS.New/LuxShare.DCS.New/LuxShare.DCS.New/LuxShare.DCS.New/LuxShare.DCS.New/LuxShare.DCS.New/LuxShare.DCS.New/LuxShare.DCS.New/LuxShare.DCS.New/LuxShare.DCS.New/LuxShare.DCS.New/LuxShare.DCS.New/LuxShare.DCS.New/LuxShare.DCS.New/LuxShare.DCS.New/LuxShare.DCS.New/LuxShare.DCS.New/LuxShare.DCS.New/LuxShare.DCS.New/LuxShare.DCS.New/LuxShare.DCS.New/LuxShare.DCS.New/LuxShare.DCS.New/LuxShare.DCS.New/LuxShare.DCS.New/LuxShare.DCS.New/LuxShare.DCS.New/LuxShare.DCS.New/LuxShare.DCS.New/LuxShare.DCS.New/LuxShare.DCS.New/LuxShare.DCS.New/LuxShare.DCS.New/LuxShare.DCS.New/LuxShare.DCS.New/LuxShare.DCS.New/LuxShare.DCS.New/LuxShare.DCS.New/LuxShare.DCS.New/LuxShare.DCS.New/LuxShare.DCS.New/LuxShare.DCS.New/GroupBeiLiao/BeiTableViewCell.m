//
//  BeiTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/14.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "BeiTableViewCell.h"
#import "Header.h"
@implementation BeiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(id)initWithBeiLiao{
    if (self == [super init]) {
        
//        _v = [[UIView alloc]init];
//        _v.backgroundColor = [UIColor whiteColor];
//        _v.layer.borderColor = [UIColor grayColor].CGColor;
//        _v.layer.borderWidth = .5;
//        [self addSubview:_v];
//        _v.sd_layout
//        .leftSpaceToView(self,5)
//        .rightSpaceToView(self,5)
//        .topSpaceToView(self,10)
//        .heightIs(150);
//
       

        
//        _gongDanLab = [[UILabel alloc]init];
//        _gongDanLab.text = @"工单";
//        _gongDanLab.font = [UIFont systemFontOfSize:14];
//        [self addSubview:_gongDanLab];
//        _gongDanLab.sd_layout
//        .leftSpaceToView(_leftButton,10)
//        .heightIs(25)
//        .widthIs([self getString:_gongDanLab.text size:14].width)
//        .topSpaceToView(self,10);
//        
//
//        
//        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self addSubview:_leftButton];
//        _leftButton.sd_layout
//        .leftSpaceToView(_lab,20)
//        .heightIs(30)
//        .widthIs(30)
//        .topSpaceToView(self,15);
        
        
        _labGongDan = [[UILabel alloc]init];
        _labGongDan.text = @"工单:";
        _labGongDan.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labGongDan];
        _labGongDan.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(25)
        .widthIs([self getString:_labGongDan.text size:15].width)
        .topSpaceToView(self,10);

        
        
        
        _gongDan = [[UILabel alloc]init];
        _gongDan.text = @"  工 单";
        _gongDan.textAlignment = NSTextAlignmentLeft;
        _gongDan.font = [UIFont systemFontOfSize:15];
        [self addSubview:_gongDan];
        _gongDan.sd_layout
        .leftSpaceToView(_labGongDan,5)
        .widthIs(10)
        .heightIs(25)
        .topSpaceToView(self,10);
        
        
        _labGongNumber = [[UILabel alloc]init];
        _labGongNumber.text = @"料号:";
        
        _labGongNumber.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labGongNumber];
        _labGongNumber.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(25)
        .widthIs([self getString:_labGongNumber.text size:15].width)
        .topSpaceToView(_labGongDan,4);

        
        _gongNumber = [[UILabel alloc]init];
        _gongNumber.text = @" (料号)";
        [self getReturnString:_gongNumber.text];
        _gongNumber.textAlignment = NSTextAlignmentLeft;
        _gongNumber.font = [UIFont systemFontOfSize:15];
        [self addSubview:_gongNumber];
        _gongNumber.sd_layout
        .leftSpaceToView(_labGongNumber,8)
        .topSpaceToView(_labGongDan,4)
        .heightIs(25)
        .widthIs(10);
        
        
        
        
        _pinMingLab = [[UILabel alloc]init];
        _pinMingLab.text = @"品名:";
        _pinMingLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_pinMingLab];
        _pinMingLab.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(25)
        .widthIs([self getString:_pinMingLab.text size:15].width)
        .topSpaceToView(_labGongNumber,5);
        
        
        _pinMing = [[UILabel alloc]init];
        _pinMing.text = @"品名";
        _pinMing.numberOfLines = 0;
        _pinMing.textColor = [UIColor colorWithRed:26.0/255.0 green:110.0/255.0 blue:269.0/255.0 alpha:1];
        _pinMing.textAlignment = NSTextAlignmentLeft;
        _pinMing.font = [UIFont systemFontOfSize:15];
        [self addSubview:_pinMing];
        _pinMing.sd_layout
        .leftSpaceToView(_pinMingLab,8)
        .topSpaceToView(_labGongNumber,4)
        .heightIs(25)
        .widthIs(10);
        
        
        _labName = [[UILabel alloc]init];
        _labName.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labName];
        _labName.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_pinMing,6)
        .heightIs(0)
        .widthIs(0);
        
//        _labStatue= [[UILabel alloc]init];
//        _labStatue.text = @"状态:";
//        _labStatue.textAlignment = NSTextAlignmentLeft;
//        _labStatue.font = [UIFont systemFontOfSize:14];
//        [self addSubview:_labStatue];
//        _labStatue.sd_layout
//        .rightSpaceToView(self,self.frame.size.width/2-60)
//        .topSpaceToView(self,10)
//        .heightIs(25)
//        .widthIs([self getString:_labStatue.text size:14].width);
       
      
        
        
//        _la = [[UIImageView alloc]init];
//        _imageRight.image = [UIImage imageNamed:@"ch"];
//        [self addSubview:_imageRight];
//        _imageRight.sd_layout
//        .rightSpaceToView(self,self.frame.size.width/2-60)
//        .topSpaceToView(_labGongDan,10)
//        .heightIs(20)
//        .widthIs(20);
        
        
        _tfNumber = [[UITextField alloc]init];
        _tfNumber.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _tfNumber.font = [UIFont systemFontOfSize:15];
        _tfNumber.textAlignment = NSTextAlignmentLeft;
        _tfNumber.borderStyle = UITextBorderStyleNone;
        [self addSubview:_tfNumber];
        _tfNumber.sd_layout
        .rightSpaceToView(self,0)
        .topSpaceToView(_labGongDan,10)
        .heightIs(20)
        .widthIs(60);

        _lab = [[UILabel alloc]init];
        _lab.text = @"  数量:";
        _lab.textAlignment = NSTextAlignmentLeft;
        _lab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_lab];
        _lab.sd_layout
        .rightSpaceToView(_tfNumber,5)
        .topSpaceToView(_labGongDan,10)
        .heightIs(20)
        .widthIs([self getString:_lab.text size:15].width);
        
        
        _statue= [[UILabel alloc]init];
        _statue.text = @"状态";
        _statue.layer.cornerRadius = 12;
        _statue.textColor = [UIColor whiteColor];
        _statue.clipsToBounds = YES;
        _statue.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:110.0/255.0 blue:269.0/255.0 alpha:1];
        _statue.textAlignment = NSTextAlignmentCenter;
        _statue.font = [UIFont systemFontOfSize:15];
        [self addSubview:_statue];
        _statue.sd_layout
        .leftEqualToView(_lab)
        .topSpaceToView(self,10)
        .heightIs(25)
        .widthIs(10);
        

        
        _labTime = [[UILabel alloc]init];
        _labTime.text = @"预计时间:";
        _labTime.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _labTime.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labTime];
        _labTime.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_labName,0)
        .heightIs(25)
        .widthIs([self getString:_labTime.text size:14].width+10);
        
        _time = [[UILabel alloc]init];
        _time.textAlignment = NSTextAlignmentCenter;
        _time.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _time.font = [UIFont systemFontOfSize:15];
        [self addSubview:_time];
        _time.sd_layout
        .leftSpaceToView(_labTime,0)
        .topSpaceToView(_labName,0)
        .heightIs(25)
        .widthIs(10);

        
       
        
        _labTimeStart = [[UILabel alloc]init];
        _labTimeStart.text = @"开始备料:";
        _labTimeStart.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _labTimeStart.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labTimeStart];
        _labTimeStart.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_labTime,0)
        .heightIs(25)
        .widthIs([self getString: @"开始备料:" size:15].width+10);

        
       
        _timeStart = [[UILabel alloc]init];
        _timeStart.textAlignment = NSTextAlignmentCenter;
        _timeStart.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _timeStart.font = [UIFont systemFontOfSize:15];
        [self addSubview:_timeStart];
        _timeStart.sd_layout
        .leftSpaceToView(_labTimeStart,0)
        .topSpaceToView(_labTime,0)
        .heightIs(25)
        .widthIs(10);

        
        
        
        
        
        

        
        
        

        
    }
    return self;
}
-(CGSize)getString:(NSString*)str size:(NSInteger)number{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:number],NSFontAttributeName, nil]];
    
    return size;
}



-(void)getReturnString:(NSString*)str{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName,[UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedStr setAttributes:dic range:NSMakeRange(1, str.length-2)];
    _gongNumber.attributedText = AttributedStr;
    
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
