//
//  BeiLiaoViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/2.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "BeiLiaoViewController.h"
#import "WeiBeiLiaoViewController.h"
#import "YiBeiLiaoViewController.h"
#import "Model.h"

@interface BeiLiaoViewController ()

@end

@implementation BeiLiaoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@""];
    [self.view addSubview:bigView];
 
    WeiBeiLiaoViewController*wei = [[WeiBeiLiaoViewController alloc]init];
    wei.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:wei.view];
    [self addChildViewController:wei];
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"未完成",@"已完成"]];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    segment.frame = CGRectMake(self.view.frame.size.width/2-50, 30, 100, 30);
    segment.tintColor = [UIColor whiteColor];
    [bigView addSubview:segment];

    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = NO;
    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)segmentClick:(UISegmentedControl*)seg{
  
    if (seg.selectedSegmentIndex == 0) {
        WeiBeiLiaoViewController*wei = [[WeiBeiLiaoViewController alloc]init];
          wei.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:wei.view];
        [self addChildViewController:wei];


    }else{
        
        YiBeiLiaoViewController*yi = [[YiBeiLiaoViewController alloc]init];
          yi.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:yi.view];
        [self addChildViewController:yi];
        

    }
}
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
