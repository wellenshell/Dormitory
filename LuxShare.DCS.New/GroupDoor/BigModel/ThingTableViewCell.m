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
        _labNumber.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:15]];
        _labNumber.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labNumber];
        
        
        _labName = [[UILabel alloc]init];
        _labName.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:15]];
        _labName.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labName];
        _labName.sd_layout
        .leftSpaceToView(self,3)
        .topSpaceToView(_labNumber,10)
        .rightSpaceToView(self,0)
        .heightIs(40);
        
        _labPeson = [[UILabel alloc]init];
        _labPeson.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:15]];
        _labPeson.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labPeson];
        
        _labPeson.sd_layout
        .leftSpaceToView(self,3)
        .topSpaceToView(_labName,10)
        .rightSpaceToView(self,3)
        .heightIs(40);
        
        _labComany = [[UILabel alloc]init];
        _labComany.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:15]];
        _labComany.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labComany];
        _labComany.sd_layout
        .leftSpaceToView(self,3)
        .topSpaceToView(self.labPeson,10)
        .heightIs(40)
        .widthIs(10);
        
        _labDep = [[UILabel alloc]init];
        _labDep.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:15]];
        _labDep.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labDep];
        
        _labDep.sd_layout
        .rightSpaceToView(self,0)
        .topSpaceToView(_labComany,10)
        .leftSpaceToView(self,3)
        .heightIs(40);


    }
    return self;
}

-(CGSize)returnStringSize:(NSString*)string{
    
    CGSize size = [string sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:[UIFONT fontWithDevice:15]],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    return size;
}

























- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
