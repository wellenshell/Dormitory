//
//  HouseViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "HouseViewController.h"
#import "Header.h"

@interface HouseViewController ()//<UITableViewDelegate,UITableViewDataSource>
{
  
  
   // UITableView*tab;
   // NSArray*titleArr,*imageArr;
}

@end


@implementation HouseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden =YES;
    kPublic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@"宿舍管理"];
    [self.view addSubview:bigView];
    
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = NO;
    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)createTableView{
    
    NSArray*titleArr = [NSArray arrayWithObjects:@"扫描人员",@"查询人员", nil];
    NSArray *imageArr = [NSArray arrayWithObjects:@"1-02",@"5-02", nil];
      for (int i =0 ; i<2; i++) {
          
          UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
          button.layer.cornerRadius = 6;
          button.layer.borderColor = [UIColor lightGrayColor].CGColor;
          button.layer.borderWidth = .5;
          button.tag = i+10;
          [button setUserInteractionEnabled:YES];
          button.backgroundColor = [UIColor whiteColor];
          [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
          [self.view addSubview:button];
          button.sd_layout
          .leftSpaceToView(self.view,10+(i%2)*((SCREENWIDTH-22)/2))
          .topSpaceToView(self.view,90+(i/2)*(80))
          .heightIs(79)
          .widthIs((SCREENWIDTH-22)/2);
          
          UIImageView*iameg =[[UIImageView alloc]init];
          iameg.image = [UIImage imageNamed:imageArr[i]];
          [button addSubview:iameg];
          iameg.sd_layout
          .leftSpaceToView(button,20)
          .topSpaceToView(button,18)
          .widthIs(40)
          .heightIs(40);
          
          UILabel*lab = [[UILabel alloc]init];
          lab.tag = i+1;
          lab.text= titleArr[i];
          lab.textColor = [UIColor blackColor];
          lab.font = [UIFont systemFontOfSize:14];
          lab.textAlignment = NSTextAlignmentLeft;
          [button addSubview:lab];
          lab.sd_layout
          .leftSpaceToView(iameg,8)
          .rightSpaceToView(button,5)
          .topSpaceToView(button,18)
          .heightIs(40);

        
    }

}

-(void)buttonClick:(UIButton*)button{
    if (button.tag == 10) {
        SaoMiaoViewController*scan = [[SaoMiaoViewController alloc]init];
        [self.navigationController pushViewController:scan animated:YES];
    }else{
        CheckPeopleViewController*check = [[CheckPeopleViewController alloc]init];
        [self.navigationController pushViewController:check animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
