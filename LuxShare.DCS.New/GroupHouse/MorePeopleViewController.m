//
//  MorePeopleViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "MorePeopleViewController.h"
#import "Header.h"
@interface MorePeopleViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    NSMutableArray *bigArr;
    
}

@end

@implementation MorePeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    tab  = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    bigArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    for (PeopleM *people in _peopleArr) {
        if ([people.LeaveType isKindOfClass:[NSNull class]]) {
            people.imgSmell = [UIImage imageNamed:@"Artboard"];
        }else{
            people.imgSmell = [UIImage imageNamed:@"Artboard Copy"];
        }
        
        [bigArr addObject:people];
        [tab reloadData];
        
    }
    
    
}
//点击返回按钮 用模态弹出的方式进行推出页面
-(void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//添加控件
-(void)creatView{
    
    //添加导航信息
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:14]];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"人员信息";
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:13]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return bigArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*flag = @"flAG";
    MoreTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MoreTableViewCell" owner:nil options:nil][0];
    }
    PeopleM *people = bigArr[indexPath.row];
    cell.imageTop.image = [_imagArr objectForKey:people.EmpCode];
    cell.imageOk.image = people.imgSmell;
    cell.labName.text = [NSString stringWithFormat:@"%@/%@",people.EmpName,people.Assets];
    cell.labZhiWei.text = people.DeptName;
    cell.labCode.text = people.EmpCode;
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
