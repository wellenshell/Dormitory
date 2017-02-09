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
    [self creatButton];
    
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@"门禁管理"];
    [self.view addSubview:bigView];
    
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = NO;
    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//添加扫描按钮点击事件
-(void)creatButton{
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
