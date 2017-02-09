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
    UIView*bigView;
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
  
    Model *model = [[Model alloc]init];
    UIView *big= [model returnTitleView:@"宿舍管理"];
    [self.view addSubview:big];
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = YES;
       [self.view addSubview:[self returnView]];
    
    UIButton* buttonPerson = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonPerson addTarget:self action:@selector(personButtonClick) forControlEvents:UIControlEventTouchUpInside];
    buttonPerson.layer.cornerRadius = (SCREENHEIGHT/10-20)/2;
    [buttonPerson setBackgroundImage:[UIImage imageNamed:@"Artboard 43 Copy 6"] forState:UIControlStateNormal];
    buttonPerson.layer.borderColor = [UIColor blackColor].CGColor;
    buttonPerson.layer.borderWidth = 1;
    buttonPerson.clipsToBounds = YES;
    [self.view addSubview:buttonPerson];
    buttonPerson.sd_layout
    .rightSpaceToView(self.view,30)
    .topSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/10-20)
    .widthEqualToHeight();
}
-(void)personButtonClick{
    UIAlertController*alert = [UIAlertController alertControllerWithTitle:@"是否退出登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"key"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        LoginView*login =[[LoginView alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];
        
    }];
    [alert addAction:action1];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
 
}


-(UIView*)returnView{
    if (bigView) {
        return bigView;
    }else{
        bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 20+SCREENHEIGHT/8, SCREENWIDTH, SCREENHEIGHT)];
        bigView.backgroundColor = [UIColor whiteColor];
        
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
            [bigView addSubview:button];
            button.sd_layout
            .leftSpaceToView(bigView,20)
            .topSpaceToView(bigView,30+(i%2)*(SCREENHEIGHT/8+20))
            .heightIs(SCREENHEIGHT/8)
            .widthIs(SCREENWIDTH-40);
            
            UIImageView*iameg =[[UIImageView alloc]init];
            iameg.image = [UIImage imageNamed:imageArr[i]];
            [button addSubview:iameg];
            iameg.sd_layout
            .leftSpaceToView(button,30)
            .topSpaceToView(button,10)
            .widthIs(button.bounds.size.height-20)
            .heightIs(button.bounds.size.height-20);
            
            UILabel*lab = [[UILabel alloc]init];
            lab.tag = i+1;
            lab.text= titleArr[i];
            lab.textColor = [UIColor blackColor];
            lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:24]];
            lab.textAlignment = NSTextAlignmentLeft;
            [button addSubview:lab];
            lab.sd_layout
            .leftSpaceToView(iameg,30)
            .rightSpaceToView(button,5)
            .topSpaceToView(button,5)
            .heightIs(button.bounds.size.height-10);
            
            
        }

        return bigView;
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
