//
//  GongYingShangViewController.m
//  Luxshare.DCS
//
//  Created by MingMing on 16/8/10.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "GongYingShangViewController.h"

@interface GongYingShangViewController ()
{
    NSMutableArray *rightArr;
}
@end

@implementation GongYingShangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    kPublic;
    [self creatNav];
    rightArr = [[NSMutableArray alloc]initWithObjects:_changShang.CallerID,_changShang.CallerName, _changShang.CallerCorpName, _changShang.PlanOutTime,_time,nil];
    [self creatInfoView];

}
//添加导航条
-(void)creatNav{
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"供应商信息";
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    
   }
-(void)backBtnClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)creatInfoView{
    NSArray *leftArr = [[NSArray alloc]initWithObjects:@"客户编号:",@"客户姓名:", @"客户公司名称:", @"送货证有效期:", @"系统扫描时间:",  nil];
   
    for (int i = 0; i<5; i++) {
        UILabel *labLeft = [[UILabel alloc]init];
        labLeft.text = leftArr[i];
        labLeft.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:labLeft];
        labLeft.sd_layout
        .leftSpaceToView(self.view,20)
        .widthIs(130)
        .heightIs(30)
        .topSpaceToView(self.view,100+(i%5)*65);
        
        
        UILabel *labRight = [[UILabel alloc]init];
        labRight.numberOfLines = 0;
        labRight.text = rightArr[i];
        labRight.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:labRight];
        labRight.sd_layout
        .leftEqualToView(labLeft)
        .widthIs(self.view.frame.size.width-40)
        .autoHeightRatio(0)
        .topSpaceToView(labLeft,0);

        
    }
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
