//
//  ThreeViewController.m
//  WPTabBarVC
//
//  Created by MingMing on 16/8/22.
//  Copyright © 2016年 HWP. All rights reserved.
//

#import "ThreeViewController.h"
#import "Header.h"
@interface ThreeViewController ()


@end

@implementation ThreeViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"审 核";
    self.navigationController.navigationBarHidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
