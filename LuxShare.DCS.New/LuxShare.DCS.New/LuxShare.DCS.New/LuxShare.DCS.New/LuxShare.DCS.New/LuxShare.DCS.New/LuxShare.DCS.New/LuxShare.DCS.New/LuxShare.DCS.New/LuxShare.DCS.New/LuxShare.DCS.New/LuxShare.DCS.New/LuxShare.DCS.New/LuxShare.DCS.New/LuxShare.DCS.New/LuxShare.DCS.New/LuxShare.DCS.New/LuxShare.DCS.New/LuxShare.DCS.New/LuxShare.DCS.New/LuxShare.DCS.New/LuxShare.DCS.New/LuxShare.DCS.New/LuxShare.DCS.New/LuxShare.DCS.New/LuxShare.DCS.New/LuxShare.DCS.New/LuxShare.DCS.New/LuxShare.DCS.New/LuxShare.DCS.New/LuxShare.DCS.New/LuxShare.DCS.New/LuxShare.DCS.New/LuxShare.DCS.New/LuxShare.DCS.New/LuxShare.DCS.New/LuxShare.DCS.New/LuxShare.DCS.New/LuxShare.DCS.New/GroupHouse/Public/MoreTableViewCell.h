//
//  MoreTableViewCell.h
//  LuxShare.Scanning
//
//  Created by MingMing on 16/8/3.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageTop;
@property (weak, nonatomic) IBOutlet UIImageView *imageOk;
@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labZhiWei;
@property (weak, nonatomic) IBOutlet UILabel *labCode;

@end
