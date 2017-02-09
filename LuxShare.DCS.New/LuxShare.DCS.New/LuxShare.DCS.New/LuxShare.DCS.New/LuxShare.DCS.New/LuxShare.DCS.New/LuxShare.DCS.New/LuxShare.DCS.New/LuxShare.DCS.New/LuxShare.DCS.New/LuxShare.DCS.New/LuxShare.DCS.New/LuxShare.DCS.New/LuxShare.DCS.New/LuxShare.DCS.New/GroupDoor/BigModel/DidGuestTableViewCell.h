//
//  DidGuestTableViewCell.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/15.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DidGuestTableViewCell : UITableViewCell
@property (strong, nonatomic)  UILabel *labName;
@property (strong, nonatomic)  UILabel *labItems;
@property (strong, nonatomic)  UILabel *labReceptionName;
@property (strong, nonatomic)  UILabel *labTime;

-(id)initWithCell;
@end
