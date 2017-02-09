//
//  YiChangShowViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/10/11.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "YiChangShowViewController.h"
#import "MainViewController.h"
#import "Header.h"
@interface YiChangShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView*tab;
    NSArray*leftArr;
}

@end

@implementation YiChangShowViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
  }
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"coverpage_animation"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.title = @"异常情况";
    leftArr = [[NSMutableArray alloc]initWithObjects:@"线       别:",@"问题描述:",@"备       注:",@"时       间:" ,nil];
    
    tab = [[UITableView alloc]init];
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.delegate = self;
    tab.dataSource = self;
    tab.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,0)
    .heightIs(self.view.frame.size.height);
    
    NSLog(@"---------------%ld",_string.count);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _string.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*flag = @"12";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:flag];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        
        UIView*view = [[UIView alloc]init];
        view.layer.cornerRadius = 10;
        view.tag = 10;
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 0.5;
        [cell addSubview:view];
        view.sd_layout
        .leftSpaceToView(cell,5)
        .rightSpaceToView(cell,5)
        .topSpaceToView(cell,5)
        .bottomSpaceToView(cell,0);
        
        for (int i= 0; i<4; i++) {
            UILabel*lab = [[UILabel alloc]init];
            lab.text = leftArr[i];
            lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:13]];
            [view addSubview:lab];
            lab.sd_layout
            .leftSpaceToView(view,3)
            .widthIs([self getString:lab.text].width+5)
            .heightIs(25)
            .topSpaceToView(view,3+(i%4)*30);
            
            UILabel*lab1 = [[UILabel alloc]init];
            lab1.tag = i+1;
            lab1.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:13]];
            [view addSubview:lab1];
            lab1.sd_layout
            .leftSpaceToView(lab,0)
            .rightEqualToView(view)
            .heightIs(25)
            .topEqualToView(lab);

        }
    }
    UIView*view = [cell viewWithTag:10];
    TongModel*model1 = _string[indexPath.row];
    UILabel*lab = [view viewWithTag:1];
    UILabel*lab1 = [view viewWithTag:2];
    UILabel*lab2 = [view viewWithTag:3];
    UILabel*lab3 = [view viewWithTag:4];
    
    lab.text = model1.Line;
    lab1.text = model1.Description;
    lab2.text = model1.Remark;
    lab3.text = model1.ModifyTime;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(CGSize)getString:(NSString*)str{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:[UIFONT fontWithDevice:14]],NSFontAttributeName, nil]];
    
    return size;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
//    MainViewController*first = [[MainViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:first];
//    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
