//
//  ThingViewController.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/14.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "ThingViewController.h"

@interface ThingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray *thingsArr;
    UITableView*tab;
    UIView *bigView;
}

@end

@implementation ThingViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_bigArr.count == 1) {
        tab.hidden = YES;
        //用来展示数据的数组
        thingsArr = [[NSMutableArray alloc]initWithObjects:_model.Code,_model.Model,_model.SavedByName,_model.SaveBy,_model.CompanyName,_model.SavedByDeptName, nil];
        NSLog(@"---%@",thingsArr);
        [self creatViewBig].hidden = NO;
        
    }else{
        
        tab.hidden = NO;
        [self creatViewBig].hidden = YES;
    }
 
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
    tab = [[UITableView alloc]init];
    tab.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    tab.dataSource = self;
    tab.delegate = self;
    [self.view addSubview:tab];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _bigArr.count;
}
-(ThingTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag = @"d";
    ThingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[ThingTableViewCell alloc]initWithThings];
        
    }
    cell.labNumber.text = @"";
    cell.labName.text = @"";
    cell.labNumber.text = @"";
    cell.labNumber.text = @"";
    cell.labNumber.text = @"";
    
    ThingsModel *model = _bigArr[indexPath.row];
    cell.labNumber.text = [NSString stringWithFormat:@"资产编号:%@",model.Code];
   CGSize size = [cell returnStringSize:cell.labNumber.text];
    
    cell.labNumber.sd_layout
    .leftSpaceToView(self,3)
    .topSpaceToView(self,5)
    .heightIs(30)
    .widthIs(size.width+10);
    
    cell.labName.text = [NSString stringWithFormat:@"资产型号:%@",model.Model];
    cell.labPeson.text = [NSString stringWithFormat:@"保管人:%@-%@",model.SavedByName,model.SaveBy];
    cell.labComany.text = [NSString stringWithFormat:@"公司名字:%@",model.CompanyName];
    
    CGSize sizeOne = [cell returnStringSize:cell.labComany.text];
    cell.labComany.sd_layout
    .leftSpaceToView(self,3)
    .topSpaceToView(cell.labPeson,5)
    .heightIs(30)
    .widthIs(sizeOne.width+25);

    cell.labDep.text = [NSString stringWithFormat:@"保管部门:%@",model.SavedByDeptName];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
//添加控件
-(void)creatView{
    
    //添加导航信息
    bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"资产信息";
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];

    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    
}

-(UIView*)creatViewBig{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    //添加资产信息
    
    NSArray *titleArr = @[@"资产编号:",@"资产名称:",@"保管人:",@"工号:",@"公司名字:",@"保管部门:"];
    float hei = (self.view.frame.size.height-64-100)/13;
    for (int i =0; i<6; i++) {
        
        CGSize size = [titleArr[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil]];
        
        UILabel *labName = [[UILabel alloc]init];
        labName.text = titleArr[i];
        labName.textAlignment = NSTextAlignmentLeft;
        labName.font = [UIFont systemFontOfSize:15];
        [view addSubview:labName];
        labName.sd_layout
        .leftSpaceToView(view,view.frame.size.width/4)
        .widthIs(size.width)
        .topSpaceToView(view,view.frame.size.height*.06+(i%6)*(hei+20))
        .heightIs(hei);
        
        
        
        
        UILabel *labDetail = [[UILabel alloc]init];
        labDetail.textAlignment = NSTextAlignmentLeft;
        labDetail.font = [UIFont systemFontOfSize:13];
        labDetail.textColor = [UIColor blackColor];
        labDetail.text = [NSString stringWithFormat:@"%@",thingsArr[i]];
        [view addSubview:labDetail];
        
        labDetail.sd_layout
        .leftSpaceToView(view,view.frame.size.width/4+80)
        .rightSpaceToView(view,0)
        .heightIs(hei)
        .topSpaceToView(view,view.frame.size.height*.06+(i%6)*(hei+20));
        
    }

    
    return view;
}
-(void)backBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
