//
//  FourViewController.m
//  WPTabBarVC
//
//  Created by MingMing on 16/8/22.
//  Copyright © 2016年 HWP. All rights reserved.
//

#import "FourViewController.h"
#import "Header.h"

@interface FourViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    NSArray *titleArr,*imageArr;
}
@end

@implementation FourViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"个人助手";
    
    if (self.navigationController.viewControllers.count >1) {
        self.tabBarController.tabBar.hidden =YES;
    }else {
        self.tabBarController.tabBar.hidden =NO;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];

       
    titleArr = [NSArray arrayWithObjects:@"个人考勤",@"缺勤记录", nil];
    imageArr = [NSArray arrayWithObjects:@"kaoqin",@"xinzi", nil];

    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    tab.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,0)
    .heightIs(self.view.frame.size.height-110);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return imageArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"tableCell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:tableCell];
    
    UIImageView *img = [cell viewWithTag:10];
    [img removeFromSuperview];
    
    UILabel *labb = [cell viewWithTag:11];
    [labb removeFromSuperview];

    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    UIImageView*ima = [[UIImageView alloc]init];
    ima.tag = 10;
    ima.image = [UIImage imageNamed:imageArr[indexPath.row]];
    [cell addSubview:ima];
    ima.sd_layout
    .leftSpaceToView(cell,20)
    .topSpaceToView(cell,13)
    .heightIs(30)
    .widthIs(30);
    
    UILabel *la = [[UILabel alloc]init];
    la.tag = 11;
    la.font = [UIFont systemFontOfSize:13];
    la.textAlignment = NSTextAlignmentCenter;
    la.text = titleArr[indexPath.row];
    la.textColor = [UIColor blackColor];
    [cell addSubview:la];
    la.sd_layout
    .leftSpaceToView(ima,0)
    .topEqualToView(cell)
    .bottomEqualToView(cell)
    .widthIs(100);

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
        KaoQinViewController *kaoQin = [[KaoQinViewController alloc]init];
        [self.navigationController pushViewController:kaoQin animated:YES];
    }else{
 
        XinZiViewController *xinZi = [[XinZiViewController alloc]init];
        [self.navigationController pushViewController:xinZi animated:YES];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
