//
//  MESTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/8.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MESTableViewCell : UITableViewCell


@property (strong, nonatomic)  UIView *cellView;
@property (strong, nonatomic)  UILabel *labName;
@property (strong, nonatomic)  UILabel *cname;
@property (strong, nonatomic)  UILabel *liCenter;
@property (strong, nonatomic)  UILabel *qu;
@property (strong, nonatomic)  UILabel *ling;
@property (strong, nonatomic)  UILabel *dds;
@property (strong, nonatomic)  UILabel *ds;
@property (strong, nonatomic)  UILabel *time;
@property (strong, nonatomic)  UILabel *tep;
@property (strong, nonatomic)  UILabel *zhuan;
@property (strong, nonatomic)  UILabel *yichang;
@property (strong, nonatomic)  UILabel *rema;
@property (strong, nonatomic)  UILabel *name;
@property (strong, nonatomic)  UILabel *labcOMP;
@property (strong, nonatomic)  UILabel *labZhuan;
@property (strong, nonatomic)  UILabel *labYI;
@property (strong, nonatomic)  UILabel *labrema;
@property (strong, nonatomic)  UILabel *lanTEP;
@property (strong, nonatomic)  UILabel *labLi;
@property (strong, nonatomic)  UILabel *labDS;
@property (strong, nonatomic)  UILabel *labLing;
@property (strong, nonatomic)  UILabel *labTime;
@property (strong, nonatomic)  UILabel *labQu;
@property (strong, nonatomic)  UILabel *labDDS;
-(id)initWithMES;
-(CGSize)getString:(NSString*)str;
@end
