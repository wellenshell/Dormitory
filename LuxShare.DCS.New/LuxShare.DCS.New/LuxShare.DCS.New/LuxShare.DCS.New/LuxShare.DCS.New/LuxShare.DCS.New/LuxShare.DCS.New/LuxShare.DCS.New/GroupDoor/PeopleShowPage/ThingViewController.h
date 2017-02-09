//
//  ThingViewController.h
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/14.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface ThingViewController : UIViewController

@property(nonatomic,strong)ThingsModel *model;
@property(nonatomic,strong)NSMutableArray *bigArr;
@end
