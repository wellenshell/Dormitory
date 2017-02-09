//
//  BusNumberTableViewCell.h
//  LuxShare.TakeBus
//
//  Created by MingMing on 16/7/28.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface BusNumberTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong) UILabel *labTitle;
@property(nonatomic,strong)UILabel *labCode;
@property(nonatomic,strong)UILabel *labMu;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *labStart;
-(id)initWithBusCell;
-(CGSize)returnStringSize:(NSString*)string;
@end
