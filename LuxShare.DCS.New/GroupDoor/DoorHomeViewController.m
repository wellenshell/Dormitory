//
//  DoorHomeViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "DoorHomeViewController.h"
#import "Header.h"
@interface DoorHomeViewController ()//<UITableViewDataSource,UITableViewDelegate>
{
    UITableView*tab;
    //NSArray*titleArr,*imageArr;
    UIView*bigView;
}

@end

@implementation DoorHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.tabBarController.tabBar.hidden =YES;
    kPublic;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self returnView]];
    
    Model *model = [[Model alloc]init];
    UIView *big = [model returnTitleView:@"门禁管理"];
    [self.view addSubview:big];
    
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = YES;
  UIButton* buttonPerson = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonPerson addTarget:self action:@selector(personButtonClick) forControlEvents:UIControlEventTouchUpInside];
    buttonPerson.layer.cornerRadius = 35;
    [buttonPerson setBackgroundImage:[UIImage imageNamed:@"Artboard 43 Copy 6"] forState:UIControlStateNormal];
    buttonPerson.layer.borderColor = [UIColor blackColor].CGColor;
    buttonPerson.layer.borderWidth = 1;
    buttonPerson.clipsToBounds = YES;
    [self.view addSubview:buttonPerson];
    buttonPerson.sd_layout
    .rightSpaceToView(self.view,20)
    .topSpaceToView(self.view,40)
    .heightIs(70)
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
//添加扫描按钮点击事件
-(UIView*)returnView{
    if (bigView) {
        return bigView;
    }else{
        bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 140, SCREENWIDTH, SCREENHEIGHT)];
        bigView.backgroundColor = [UIColor whiteColor];
        
        NSArray*titleArr = [NSArray arrayWithObjects:@"扫描人员",@"查询人员",@"扫描资产",@"查询资产",@"厂商进入",@"厂商离开",@"访客进入",@"访客离开", nil];
        NSArray *imageArr = [NSArray arrayWithObjects:@"1-02",@"2-02",@"3-02",@"4-02",@"5-02",@"6-02",@"7-02",@"8-02", nil];
        for (int i =0 ; i<8; i++) {
            
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
            .leftSpaceToView(bigView,10+(i%2)*((SCREENWIDTH-22)/2))
            .topSpaceToView(bigView,26+(i/2)*((SCREENHEIGHT-140)/5))
            .heightIs((SCREENHEIGHT-140)/5)
            .widthIs((SCREENWIDTH-22)/2);
            
            UIImageView*iameg =[[UIImageView alloc]init];
            iameg.image = [UIImage imageNamed:imageArr[i]];
            [button addSubview:iameg];
            iameg.sd_layout
            .leftSpaceToView(button,20)
            .topSpaceToView(button,button.bounds.size.height/5)
            .widthIs(button.bounds.size.width/5)
            .heightIs(button.bounds.size.width/5);
            
            UILabel*lab = [[UILabel alloc]init];
            lab.tag = i+1;
            lab.text= titleArr[i];
            lab.textColor = [UIColor blackColor];
            lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:14]];
            lab.textAlignment = NSTextAlignmentLeft;
            [button addSubview:lab];
            lab.sd_layout
            .leftSpaceToView(iameg,8)
            .rightSpaceToView(button,5)
            .topSpaceToView(button,button.bounds.size.height/5)
            .heightIs(button.bounds.size.width/5);
        }
        

        
        
        return bigView;
    }
}
//-(void)creatButton{
//    
//   
//    
//  }
-(void)buttonClick:(UIButton*)button{
    
  
     NSArray*titleArr = [NSArray arrayWithObjects:@"扫描人员",@"查询人员",@"扫描资产",@"查询资产",@"厂商进入",@"厂商离开",@"访客进入",@"访客离开", nil];
    NSString *string = titleArr[button.tag-10];
    switch (button.tag)
    {
        case 10:
        {
            DoorScanningViewController *scan = [[DoorScanningViewController alloc]init];
            scan.titleText = string;
            scan.viewNumber = 10;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
        break;
        }
        case 11:
        {
            DoorCheckViewController *scan = [[DoorCheckViewController alloc]init];
            scan.titleText = string;
            scan.number = 11;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 12:
        {
            DoorScanningViewController *scan = [[DoorScanningViewController alloc]init];
            scan.titleText = string;
            scan.viewNumber = 12;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 13:
        {
            DoorCheckViewController *scan = [[DoorCheckViewController alloc]init];
            scan.titleText = string;
            scan.number = 13;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 14:
        {
            DoorScanningViewController *scan = [[DoorScanningViewController alloc]init];
            scan.titleText = string;
            scan.viewNumber = 14;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 15:
        {
            DoorScanningViewController *scan = [[DoorScanningViewController alloc]init];
            scan.titleText = string;
            scan.viewNumber = 15;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 16:{
            VisitorViewController *scan = [[VisitorViewController alloc]init];
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        case 17:
        {
            LeaveViewController *scan = [[LeaveViewController alloc]init];
            scan.number = 17;
            scan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scan animated:YES];
            break;
        }
        default:{
            break;
        }
    }
  }


//-(void)createTableView{
//    titleArr = [NSArray arrayWithObjects:@"扫描人员",@"扫描资产",@"厂商进入",@"访客进入",@"查询人员",@"查询资产",@"厂商离开",@"访客离开", nil];
//    imageArr = [NSArray arrayWithObjects:@"1-02",@"2-02",@"3-02",@"4-02",@"5-02",@"6-02",@"7-02",@"8-02", nil];
//    
//    tab = [[UITableView alloc]init];
//    tab.showsVerticalScrollIndicator = NO;
//    tab.delegate = self;
//    tab.dataSource = self;
//    [self.view addSubview:tab];
//    tab.sd_layout
//    .leftEqualToView(self.view)
//    .rightEqualToView(self.view)
//    .heightIs(SCREENHEIGHT-60)
//    .topSpaceToView(self.view,60);
//}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return titleArr.count;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 56;
//}
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString*tabCellId = @"tabcellid";
//    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:tabCellId];
//    
//    UIImageView *img = [cell viewWithTag:10];
//    [img removeFromSuperview];
//    
//    UILabel *labb = [cell viewWithTag:11];
//    [labb removeFromSuperview];
//    
//    
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tabCellId];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    
//    UIImageView*ima = [[UIImageView alloc]init];
//    ima.tag = 10;
//    ima.image = [UIImage imageNamed:imageArr[indexPath.row]];
//    [cell addSubview:ima];
//    ima.sd_layout
//    .leftSpaceToView(cell,20)
//    .topSpaceToView(cell,13)
//    .heightIs(30)
//    .widthIs(30);
//    
//    UILabel *la = [[UILabel alloc]init];
//    la.tag = 11;
//    la.font = [UIFont systemFontOfSize:13];
//    la.textAlignment = NSTextAlignmentCenter;
//    la.text = titleArr[indexPath.row];
//    la.textColor = [UIColor blackColor];
//    [cell addSubview:la];
//    la.sd_layout
//    .leftSpaceToView(ima,0)
//    .topEqualToView(cell)
//    .bottomEqualToView(cell)
//    .widthIs(100);
//    
//    
//    return cell;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    NSString *stateNumber = [NSString stringWithFormat:@"%ld",indexPath.row+10];
//    KChangeView(stateNumber,titleArr[indexPath.row]);
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
