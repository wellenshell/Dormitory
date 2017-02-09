//
//  YiBeiTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/27.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "YiBeiTableViewCell.h"
#import <SDAutoLayout.h>
@implementation YiBeiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithYiBeiLiao{
    if (self == [super init]) {
        
        
//        _labGongDan = [[UILabel alloc]init];
//        _labGongDan.text = @"工   单:";
//        _labGongDan.font = [UIFont systemFontOfSize:13];
//        [self addSubview:_labGongDan];
//        _labGongDan.sd_layout
//        .leftSpaceToView(self,10)
//        .heightIs(25)
//        .widthIs([self getString:_labGongDan.text size:13].width)
//        .topSpaceToView(self,10);
//        
//        
//        
//        
//        _GongDan = [[UILabel alloc]init];
//        _GongDan.text = @"  工 单";
//        _GongDan.textAlignment = NSTextAlignmentLeft;
//        _GongDan.font = [UIFont systemFontOfSize:13];
//        [self addSubview:_GongDan];
//        _GongDan.sd_layout
//        .leftSpaceToView(_labGongDan,5)
//        .widthIs(10)
//        .heightIs(25)
//        .topSpaceToView(self,10);
//        
//        
//        _labLiaoHao = [[UILabel alloc]init];
//        _labLiaoHao.text = @"料     号:";
//        _labLiaoHao.font = [UIFont systemFontOfSize:13];
//        [self addSubview:_labLiaoHao];
//        _labLiaoHao.sd_layout
//        .leftSpaceToView(_GongDan,20)
//        .heightIs(25)
//        .widthIs([self getString:_labLiaoHao.text size:13].width)
//        .topSpaceToView(self,10);
//        
//        
//        _liaoHao = [[UILabel alloc]init];
//        _liaoHao.text = @" (料号)";
//        _liaoHao.textAlignment = NSTextAlignmentLeft;
//        _liaoHao.font = [UIFont systemFontOfSize:13];
//        [self addSubview:_liaoHao];
//        _liaoHao.sd_layout
//        .leftSpaceToView(_labLiaoHao,5)
//        .topSpaceToView(self,10)
//        .heightIs(25)
//        .widthIs(10);
        
        
        
        _GongDan = [[UILabel alloc]init];
        _GongDan.attributedText = [self getString:@"工单(料号)" second:@"料号"];
        _GongDan.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_GongDan];
        _GongDan.sd_layout
        .leftSpaceToView(self,10)
        .widthIs([self getString:_GongDan.text size:12].width+30)
        .heightIs(25)
        .topSpaceToView(self,10);
        
        
        
        
        _liaoHao = [[UILabel alloc]init];
        _liaoHao.text = @" (料号)";
        _liaoHao.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_liaoHao];
        _liaoHao.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_GongDan,10)
        .heightIs(25)
        .widthIs(10);

        
        _labXuNumber = [[UILabel alloc]init];
        _labXuNumber.text = @"需求数量:";
        _labXuNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labXuNumber];
        _labXuNumber.sd_layout
        .leftSpaceToView(self,10)
        .heightIs(25)
        .widthIs([self getString:_labXuNumber.text size:14].width)
        .topSpaceToView(_liaoHao,10);
        
        
        _xuNumber = [[UILabel alloc]init];
        _xuNumber.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _xuNumber.text = @"xiqiushuliah";
        _xuNumber.textAlignment = NSTextAlignmentLeft;
        _xuNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:_xuNumber];
        _xuNumber.sd_layout
        .leftSpaceToView(_labXuNumber,5)
        .topSpaceToView(_liaoHao,10)
        .heightIs(25)
        .widthIs(10);
        
        
        
        _labShiNumber= [[UILabel alloc]init];
        _labShiNumber.text = @"实际数量:";
        _labShiNumber.textAlignment = NSTextAlignmentLeft;
        _labShiNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labShiNumber];
        _labShiNumber.sd_layout
        .leftSpaceToView(_xuNumber,40)
        .topSpaceToView(_liaoHao,10)
        .heightIs(25)
        .widthIs([self getString:_labShiNumber.text size:14].width);
        
        
        _shiNumber= [[UILabel alloc]init];
        _shiNumber.text = @"实际数量:";
        _shiNumber.textColor = [UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1];
        _shiNumber.textAlignment = NSTextAlignmentLeft;
        _shiNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:_shiNumber];
        _shiNumber.sd_layout
        .leftSpaceToView(_labShiNumber,5)
        .topSpaceToView(_liaoHao,10)
        .heightIs(25)
        .widthIs(10);
        
        _labShenQingRen= [[UILabel alloc]init];
        _labShenQingRen.text = @"申请人:";
        _labShenQingRen.textAlignment = NSTextAlignmentLeft;
        _labShenQingRen.font = [UIFont systemFontOfSize:13];
        [self addSubview:_labShenQingRen];
        _labShenQingRen.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_labXuNumber,10)
        .heightIs(25)
        .widthIs([self getString:_labShenQingRen.text size:13].width);
        
        
        _shenPeople = [[UILabel alloc]init];
        _shenPeople.text = @" sdacsjl/;:";
        _shenPeople.textAlignment = NSTextAlignmentLeft;
        _shenPeople.font = [UIFont systemFontOfSize:13];
        [self addSubview:_shenPeople];
        _shenPeople.sd_layout
        .leftSpaceToView(_labShenQingRen,5)
        .topSpaceToView(_labXuNumber,10)
        .heightIs(25)
        .widthIs([self getString:_shenPeople.text size:13].width);
        
        
        
        
        _labXuQiuTime = [[UILabel alloc]init];
        _labXuQiuTime.text = @"需求时间:";
        _labXuQiuTime.font = [UIFont systemFontOfSize:13];
        _labXuQiuTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labXuQiuTime];
        _labXuQiuTime.sd_layout
        .leftEqualToView(_labShiNumber)
        .topSpaceToView(_labShiNumber,10)
        .heightIs(25)
        .widthIs([self getString:_labXuQiuTime.text size:13].width);
        
        _xuQiuTime = [[UILabel alloc]init];
        _xuQiuTime.text = @"dcsxjbcjad:";
        _xuQiuTime.font = [UIFont systemFontOfSize:13];
        _xuQiuTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_xuQiuTime];
        _xuQiuTime.sd_layout
        .leftSpaceToView(_labXuQiuTime,5)
        .topSpaceToView(_labShiNumber,10)
        .heightIs(25)
        .widthIs(100);
        

        
        
        
        _labBeiPeople= [[UILabel alloc]init];
        _labBeiPeople.text = @"备料人:";
        _labBeiPeople.textAlignment = NSTextAlignmentLeft;
        _labBeiPeople.font = [UIFont systemFontOfSize:13];
        [self addSubview:_labBeiPeople];
        _labBeiPeople.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_labShenQingRen,10)
        .heightIs(25)
        .widthIs([self getString:_labBeiPeople.text size:13].width);
        
        
        _beiPeople = [[UILabel alloc]init];
        _beiPeople.text = @" sdacsjl/;:";
        _beiPeople.textAlignment = NSTextAlignmentLeft;
        _beiPeople.font = [UIFont systemFontOfSize:13];
        [self addSubview:_beiPeople];
        _beiPeople.sd_layout
        .leftSpaceToView(_labBeiPeople,5)
        .topSpaceToView(_labShenQingRen,10)
        .heightIs(25)
        .widthIs([self getString:_beiPeople.text size:13].width);
        
        
        
        
        _labBeiTime = [[UILabel alloc]init];
        _labBeiTime.text = @"备料时间:";
        _labBeiTime.font = [UIFont systemFontOfSize:13];
        _labBeiTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labBeiTime];
        _labBeiTime.sd_layout
        .leftEqualToView(_labShiNumber)
        .topSpaceToView(_labXuQiuTime,10)
        .heightIs(25)
        .widthIs([self getString:_labBeiTime.text size:13].width);
        
        _beiTime = [[UILabel alloc]init];
        _beiTime.text = @"dcsxjbcjad:";
        _beiTime.font = [UIFont systemFontOfSize:13];
        _beiTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_beiTime];
        _beiTime.sd_layout
        .leftSpaceToView(_labBeiTime,5)
        .topSpaceToView(_labXuQiuTime,10)
        .heightIs(25)
        .widthIs(100);
        

        
        
        
        
        
        _labQianPeople= [[UILabel alloc]init];
        _labQianPeople.text = @"签收人:";
        _labQianPeople.textAlignment = NSTextAlignmentLeft;
        _labQianPeople.font = [UIFont systemFontOfSize:13];
        [self addSubview:_labQianPeople];
        _labQianPeople.sd_layout
        .leftSpaceToView(self,10)
        .topSpaceToView(_labBeiPeople,10)
        .heightIs(25)
        .widthIs([self getString:_labQianPeople.text size:13].width);
        
        
        _qianPeople = [[UILabel alloc]init];
        _qianPeople.text = @" sdacsjl/;:";
        _qianPeople.textAlignment = NSTextAlignmentLeft;
        _qianPeople.font = [UIFont systemFontOfSize:13];
        [self addSubview:_qianPeople];
        _qianPeople.sd_layout
        .leftSpaceToView(_labQianPeople,5)
        .topSpaceToView(_labBeiPeople,10)
        .heightIs(25)
        .widthIs([self getString:_qianPeople.text size:13].width);
        
        
        
        
        _labQianTime = [[UILabel alloc]init];
        _labQianTime.text = @"签收时间:";
        _labQianTime.font = [UIFont systemFontOfSize:13];
        _labQianTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labQianTime];
        _labQianTime.sd_layout
        .leftEqualToView(_labShiNumber)
        .topSpaceToView(_labBeiTime,10)
        .heightIs(25)
        .widthIs([self getString:_labQianTime.text size:13].width);
        
        _qianTime = [[UILabel alloc]init];
        _qianTime.text = @"dcsxjbcjad:";
        _qianTime.font = [UIFont systemFontOfSize:13];
        _qianTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_qianTime];
        _qianTime.sd_layout
        .leftSpaceToView(_labQianTime,5)
        .topSpaceToView(_labBeiTime,10)
        .heightIs(25)
        .widthIs(100);

        
        
        
        
        
        
    }
    return self;
}
-(CGSize)getString:(NSString*)str size:(NSInteger)number{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:number],NSFontAttributeName, nil]];
    
    return size;
}

-(NSMutableAttributedString*)getString:(NSString*)str second:(NSString*)str1{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName,[UIColor colorWithRed:212.0/255.0 green:19.0/255.0 blue:29.0/255.0 alpha:1],NSForegroundColorAttributeName, nil];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedStr setAttributes:dic range:NSMakeRange(str.length-str1.length-2,str1.length+2)];
    [AttributedStr setAttributes:dic1 range:NSMakeRange(0,str.length-str1.length-2)];
    
    return AttributedStr;
}




























- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
