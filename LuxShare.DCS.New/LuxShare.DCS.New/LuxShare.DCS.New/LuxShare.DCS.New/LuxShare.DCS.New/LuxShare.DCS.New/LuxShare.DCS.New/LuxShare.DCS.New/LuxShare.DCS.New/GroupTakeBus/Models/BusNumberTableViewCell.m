//
//  BusNumberTableViewCell.m
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "BusNumberTableViewCell.h"

@implementation BusNumberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithBusCell{
    if (self == [super init]) {
        
        _labTitle = [[UILabel alloc]init];
        _labTitle.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labTitle];
        _labTitle.sd_layout
        .leftSpaceToView(self,5)
        .rightSpaceToView(self,5)
        .heightIs(30)
        .topSpaceToView(self,3);
        
        _name  = [[UILabel alloc]init];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:14];
        [self addSubview:_name];
                
        _labCode = [[UILabel alloc]init];
        _labCode.font = [UIFont systemFontOfSize:14];
        _labCode.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labCode];
        
        
        _labStart = [[UILabel alloc]init];
        _labStart.textAlignment = NSTextAlignmentLeft;
        _labStart.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labStart];
        
        _labMu = [[UILabel alloc]init];
        _labMu.textAlignment = NSTextAlignmentLeft;
        _labMu.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labMu];
       
        
        _time = [[UILabel alloc]init];
        _time.textAlignment = NSTextAlignmentLeft;
        _time.font = [UIFont systemFontOfSize:14];
        [self addSubview:_time];
      
        
    }
    return self;
}
-(CGSize)returnStringSize:(NSString*)string{
    
    CGSize size = [string sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    return size;
}






















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
