//
//  BusNumberViewController.m
//  LuxShare.Bus
//
//  Created by MingMing on 16/7/27.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "BusNumberViewController.h"
#import "Header.h"

@interface BusNumberViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    NSMutableArray *dataArr;
    UIActivityIndicatorView*activity;
}

@end

@implementation BusNumberViewController


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    [dataArr removeAllObjects];
    
    [HttpRequest checkBusNumber:name completeWithData:^(BusModel *model) {
        [activity stopAnimating];
        [dataArr addObject:model];
        [tab reloadData];
       
        
    } null:^(NSMutableArray *arr) {
        [activity stopAnimating];
        [dataArr addObjectsFromArray:arr];
        [tab reloadData];
       
    }];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
    self.tabBarController.tabBar.hidden =YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatLoginView];
    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center=self.view.center;
    activity.layer.cornerRadius = 10;
    activity.bounds = CGRectMake(0, 0, 100, 100);
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activity];
    [activity startAnimating];


   }
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

//添加视图
-(void)creatLoginView{
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@"班 次"];
    [self.view addSubview:bigView];
    
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = NO;
    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftSpaceToView(self.view,5)
    .rightSpaceToView(self.view,5)
    .topSpaceToView(bigView,5)
    .heightIs(self.view.frame.size.height-60);
}

// 表格有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArr.count;
  
}
//cell里面的内容
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag = @"a";
    BusNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[BusNumberTableViewCell alloc]initWithBusCell];
        cell.labTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    }
   
    BusModel *model = dataArr[indexPath.row];
    
    cell.labTitle.text = model.ShiftCode;
    cell.name.text = [NSString stringWithFormat:@"司机姓名:  %@",model.ModifyByName];
    cell.labStart.text = [NSString stringWithFormat:@"出发地:  %@", model.Departure];
    cell.labMu.text =[NSString stringWithFormat:@"目的地:  %@", model.Destination];
    cell.time.text = [NSString stringWithFormat:@"发车时间:  %@", model.StartTime];

    
    cell.name.sd_layout
    .leftSpaceToView(cell,5)
    .widthIs(cell.frame.size.width)
    .heightIs(20)
    .topSpaceToView(cell.labTitle,2);
    
    
    cell.labStart.sd_layout
    .leftSpaceToView(cell,5)
    .widthIs(cell.frame.size.width)
    .heightIs(20)
    .topSpaceToView(cell.name,2);

    
    cell.labMu.sd_layout
    .leftSpaceToView(cell,5)
    .widthIs(cell.frame.size.width)
    .heightIs(20)
    .topSpaceToView(cell.labStart,2);

    cell.time.sd_layout
    .leftSpaceToView(cell,5)
    .rightSpaceToView(cell,5)
    .heightIs(20)
    .topSpaceToView(cell.labMu,2);

    return cell;
}
// 返回cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
// 点击单元格 进入下一个页面（乘车）
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BusModel *model = dataArr[indexPath.row];
    TakeBusPeopleViewController *take = [[TakeBusPeopleViewController alloc]init];
    take.model = model;
    take.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:take animated:YES];
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
