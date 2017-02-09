//
//  QueQinTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/21.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "QueQinTableViewCell.h"
#import "Header.h"
@implementation QueQinTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithQueQin{
    if (self == [super init]) {
        
        UIView *view = [[UIView alloc]init];
        view.layer.cornerRadius = 10;
        view.backgroundColor = [UIColor whiteColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 0.5;
        [self addSubview:view];
        view.sd_layout
        .leftSpaceToView(self,10)
        .rightSpaceToView(self,10)
        .topSpaceToView(self,10)
        .bottomEqualToView(self);
        
        
        _labDeptName = [[UILabel alloc]init];
        _labDeptName.text = @"部门:";
        _labDeptName.textAlignment = NSTextAlignmentLeft;
        _labDeptName.font = [UIFont systemFontOfSize:14];
        [view addSubview:_labDeptName];
        _labDeptName.sd_layout
        .leftSpaceToView(view,5)
        .topSpaceToView(view,5)
        .heightIs(30)
        .widthIs([self getString:_labDeptName.text].width);
        
        _DeptName = [[UILabel alloc]init];
        _DeptName.textAlignment = NSTextAlignmentLeft;
        _DeptName.font = [UIFont systemFontOfSize:14];
        [view addSubview:_DeptName];
        _DeptName.sd_layout
        .leftSpaceToView(_labDeptName,5)
        .topEqualToView(_labDeptName)
        .heightIs(30)
        .widthIs(10);
        
        
        _labEmpName = [[UILabel alloc]init];
        _labEmpName.textAlignment = NSTextAlignmentLeft;
        _labEmpName.text = @"姓名:";
        _labEmpName.font = [UIFont systemFontOfSize:14];
        [view addSubview:_labEmpName];
        _labEmpName.sd_layout
        .leftSpaceToView(view,5)
        .topSpaceToView(_labDeptName,5)
        .heightIs(30)
        .widthIs([self getString:_labEmpName.text].width);
        
        _EmpName = [[UILabel alloc]init];
        _EmpName.textAlignment = NSTextAlignmentLeft;
        _EmpName.font = [UIFont systemFontOfSize:14];
        [view addSubview:_EmpName];
        _EmpName.sd_layout
        .leftSpaceToView(_labEmpName,5)
        .topEqualToView(_labEmpName)
        .heightIs(30)
        .widthIs(10);

        
        
        _labDateTime = [[UILabel alloc]init];
        _labDateTime.text = @"时间:";
        _labDateTime.textAlignment = NSTextAlignmentLeft;
        _labDateTime.font = [UIFont systemFontOfSize:14];
        [view addSubview:_labDateTime];
        _labDateTime.sd_layout
        .leftSpaceToView(view,5)
        .topSpaceToView(_labEmpName,5)
        .heightIs(30)
        .widthIs([self getString:_labDateTime.text].width);
        
        _DateTime = [[UILabel alloc]init];
        _DateTime.textAlignment = NSTextAlignmentLeft;
        _DateTime.font = [UIFont systemFontOfSize:14];
        [view addSubview:_DateTime];
        _DateTime.sd_layout
        .leftSpaceToView(_labDateTime,5)
        .topEqualToView(_labDateTime)
        .heightIs(30)
        .widthIs(10);

        
        
        _labAbsenceTime = [[UILabel alloc]init];
        _labAbsenceTime.text = @"时长:";
        _labAbsenceTime.textAlignment = NSTextAlignmentLeft;
        _labAbsenceTime.font = [UIFont systemFontOfSize:14];
        [view addSubview:_labAbsenceTime];
        _labAbsenceTime.sd_layout
        .leftSpaceToView(view,5)
        .topSpaceToView(_labDateTime,5)
        .heightIs(30)
        .widthIs([self getString:_labAbsenceTime.text].width);
        
        _AbsenceTime = [[UILabel alloc]init];
        _AbsenceTime.textAlignment = NSTextAlignmentLeft;
        _AbsenceTime.font = [UIFont systemFontOfSize:14];
        [view addSubview:_AbsenceTime];
        _AbsenceTime.sd_layout
        .leftSpaceToView(_labAbsenceTime,5)
        .topEqualToView(_labAbsenceTime)
        .heightIs(30)
        .widthIs(10);

        
        
        _labRemark = [[UILabel alloc]init];
        _labRemark.text = @"备注:";
        _labRemark.textAlignment = NSTextAlignmentLeft;
        _labRemark.font = [UIFont systemFontOfSize:14];
        [view addSubview:_labRemark];
        _labRemark.sd_layout
        .leftSpaceToView(view,5)
        .topSpaceToView(_labAbsenceTime,5)
        .heightIs(30)
        .widthIs([self getString:_labRemark.text].width);
        
        _Remark = [[UILabel alloc]init];
        _Remark.textAlignment = NSTextAlignmentLeft;
        _Remark.font = [UIFont systemFontOfSize:14];
        [view addSubview:_Remark];
        _Remark.sd_layout
        .leftSpaceToView(_labRemark,5)
        .topEqualToView(_labRemark)
        .heightIs(30)
        .widthIs(10);
    }
    return self;
}

-(CGSize)getString:(NSString*)str{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil]];
    
    return size;
}






















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
