//
//  YiBeiLiaoViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "YiBeiLiaoViewController.h"
#import "HttpRequest.h"
#import <AFNetworking.h>
#import <SDAutoLayout.h>
#import "BeiTableViewCell.h"
#import "YiBeiModel.h"
#import "YiBeiTableViewCell.h"
//#import "MyHeader.h"

@interface myButton : UIButton
@property(nonatomic,assign)NSInteger index;
@end
@implementation myButton
@end
@interface YiBeiLiaoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    BOOL flag[2];
    UIActivityIndicatorView*activity;
    
}
@property(nonatomic,strong)NSMutableArray*allArr;

@end

@implementation YiBeiLiaoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
   
    _allArr = [[NSMutableArray alloc]init];
    
    [HttpRequest getBeiLiaoYi:@"L037520" completeWithData:^(NSMutableArray *BeiArr) {
        [_allArr addObjectsFromArray:BeiArr];
        NSLog(@"-arr-%@",_allArr);
        [tab reloadData];
        [activity stopAnimating];
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    tab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,0)
    .heightIs(self.view.frame.size.height-64);
    
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

}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        if (flag[section]) {
            NSArray*arr = [_allArr[section]objectAtIndex:3];
            return arr.count;
        }else{
            return 0;
        }
    
  }
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    static NSString*sectionFlag = @"sectionFlag";
    UITableViewHeaderFooterView*header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionFlag];
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:sectionFlag];
        
        
        myButton*button = [myButton buttonWithType:UIButtonTypeCustom];
        button.tag = 10;
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setUserInteractionEnabled:YES];
        [header addSubview:button];
        button.sd_layout
        .leftEqualToView(header)
        .rightEqualToView(header)
        .topEqualToView(header)
        .bottomEqualToView(header);
        
        
        
        UILabel*Chang = [[UILabel alloc]init];
        Chang.tag = 50000;
        Chang.font = [UIFont systemFontOfSize:13];
        Chang.textAlignment = NSTextAlignmentLeft;
        [button addSubview:Chang];
        Chang.sd_layout
        .leftSpaceToView(button,15)
        .heightIs(30)
        .topSpaceToView(button,10)
        .widthIs(10);
        
        
        UILabel*labLi = [[UILabel alloc]init];
        labLi.text = @"利润中心:";
        labLi.font = [UIFont systemFontOfSize:13];
        labLi.textAlignment = NSTextAlignmentLeft;
        [button addSubview:labLi];
        labLi.sd_layout
        .leftSpaceToView(Chang,10)
        .heightIs(30)
        .topSpaceToView(button,10)
        .widthIs([self getString:labLi.text size:13].width);
        
        UILabel*Li = [[UILabel alloc]init];
        Li.tag = 100000;
        Li.font = [UIFont systemFontOfSize:13];
        Li.textAlignment = NSTextAlignmentLeft;
        [button addSubview:Li];
        Li.sd_layout
        .leftSpaceToView(labLi,5)
        .heightIs(30)
        .topSpaceToView(button,10)
        .widthIs(10);

        
        
        
        
        UILabel*labLine = [[UILabel alloc]init];
        labLine.text = @"线别:";
        labLine.font = [UIFont systemFontOfSize:13];
        labLine.textAlignment = NSTextAlignmentLeft;
        [button addSubview:labLine];
        labLine.sd_layout
        .leftSpaceToView(Li,10)
        .heightIs(30)
        .topSpaceToView(button,10)
        .widthIs([self getString:labLine.text size:13].width);

        
        
        UILabel*Line = [[UILabel alloc]init];
        Line.tag = 150000;
        Line.font = [UIFont systemFontOfSize:13];
        Line.textAlignment = NSTextAlignmentLeft;
        [button addSubview:Line];
        Line.sd_layout
        .leftSpaceToView(labLine,5)
        .heightIs(30)
        .topSpaceToView(button,10)
        .widthIs(10);
        

      
        
        
        UIImageView*imageLine = [[UIImageView alloc]init];
        imageLine.image = [UIImage imageNamed:@"tabShadow"];
        [button addSubview:imageLine];
        imageLine.sd_layout
        .rightSpaceToView(button,0)
        .bottomSpaceToView(button,2)
        .heightIs(1)
        .leftSpaceToView(button,0);

        UIImageView*imageView = [[UIImageView alloc]init];
        imageView.tag = 20;
        imageView.image = [UIImage imageNamed:@"listmoreico_n_night"];
        [button addSubview:imageView];
        imageView.sd_layout
        .rightSpaceToView(button,10)
        .topSpaceToView(button,20)
        .heightIs(14)
        .widthIs(14);

    }
    
     NSArray *allArr = _allArr[section];
      myButton *button = [header viewWithTag:10];
      button.index = section+1;
     [button addTarget:self action:@selector(buttonHeaderClick:) forControlEvents:UIControlEventTouchUpInside];

    UILabel*chang = [header viewWithTag:50000];
    chang.text = allArr[0];
    chang.sd_layout.widthIs([self getString:chang.text size:13].width);
    
    
    UILabel*li  = [header viewWithTag:100000];
    li.text =  allArr[1];
    li.sd_layout.widthIs([self getString:li.text size:13].width);
    
    UILabel*line = [header viewWithTag:150000];
    line.text =  allArr[2];
    line.sd_layout.widthIs([self getString:line.text size:13].width);

   
    
    UIImageView *imageView = [button viewWithTag:20];
    if (flag[section]) {
        imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        imageView.transform = CGAffineTransformIdentity;
    }

    return header;
}
-(CGSize)getString:(NSString*)str size:(NSInteger)number{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:number],NSFontAttributeName, nil]];
    
    return size;
}

-(void)buttonHeaderClick:(myButton*)button{
    flag[button.index-1] = !flag[button.index-1];
    [tab reloadData];
}
-(NSString*)getStute:(NSInteger)number{
    if (number == 1) {
        return @"开单";
    }else if (number == 2){
        return @"下单";
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
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*yicellBei = @"bei";
    YiBeiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:yicellBei];
    
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    
    if (!cell) {
        cell = [[YiBeiTableViewCell alloc]initWithYiBeiLiao];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
   NSArray*smellArr = [_allArr[indexPath.section] objectAtIndex:3];
    YiBeiModel*model = [smellArr objectAtIndex:indexPath.row];
    
//       cell.GongDan.text = model.WorkOrderCode;
//    cell.GongDan.sd_layout.widthIs([cell getString:cell.GongDan.text size:14].width);
//    
//    
//    cell.liaoHao.text = model.MaterialCode;
//    cell.liaoHao.sd_layout.widthIs([cell getString:cell.liaoHao.text size:14].width);
    
    NSString *first = [NSString stringWithFormat:@"%@(%@)",model.WorkOrderCode,model.MaterialCode];
    NSLog(@"--first-%@",first);
    cell.liaoHao.attributedText = [cell getString:first second:model.MaterialCode];
    cell.liaoHao.sd_layout.widthIs([cell getString:cell.liaoHao.text size:14].width+20);
    
    cell.xuNumber.text = [NSString stringWithFormat:@"%ld",model.DemandQuantity];
    cell.xuNumber.sd_layout.widthIs([cell getString:cell.xuNumber.text size:14].width);
    
    
    cell.shiNumber.text = [NSString stringWithFormat:@"%ld",model.ActualQuantity];
    cell.shiNumber.sd_layout.widthIs([cell getString:cell.shiNumber.text size:14].width);
    
    
    cell.shenPeople.text = model.ApplyEmpName;
    cell.shenPeople.sd_layout.widthIs([cell getString:cell.shenPeople.text size:13].width);
    
    cell.xuQiuTime.text = model.DemandTime;
    cell.xuQiuTime.sd_layout.widthIs([cell getString:cell.xuQiuTime.text size:13].width);
    
    cell.beiPeople.text = model.StockEmpName;
    cell.beiPeople.sd_layout.widthIs([cell getString:cell.beiPeople.text size:13].width);
    
    cell.beiTime.text = model.StockTime;
    cell.beiTime.sd_layout.widthIs([cell getString:cell.beiTime.text size:13].width);
    
    cell.qianPeople.text = model.SignEmpName;
    cell.qianPeople.sd_layout.widthIs([cell getString:cell.qianPeople.text size:13].width);
    
    cell.qianTime.text = model.SignForTime;
    cell.qianTime.sd_layout.widthIs([cell getString:cell.qianTime.text size:13].width);
    
    
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230;
}


-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
