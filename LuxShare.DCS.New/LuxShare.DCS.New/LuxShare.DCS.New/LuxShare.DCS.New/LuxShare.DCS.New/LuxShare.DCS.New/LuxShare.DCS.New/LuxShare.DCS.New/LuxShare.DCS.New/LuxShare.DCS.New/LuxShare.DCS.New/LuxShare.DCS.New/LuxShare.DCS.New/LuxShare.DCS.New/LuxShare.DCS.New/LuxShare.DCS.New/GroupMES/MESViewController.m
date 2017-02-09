//
//  MESViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/29.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "MESViewController.h"
#import "Header.h"
@interface MESViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
  
}
@end

@implementation MESViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,60)
    .heightIs(self.view.frame.size.height-60);
    
    
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@"生产异常"];
    [self.view addSubview:bigView];
    
    model.rightBtn.hidden = YES;
    model.leftBtn.hidden = NO;
    [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mesArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"tableCell";
    MESTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:tableCell];
    if (!cell) {
        cell = [[MESTableViewCell alloc]initWithMES];
        
    }
    
    YiChangModel *model = [_mesArr objectAtIndex:indexPath.row];
   CGSize sizeCom = [cell getString:model.CompanyName];
    cell.labcOMP.text = model.CompanyName;
    cell.labcOMP.sd_layout.widthIs(sizeCom.width);
    
    
    CGSize sizeLi = [cell getString:model.ProfitceterName];
    cell.labLi.text = model.ProfitceterName;
    cell.labLi.sd_layout.widthIs(sizeLi.width);
    
    
    CGSize sizequ= [cell getString:model.AreaDes];
    cell.labQu.text = model.AreaDes;
    cell.labQu.sd_layout.widthIs(sizequ.width);
    
    
    CGSize sizeZhuan= [cell getString:model.CaseName];
    cell.labZhuan.sd_layout.widthIs(sizeZhuan.width);
    cell.labZhuan.text = model.CaseName;
    
    CGSize sizeLing= [cell getString:model.LeadersName];
    cell.labLing.sd_layout.widthIs(sizeLing.width);
    cell.labLing.text = model.LeadersName;
    
    
    CGSize sizeYi= [cell getString:model.TypeDes];
    cell.labYI.sd_layout.widthIs(sizeYi.width);
    cell.labYI.text = model.TypeDes;
    
    CGSize sizeDS= [cell getString:model.CatDes];
    cell.labDS.sd_layout.widthIs(sizeDS.width);
    cell.labDS.text = model.CatDes;
    
    
    CGSize sizeDDS= [cell getString:model.CatDDes];
    cell.labDDS.sd_layout.widthIs(sizeDDS.width);
    cell.labDDS.text = model.CatDDes;
    

  
    CGRect sizeRe = [model.AddRemark boundingRectWithSize:CGSizeMake(cell.frame.size.width-cell.rema.frame.size.width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName, nil] context:nil];
    cell.labrema.sd_layout.widthIs(sizeRe.size.width).heightIs(sizeRe.size.height+10);
    cell.labrema.text = model.AddRemark;
    
    CGSize sizeName= [cell getString:model.CallByName];
    cell.labName.sd_layout.widthIs(sizeName.width);
    cell.labName.text = model.CallByName;
    
    CGSize sizeTep= [cell getString:model.CallTel];
    cell.lanTEP.sd_layout.widthIs(sizeTep.width);
    cell.lanTEP.text = model.CallTel;
    
    CGSize sizeTime= [cell getString:model.CallTime];
    cell.labTime.sd_layout.widthIs(sizeTime.width);
    cell.labTime.text = model.CallTime;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
