//
//  QueQinTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/21.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueQinTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel*labDateTime;
@property(nonatomic,strong)UILabel*labEmpName;
@property(nonatomic,strong)UILabel*labRemark;
@property(nonatomic,strong)UILabel*labDeptName;
@property(nonatomic,strong)UILabel*labAbsenceTime;
@property(nonatomic,strong)UILabel*labDid;

@property(nonatomic,strong)UILabel*DateTime;
@property(nonatomic,strong)UILabel*EmpName;
@property(nonatomic,strong)UILabel*Remark;
@property(nonatomic,strong)UILabel*DeptName;
@property(nonatomic,strong)UILabel*AbsenceTime;
@property(nonatomic,strong)UILabel*Did;


-(id)initWithQueQin;
-(CGSize)getString:(NSString*)str;

@end
