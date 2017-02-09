//
//  VisitorTableViewCell.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/14.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitorTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *tfThings;
@property (weak, nonatomic) IBOutlet UILabel *tfPerson;
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (weak, nonatomic) IBOutlet UILabel *labBig;
@property (weak, nonatomic) IBOutlet UILabel *time;


@end
