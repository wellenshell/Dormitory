//
//  TakeBusPeopleViewController.m
//  LuxShare.Bus
//
//  Created by MingMing on 16/7/27.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "TakeBusPeopleViewController.h"
#import "Header.h"
@interface TakeBusPeopleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView*tab;
    NSMutableArray *peopleArr;
    NSMutableArray *codelist;
    NSMutableArray *codeArr;
    NSMutableDictionary *nameDic;
    UILabel *lab;
}
@end

@implementation TakeBusPeopleViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //进行网络请求
    codelist = [[NSMutableArray alloc]initWithCapacity:0];
    peopleArr = [[NSMutableArray alloc]initWithCapacity:0];
    codeArr = [[NSMutableArray alloc]initWithCapacity:0];
    nameDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    NSFileManager* fileManager=[NSFileManager defaultManager];
    [fileManager removeItemAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleA.plist"] error:nil];
    [fileManager removeItemAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleB.plist"] error:nil];
    [HttpRequest checkBusPeople:_model.ShiftCode completeWithData:^(PeopleModel *model) {
        [peopleArr addObject:model];
        [tab reloadData];
        [codeArr addObject:model.EmpCode];
        [nameDic setObject:model.EmpName forKey:model.EmpCode];
        [codeArr writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleA.plist"] atomically:YES];
        [nameDic writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleB.plist"] atomically:YES];
        lab.text = [NSString stringWithFormat:@"%ld",peopleArr.count];
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    kPublic;
    [self creatView];
   
    
}
//＊＊＊＊＊添加大的视图
-(void)creatView{
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@" 人 员"];
    model.rightBtn.hidden = YES;
    [model.leftBtn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigView];

    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setTitle:@"扫描" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:rightBtn];
    rightBtn.sd_layout
    .rightSpaceToView(bigView,5)
    .heightIs(44)
    .widthIs(40)
    .topSpaceToView(bigView,20);

    lab = [[UILabel alloc]init];
    lab.layer.cornerRadius = 10;
    lab.textColor = [UIColor whiteColor];
    [bigView addSubview:lab];
    lab.sd_layout
    .rightSpaceToView(bigView,50)
    .topEqualToView(rightBtn)
    .widthIs(40)
    .heightIs(44);

    
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftSpaceToView(self.view,5)
    .rightSpaceToView(self.view,5)
    .topSpaceToView(bigView,8)
    .heightIs(self.view.frame.size.height- 120);
    
  
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1]];
     button.layer.cornerRadius = 10;
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.sd_layout
    .leftSpaceToView(self.view,40)
    .rightSpaceToView(self.view,40)
    .bottomSpaceToView(self.view,5)
    .heightIs(40);

}
//＊＊＊＊＊＊返回有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return peopleArr.count;
}
//＊＊＊＊＊＊每一行的数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag = @"v";
    BusNumberTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[BusNumberTableViewCell alloc]initWithBusCell];
        cell.labTitle.font = [UIFont systemFontOfSize:14];
    }
   
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     PeopleModel*model = peopleArr[indexPath.row];
    
    cell.labTitle.text = [NSString stringWithFormat:@"姓名/工号:  %@/%@",model.EmpName,model.EmpCode];
    cell.name.text = [NSString stringWithFormat:@"部门:  %@",model.DeptName];
    CGSize size = [cell returnStringSize:cell.name.text];
  
    
    cell.name.sd_layout
    .leftSpaceToView(cell,5)
    .widthIs(size.width)
    .heightIs(20)
    .topSpaceToView(cell.labTitle,2);
   
    
    UIButton *btnState = [UIButton buttonWithType:UIButtonTypeCustom];
    btnState.tag = indexPath.row+10;
    [btnState setTitle:@"未乘车" forState:UIControlStateNormal];
    btnState.titleLabel.font = [UIFont systemFontOfSize:14];
    btnState.layer.cornerRadius = 5;
    [btnState setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnState setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:209.0/255.0 blue:44.0/255.0 alpha:1]];
    [btnState addTarget: self action:@selector(stateChange:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:btnState];
    
    btnState.sd_layout
    .rightSpaceToView(cell,4)
    .widthIs(60)
    .heightIs(cell.frame.size.height-10)
    .topSpaceToView(cell,cell.frame.size.height/2.5);
    
    if ([codelist containsObject:model.EmpCode]) {
        [btnState setTitle:@"乘车" forState:UIControlStateNormal];
        btnState.selected = YES;
        [btnState setBackgroundColor:[UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1]];
    }else{
        [btnState setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:209.0/255.0 blue:44.0/255.0 alpha:1]];
        btnState.selected = NO;
        [btnState setTitle:@"未乘车" forState:UIControlStateNormal];
    }
    
    return cell;
}
//＊＊＊＊＊每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//＊＊＊＊＊＊点击返回按钮
-(void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//＊＊＊＊＊＊点击扫描按钮
-(void)rightClick{
     ScanningViewController *scan = [[ScanningViewController alloc]init];
     scan.shiftCode = _model.ShiftCode;
    scan.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:scan animated:YES];
}
//＊＊＊＊＊＊＊＊提交按钮
-(void)btnClick{
    if (codelist.count == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择乘车人员" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:^{
            [self performSelector:@selector(after:) withObject:alert afterDelay:.5];
        }];
    }else{
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要发车吗" message:nil preferredStyle:UIAlertControllerStyleAlert]; UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       //提交成功的操作 刷新列表
       [HttpRequest refushPeople:_model.ShiftCode list:codelist completeWithData:^(PeopleModel *model) {
       }];
       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交完成" message:nil preferredStyle:UIAlertControllerStyleAlert];
       [self presentViewController:alert animated:YES completion:^{

           [alert dismissViewControllerAnimated:YES completion:^{
               
               [self.navigationController popViewControllerAnimated:YES];
           }];

       }];
       
   }];
    [alert addAction:sure];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {return; }];[alert addAction:cancel];[self presentViewController:alert animated:YES completion:nil];
    }
}
//＊＊＊＊＊＊＊点击乘车按钮改变乘车人的状态
-(void)stateChange:(UIButton*)button{
   PeopleModel*model = peopleArr[button.tag-10];
    button.selected = !button.selected;
    if (button.selected) {
        [button setTitle:@"乘车" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:63.0/255.0 green:124.0/255.0 blue:255.0/255.0 alpha:1]];
        [codelist addObject:model.EmpCode];
       
    }else{
        [button setTitle:@"未乘车" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:209.0/255.0 blue:44.0/255.0 alpha:1]];
        [codelist removeObject:model.EmpCode];
    }
    NSLog(@"---%@--%ld--",model.EmpCode,codelist.count);
}

-(void)after:(UIAlertController *)alert{
    [alert dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
