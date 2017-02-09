//
//  WeiBeiLiaoViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "WeiBeiLiaoViewController.h"
#import "HttpRequest.h"
#import <AFNetworking.h>
#import <SDAutoLayout.h>
#import "BeiTableViewCell.h"
#import "SmellModel.h"
#import <MJRefresh.h>
#import "MyColor.h"
@interface WeiBeiLiaoViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView*tab;
    UIActivityIndicatorView*activity;
    NSString *stringNumber;
    NSIndexPath*pathh;
}
@property(nonatomic,strong)NSMutableArray*shuliangArr,*allArr,*selectBtnArr;


@end

@implementation WeiBeiLiaoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _allArr = [[NSMutableArray alloc]initWithCapacity:0];
    self.tabBarController.tabBar.hidden = YES;
    [HttpRequest getBeiLiao:@"L037520" completeWithData:^(NSMutableArray *BeiArr) {
        
        [_allArr addObjectsFromArray:BeiArr];
        [tab reloadData];
        [activity stopAnimating];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectBtnArr = [[NSMutableArray alloc]initWithCapacity:0];
    _shuliangArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    tab = [[UITableView alloc]init];
    tab.separatorColor = [UIColor blackColor];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,0)
    .heightIs(self.view.frame.size.height-64);
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resgin)];
    [tab addGestureRecognizer:tap];
    [self.view addGestureRecognizer:tap];
    
    MJRefreshStateHeader *mj_header= [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    tab.mj_header = mj_header;


    activity = [[UIActivityIndicatorView alloc]init];
    activity.center=self.view.center;
    activity.layer.cornerRadius = 10;
    activity.bounds = CGRectMake(0, 0, 100, 100);
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activity];
    [activity startAnimating];
    
    if ([tab respondsToSelector:@selector(setSeparatorInset:)]) {
        [tab setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tab respondsToSelector:@selector(setLayoutMargins:)])  {
        [tab setLayoutMargins:UIEdgeInsetsZero];
    }
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)resgin{
    [self.view endEditing:YES];
}
-(void)keyboardWillHide:(NSNotification*)notify{
    [_shuliangArr removeAllObjects];
    
    BeiTableViewCell*cell =  (BeiTableViewCell*)[tab cellForRowAtIndexPath:pathh];
    SmellModel *model = [_allArr objectAtIndex:pathh.row];
    cell.tfNumber.text = stringNumber;
    
    if (cell.tfNumber.text.length != 0) {
        [_shuliangArr addObject:pathh];
        [_shuliangArr addObject:stringNumber];
        
        [HttpRequest getChanged:@"L037520" idd:model.idd number:[cell.tfNumber.text integerValue] completeWithData:^(NSInteger number) {
            [cell.tfNumber setEnabled:NO];
            cell.tfNumber.borderStyle = UITextBorderStyleNone;
        }];
        
        [tab reloadData];
    }

}
-(void)headerRefresh{
    [tab.mj_header beginRefreshing];
    [_allArr removeAllObjects];
    [HttpRequest getBeiLiao:@"L037520" completeWithData:^(NSMutableArray *BeiArr) {
        
        [_allArr addObjectsFromArray:BeiArr];
        [tab reloadData];
        [tab.mj_header endRefreshing];
        
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _allArr.count;
}
-(NSString*)getStute:(NSInteger)number{
    if (number == 1) {
        return @"开单";
    }else if (number == 2){
        return @"已下单 未备料";
    }else if (number == 4){
        return @"备料中";
    }else if (number == 8){
        return @"备料完成";
    }else if (number == 16){
        return @"签收";
    }else if (number == 32){
        return @"拒签";
    }else if (number == 64){
        return @"无法备料";
    }else if (number == 128){
        return @"异常结案";
    }else{
        return @"";
    }
}
-(BeiTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellBei = @"bei";
    BeiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellBei];
    
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    
    if (!cell) {
        cell = [[BeiTableViewCell alloc]initWithBeiLiao];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.tfNumber.enabled = NO;
        cell.tfNumber.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    
    SmellModel *model = [_allArr objectAtIndex:indexPath.row];
    cell.gongDan.text = model.WorkOrderCode;
    cell.gongNumber.text = [NSString stringWithFormat:@"(%@)",model.MaterialCode];
    cell.pinMing.text = model.MaterialName;
    cell.statue.text = [self getStute:model.Status];
    cell.time.text = model.DemandTime;
    cell.tfNumber.delegate = self;
    cell.backgroundColor = [MyColor colorWithHexString:model.Background];
    
    if (model.Status == 4) {
        cell.labName.text = [NSString stringWithFormat:@"备  料 人:    %@",model.StockEmpName];
        cell.labName.sd_layout.heightIs(25).widthIs([cell getString:cell.labName.text size:15].width+20);
        cell.labTimeStart.hidden = NO;
        cell.timeStart.hidden = NO;
        cell.labTimeStart.text = @"开始备料:";
        cell.timeStart.text = model.GetOrderTime;
       
    }else if (model.Status == 8){
        cell.labName.text = [NSString stringWithFormat:@"备  料 人:    %@",model.StockEmpName];
        cell.labName.sd_layout.heightIs(25).widthIs([cell getString:cell.labName.text size:15].width+20);

        cell.timeStart.hidden = NO;
        cell.labTimeStart.hidden = NO;
        cell.labTimeStart.text= @"完成备料:";
        cell.timeStart.text = model.StockTime;
    }else{
        
        cell.labName.sd_layout.heightIs(0);
        cell.timeStart.hidden = YES;
        cell.labTimeStart.hidden = YES;
    }
    
    [cell getReturnString:cell.gongNumber.text];
    
    
    
    cell.timeStart.sd_layout.widthIs([cell getString:cell.timeStart.text size:15].width+10);
    cell.statue.sd_layout.widthIs([cell getString:cell.statue.text size:15].width+20);
    CGRect rect = [cell.pinMing.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-30-cell.pinMingLab.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil] context:nil];
    cell.pinMing.sd_layout.widthIs(rect.size.width).heightIs(rect.size.height+8);
    cell.time.sd_layout.widthIs([cell getString:cell.time.text size:15].width+10);
    cell.tfNumber.sd_layout.widthIs([cell getString:cell.tfNumber.text size:15].width+70);
    cell.gongDan.sd_layout.widthIs([cell getString:cell.gongDan.text size:15].width);
    cell.gongNumber.sd_layout.widthIs([cell getString:cell.gongNumber.text size:15].width);
    
    // cell.leftButton.tag = model.idd;
    // [cell.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    if ([_selectBtnArr containsObject:@(cell.leftButton.tag)]) {
    //        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
    //    }else{
    //        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
    //    }
    
    //
    //    if (model.Status == 8) {
    //        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"bei"] forState:UIControlStateNormal];
    //        cell.leftButton.enabled = NO;
    //
    //    }
    //
    //
    if ([_shuliangArr containsObject:indexPath]) {
        cell.tfNumber.text = _shuliangArr[1] ;
    }else{
        if (model.ActualQuantity == 0) {
        cell.tfNumber.text = [NSString stringWithFormat:@"%ld",model.DemandQuantity] ;
        }else{
        cell.tfNumber.text = [NSString stringWithFormat:@"%ld",model.ActualQuantity] ;
        }
    }
    
    
    
    return  cell;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    stringNumber = textField.text;
    BeiTableViewCell*cell =  (BeiTableViewCell*)[textField superview];
    pathh = [tab indexPathForCell:cell];
    
    return YES;
}
//-(void)leftButtonClick:(UIButton*)button{
//    NSLog(@"---%ld",button.tag);
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
//    NSLog(@"--%@--",_selectBtnArr);
//}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [_shuliangArr removeAllObjects];
//    
//    
//    BeiTableViewCell*cell =  (BeiTableViewCell*)[textField superview];
//    NSIndexPath *path = [tab indexPathForCell:cell];
//    SmellModel *model = [_allArr objectAtIndex:path.row];
//    NSLog(@"----%ld--%ld--",path.section,path.row);
//    cell.tfNumber.text = textField.text;
//    
//    if (cell.tfNumber.text.length != 0) {
//        [_shuliangArr addObject:path];
//        [_shuliangArr addObject:textField.text];
//        
//        [HttpRequest getChanged:@"L037520" idd:model.idd number:[cell.tfNumber.text integerValue] completeWithData:^(NSInteger number) {
//            model.DemandQuantity = number;
//        }];
//        
//        [tab reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
//    }
//    
//    [textField resignFirstResponder];
//    
//    
//    return YES;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SmellModel *model = [_allArr objectAtIndex:indexPath.row];
    
    if (model.Status == 4 || model.Status == 8) {
        
        return 210;
    }else{
        return 150;
    }
    
}


-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


-(NSArray*)tableView:(UITableView*)tableView editActionsForRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    BeiTableViewCell *cell = [tab cellForRowAtIndexPath:indexPath];
    SmellModel *model = [_allArr objectAtIndex:indexPath.row];
    if (model.Status == 2) {
        
        UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"领单" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            
            [HttpRequest getLingDan:@"L037520" idd:model.idd completeWithData:^(BOOL isLing) {
                if (isLing == YES) {
                    model.Status = 4;
                    [HttpRequest getBeiLiao:@"L037520" completeWithData:^(NSMutableArray *BeiArr) {
                        [_allArr removeAllObjects];
                        [_allArr addObjectsFromArray:BeiArr];
                        [tab reloadData];
                        
                    }];
                    
                }
            }];
            
        }];
        
        deleteRoWAction.backgroundColor = [UIColor redColor];
        return @[deleteRoWAction];
        
    }else if (model.Status == 4){
        
        UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            [self.view endEditing:YES];
            [HttpRequest finish:@"L037520" idd:@[@(model.idd)] completeWithData:^(BOOL isSure) {
                if (isSure == YES) {
                    model.Status = 8;
                    
                    [HttpRequest getBeiLiao:@"L037520" completeWithData:^(NSMutableArray *BeiArr) {
                        [_allArr removeAllObjects];
                        [_allArr addObjectsFromArray:BeiArr];
                        [tab reloadData];
                        
                    }];
                    
                }
            }];
            
            
        }];
        
        deleteRoWAction.backgroundColor = [UIColor redColor];
        
        
        UITableViewRowAction *ZhiRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            cell.tfNumber.enabled = YES;
            cell.tfNumber.borderStyle = UITextBorderStyleRoundedRect;
            [cell.tfNumber becomeFirstResponder];
            
        }];
        
        ZhiRowAction.backgroundColor = [UIColor greenColor];
        return @[deleteRoWAction,ZhiRowAction];
    }else{
        UITableViewRowAction *ZhiRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"已完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            [tab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            
        }];
        
        ZhiRowAction.backgroundColor = [UIColor greenColor];
        return @[ZhiRowAction];
    }
    
}


-(void)dealloc{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
