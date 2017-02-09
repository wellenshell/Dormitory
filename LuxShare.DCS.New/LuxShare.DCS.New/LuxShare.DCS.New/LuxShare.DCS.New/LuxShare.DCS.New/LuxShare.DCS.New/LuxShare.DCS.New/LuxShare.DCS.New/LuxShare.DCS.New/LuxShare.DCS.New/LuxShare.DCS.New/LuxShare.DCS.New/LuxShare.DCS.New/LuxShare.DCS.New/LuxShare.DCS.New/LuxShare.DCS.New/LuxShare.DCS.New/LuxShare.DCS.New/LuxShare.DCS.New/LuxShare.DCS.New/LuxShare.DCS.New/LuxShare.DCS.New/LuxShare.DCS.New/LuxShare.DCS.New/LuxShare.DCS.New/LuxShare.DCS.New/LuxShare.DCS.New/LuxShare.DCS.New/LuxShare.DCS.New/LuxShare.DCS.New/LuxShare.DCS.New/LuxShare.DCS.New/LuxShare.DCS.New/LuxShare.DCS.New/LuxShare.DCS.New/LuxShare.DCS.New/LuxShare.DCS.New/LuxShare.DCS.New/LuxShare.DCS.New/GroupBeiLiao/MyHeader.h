//
//  MyHeader.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/26.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MyHeader : UITableViewHeaderFooterView

@property(nonatomic,strong)myButton *button;
@property(nonatomic,strong)UILabel*labChang;
@property(nonatomic,strong)UILabel*Chang;
@property(nonatomic,strong)UILabel*labLi;
@property(nonatomic,strong)UILabel*Li;
@property(nonatomic,strong)UILabel*labLine;
@property(nonatomic,strong)UILabel*Line;
@property(nonatomic,strong)UILabel*labGongDan;
@property(nonatomic,strong)UILabel*GongDan;

-(id)initWithHeader;
-(CGSize)getString:(NSString*)str size:(NSInteger)number;
@end
