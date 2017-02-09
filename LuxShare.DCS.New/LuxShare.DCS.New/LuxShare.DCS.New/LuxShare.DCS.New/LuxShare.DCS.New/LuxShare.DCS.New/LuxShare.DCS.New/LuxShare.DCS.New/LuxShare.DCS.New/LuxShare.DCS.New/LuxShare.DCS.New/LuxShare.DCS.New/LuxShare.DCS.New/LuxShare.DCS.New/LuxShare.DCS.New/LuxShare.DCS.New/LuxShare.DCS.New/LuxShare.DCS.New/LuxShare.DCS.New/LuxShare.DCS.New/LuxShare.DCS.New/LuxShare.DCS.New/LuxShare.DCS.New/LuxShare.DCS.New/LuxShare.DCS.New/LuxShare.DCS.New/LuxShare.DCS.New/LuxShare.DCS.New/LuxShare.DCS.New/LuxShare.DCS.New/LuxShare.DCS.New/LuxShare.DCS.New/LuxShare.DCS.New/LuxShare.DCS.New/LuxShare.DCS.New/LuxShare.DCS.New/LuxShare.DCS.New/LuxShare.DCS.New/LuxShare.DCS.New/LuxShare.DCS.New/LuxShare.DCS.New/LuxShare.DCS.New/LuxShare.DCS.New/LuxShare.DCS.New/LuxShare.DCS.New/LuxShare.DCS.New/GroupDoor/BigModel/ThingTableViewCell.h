//
//  ThingTableViewCell.h
//  Luxshare.DCS
//
//  Created by MingMing on 16/7/21.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThingTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *labNumber;
@property(nonatomic,strong)UILabel *labName;
@property(nonatomic,strong)UILabel *labPeson;
@property(nonatomic,strong)UILabel *labComany;
@property(nonatomic,strong)UILabel *labDep;

-(id)initWithThings;
-(CGSize)returnStringSize:(NSString*)string;
@end
