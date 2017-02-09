//
//  KaoQinTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/30.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KaoQinTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UIImageView *nomalImage;
@property (weak, nonatomic) IBOutlet UILabel *nomalLab;
@property (weak, nonatomic) IBOutlet UILabel *nomalShang;
@property (weak, nonatomic) IBOutlet UILabel *noonShang;
@property (weak, nonatomic) IBOutlet UILabel *jiaShang;
@property (weak, nonatomic) IBOutlet UILabel *jiaTime;
@property (weak, nonatomic) IBOutlet UILabel *beiLab;
@property (weak, nonatomic) IBOutlet UILabel *noonXia;
@property (weak, nonatomic) IBOutlet UILabel *xiaXia;
@property (weak, nonatomic) IBOutlet UILabel *jiaXia;
@property (weak, nonatomic) IBOutlet UILabel *labTime;

@end
