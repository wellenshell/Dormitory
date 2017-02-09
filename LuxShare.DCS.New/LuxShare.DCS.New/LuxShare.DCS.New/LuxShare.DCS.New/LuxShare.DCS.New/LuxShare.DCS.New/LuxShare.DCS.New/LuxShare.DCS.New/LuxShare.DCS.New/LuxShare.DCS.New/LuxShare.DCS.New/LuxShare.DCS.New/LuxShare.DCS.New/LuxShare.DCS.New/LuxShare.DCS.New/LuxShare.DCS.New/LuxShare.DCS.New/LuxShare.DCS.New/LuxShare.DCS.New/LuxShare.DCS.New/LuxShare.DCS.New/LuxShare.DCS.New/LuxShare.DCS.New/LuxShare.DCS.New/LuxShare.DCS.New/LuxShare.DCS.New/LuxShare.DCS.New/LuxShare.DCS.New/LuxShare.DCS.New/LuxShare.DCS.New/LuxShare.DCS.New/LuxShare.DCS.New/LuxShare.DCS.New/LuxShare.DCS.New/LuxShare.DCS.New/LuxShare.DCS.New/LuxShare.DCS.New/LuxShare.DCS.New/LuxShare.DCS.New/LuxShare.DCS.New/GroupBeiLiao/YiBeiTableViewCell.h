//
//  YiBeiTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/27.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YiBeiTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel*labGongDan;
@property(nonatomic,strong)UILabel*GongDan;
@property(nonatomic,strong)UILabel*labLiaoHao;
@property(nonatomic,strong)UILabel*liaoHao;
@property(nonatomic,strong)UILabel*labXuNumber;
@property(nonatomic,strong)UILabel*xuNumber;
@property(nonatomic,strong)UILabel*labShiNumber;
@property(nonatomic,strong)UILabel*shiNumber;
@property(nonatomic,strong)UILabel*labShenQingRen;
@property(nonatomic,strong)UILabel*shenPeople;
@property(nonatomic,strong)UILabel*labXuQiuTime;
@property(nonatomic,strong)UILabel*xuQiuTime;
@property(nonatomic,strong)UILabel*labBeiPeople;
@property(nonatomic,strong)UILabel*beiPeople;
@property(nonatomic,strong)UILabel*labBeiTime;
@property(nonatomic,strong)UILabel*beiTime;
@property(nonatomic,strong)UILabel*labQianPeople;
@property(nonatomic,strong)UILabel*qianPeople;
@property(nonatomic,strong)UILabel*labQianTime;
@property(nonatomic,strong)UILabel*qianTime;
-(id)initWithYiBeiLiao;
-(CGSize)getString:(NSString*)str size:(NSInteger)number;
-(NSMutableAttributedString*)getString:(NSString*)str second:(NSString*)str1;
@end
