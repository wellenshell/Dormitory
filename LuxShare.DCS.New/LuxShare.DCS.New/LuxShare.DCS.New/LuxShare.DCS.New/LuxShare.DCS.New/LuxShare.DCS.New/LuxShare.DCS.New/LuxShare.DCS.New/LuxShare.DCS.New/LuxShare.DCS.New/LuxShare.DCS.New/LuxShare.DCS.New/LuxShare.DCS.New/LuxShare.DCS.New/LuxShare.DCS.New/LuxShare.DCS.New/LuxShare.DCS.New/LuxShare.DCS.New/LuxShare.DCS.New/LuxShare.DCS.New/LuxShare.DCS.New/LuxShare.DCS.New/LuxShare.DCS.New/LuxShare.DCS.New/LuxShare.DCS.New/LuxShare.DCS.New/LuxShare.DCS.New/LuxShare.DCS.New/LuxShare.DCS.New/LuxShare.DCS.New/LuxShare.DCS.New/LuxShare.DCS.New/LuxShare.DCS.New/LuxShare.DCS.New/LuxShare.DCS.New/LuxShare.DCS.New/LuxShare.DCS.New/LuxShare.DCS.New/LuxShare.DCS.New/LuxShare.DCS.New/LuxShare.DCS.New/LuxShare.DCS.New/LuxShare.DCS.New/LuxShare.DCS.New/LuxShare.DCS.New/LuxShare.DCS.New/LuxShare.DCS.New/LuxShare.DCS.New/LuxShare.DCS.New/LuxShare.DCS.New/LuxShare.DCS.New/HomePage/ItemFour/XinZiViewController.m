//
//  XinZiViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/30.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "XinZiViewController.h"
#import "Header.h"
@interface XinZiViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    UIActivityIndicatorView*activity;
    NSMutableArray*dataArr;
}

@end

@implementation XinZiViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.title = @"缺勤记录";
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"coverpage_animation"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.dataSource = self;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(SCREENHEIGHT)
    .topSpaceToView(self.view,10);
    
    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center=self.view.center;
    activity.layer.cornerRadius = 10;
    activity.bounds = CGRectMake(0, 0, 100, 100);
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activity];
    [activity startAnimating];
    
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY/MM/dd"];
    NSString* dateStr = [formater stringFromDate:[NSDate date]];
    NSString *da = [NSString stringWithFormat:@"%@/%@/%@",[dateStr componentsSeparatedByString:@"/"][0],[dateStr componentsSeparatedByString:@"/"][1],@"01"];
    
    [HttpRequest QueQin:@"L037520" dt:da completeWithData:^(QueQinModel *que) {
        NSLog(@"--%@",que);
        [dataArr addObject:que];
      
        [tab reloadData];
        [activity stopAnimating];
    }];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
-(QueQinTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *queqin = @"queqin";
    QueQinTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:queqin];
    if (!cell) {
        cell = [[QueQinTableViewCell alloc]initWithQueQin];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    QueQinModel *model = [dataArr objectAtIndex:indexPath.row];
    cell.DeptName.text = model.DeptName;
    cell.DeptName.sd_layout.widthIs([cell getString:cell.DeptName.text].width);
    
    cell.EmpName.text = [NSString stringWithFormat:@"%@",model.EmpName];
    cell.EmpName.sd_layout.widthIs([cell getString:cell.EmpName.text].width);
    
    cell.DateTime.text = model.DateTime;
    cell.DateTime.sd_layout.widthIs([cell getString:cell.DateTime.text].width);
    
    cell.AbsenceTime.text = [NSString stringWithFormat:@"%@(%@个小时)",model.LeaveName,model.AbsenceTime];
    cell.AbsenceTime.sd_layout.widthIs([cell getString:cell.AbsenceTime.text].width);
    
    cell.Remark.text = model.Remark;
    cell.Remark.sd_layout.widthIs([cell getString:cell.Remark.text].width);
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
