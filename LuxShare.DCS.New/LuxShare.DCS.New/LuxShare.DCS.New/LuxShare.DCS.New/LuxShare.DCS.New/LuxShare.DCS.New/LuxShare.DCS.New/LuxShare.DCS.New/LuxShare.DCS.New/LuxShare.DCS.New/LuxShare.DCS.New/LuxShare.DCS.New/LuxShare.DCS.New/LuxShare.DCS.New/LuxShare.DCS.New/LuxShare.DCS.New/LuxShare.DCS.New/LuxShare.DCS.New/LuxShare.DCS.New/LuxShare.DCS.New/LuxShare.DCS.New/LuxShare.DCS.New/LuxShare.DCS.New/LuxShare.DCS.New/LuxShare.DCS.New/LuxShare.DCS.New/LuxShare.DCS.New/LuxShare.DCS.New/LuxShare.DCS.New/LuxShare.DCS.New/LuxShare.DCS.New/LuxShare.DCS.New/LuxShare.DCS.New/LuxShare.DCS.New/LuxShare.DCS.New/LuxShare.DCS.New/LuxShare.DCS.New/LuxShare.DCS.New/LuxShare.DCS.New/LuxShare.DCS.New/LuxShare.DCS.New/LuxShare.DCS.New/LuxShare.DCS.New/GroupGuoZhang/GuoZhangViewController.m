//
//  GuoZhangViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/13.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "GuoZhangViewController.h"
#import "Header.h"
@interface GuoZhangViewController ()//<UITableViewDelegate,UITableViewDataSource>
//{
//    UITableView*tab;
//}
@property(nonatomic,strong)NSMutableArray*selectBtnArr;
@end

@implementation GuoZhangViewController
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    kPublic;
//    self.tabBarController.tabBar.hidden = YES;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWebView *web = [[UIWebView alloc]init];
    [self.view addSubview:web];
    web.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomEqualToView(self.view);
    NSURL *url = [NSURL URLWithString:@"http://dcs.luxshare-ict.com:8008/zh-CN/Personal/RecruitRequestNew?UserID=C059115&Pwd=011524"];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    
//    Model *model = [[Model alloc]init];
//    _selectBtnArr = [[NSMutableArray alloc]initWithCapacity:0];
//    UIView *bigView = [model returnTitleView:@"签 收"];
//    [self.view addSubview:bigView];
//    NSArray *tiArr = [[NSArray alloc]initWithObjects:@"签收",@"新增",nil];
//    for (int i =0; i<2; i++) {
//        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.titleLabel.font = [UIFont systemFontOfSize:13];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        button.layer.cornerRadius = 5;
//        if (i == 0) {
//            button.backgroundColor = [UIColor blackColor];
//        }else{
//            button.backgroundColor = [UIColor redColor];
//        }
//        [button setTitle:tiArr[i] forState:UIControlStateNormal];
//        button.tag = i+1;
//        [button addTarget:self action:@selector(guozhangItemsClick:) forControlEvents:UIControlEventTouchUpInside];
//        [bigView addSubview:button];
//        button.sd_layout
//        .rightSpaceToView(bigView,5+(i%2)*55)
//        .widthIs(50)
//        .heightIs(30)
//        .topSpaceToView(bigView,30);
//    }
//
//    model.rightBtn.hidden = YES;
//    model.leftBtn.hidden = NO;
//    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//
//
//    tab = [[UITableView alloc]init];
//    tab.delegate = self;
//    tab.dataSource = self;
//    [self.view addSubview:tab];
//    tab.sd_layout
//    .leftEqualToView(self.view)
//    .rightEqualToView(self.view)
//    .topSpaceToView(bigView,0)
//    .bottomSpaceToView(self.view,0);
//    if ([tab respondsToSelector:@selector(setSeparatorInset:)]) {
//        [tab setSeparatorInset:UIEdgeInsetsZero];
//        
//    }
//    if ([tab respondsToSelector:@selector(setLayoutMargins:)])  {
//        [tab setLayoutMargins:UIEdgeInsetsZero];
//    }
    
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//}
//-(void)guozhangItemsClick:(UIButton*)button{
//    
//}


//-(void)leftBtnClick{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 4;
//}
//-(GuoZhangTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString*cellBei = @"bei";
//    GuoZhangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellBei];
//    if (!cell) {
//        cell = [[GuoZhangTableViewCell alloc]initWithGuoZhang];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.backgroundColor = [UIColor whiteColor];
//    }
//   
//    cell.leftButton.tag = indexPath.row+1;
//    if ([_selectBtnArr containsObject:@(cell.leftButton.tag)]) {
//        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
//    }else{
//        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
//    }
//    [cell.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//
//        cell.tfNumber.text = @"4921.00";
//        cell.gongDan.text = @" 0515C-1601012222";
//        cell.gongNumber.text = @"(LO1D3003-DT-R)";
//        [cell getReturnString:cell.gongNumber.text];
//   
//    cell.tfNumber.sd_layout.widthIs([cell getString:cell.tfNumber.text size:14].width+30);
//    cell.gongDan.sd_layout.widthIs([cell getString:cell.gongDan.text size:14].width);
//    cell.gongNumber.sd_layout.widthIs([cell getString:cell.gongNumber.text size:12].width).topSpaceToView(cell.gongDan,5).leftEqualToView(cell.gongDan);
//    
//    
//    return  cell;
//}
//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 130;
//}
//
//-(void)leftButtonClick:(UIButton*)button{
//    
//    if ([_selectBtnArr containsObject:@(button.tag)]) {
//        [button setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
//        [_selectBtnArr removeObject:@(button.tag)];
//        
//    }else{
//        
//        [button setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
//        [_selectBtnArr addObject:@(button.tag)];
//        
//    }
//    
//    
//    NSLog(@"--%@--",_selectBtnArr);
//}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
