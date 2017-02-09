//
//  ThingTableViewCell.m
//  Luxshare.DCS
//
//  Created by MingMing on 16/7/21.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "ThingTableViewCell.h"
#import "Header.h"
@implementation ThingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithThings{
    if (self == [super init]) {
        
        _labNumber = [[UILabel alloc]init];
        _labNumber.font = [UIFont systemFontOfSize:15];
        _labNumber.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labNumber];
        
        
        _labName = [[UILabel alloc]init];
        _labName.font = [UIFont systemFontOfSize:15];
        _labName.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labName];
        
        _labName.sd_layout
        .leftSpaceToView(_labNumber,3)
        .topSpaceToView(self,5)
        .rightSpaceToView(self,0)
        .heightIs(30);
        
        _labPeson = [[UILabel alloc]init];
        _labPeson.font = [UIFont systemFontOfSize:15];
        _labPeson.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labPeson];
        
        _labPeson.sd_layout
        .leftSpaceToView(self,3)
        .topSpaceToView(_labNumber,5)
        .rightSpaceToView(self,3)
        .heightIs(30);
        
        _labComany = [[UILabel alloc]init];
        _labComany.font = [UIFont systemFontOfSize:15];
        _labComany.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labComany];
        
        
        _labDep = [[UILabel alloc]init];
        _labDep.font = [UIFont systemFontOfSize:15];
        _labDep.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labDep];
        
        _labDep.sd_layout
        .rightSpaceToView(self,0)
        .topSpaceToView(_labPeson,5)
        .leftSpaceToView(_labComany,3)
        .heightIs(30);


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
