//
//  VisitorViewController.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/14.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "VisitorViewController.h"
#import "Header.h"
@interface VisitorViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *gstArr;
    NSMutableArray *idsArr;
    NSMutableArray *itemsArr;
    UITableView*tab;
    UIActivityIndicatorView*activity;
    NSMutableDictionary*thingDic;
}

@end

@implementation VisitorViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [activity startAnimating];
    
    thingDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    //创建两个数组来装数据 作为下一个页面的数据请求参数
    idsArr = [[NSMutableArray alloc]initWithCapacity:0];
    itemsArr = [[NSMutableArray alloc]initWithCapacity:0];
    gstArr = [[NSMutableArray alloc]init];
    
    //获取访客的数据
    NSString *code = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
    [HttpRequest getGuestInfo:code completeWithData:^(NSMutableArray *guestArr) {
        [gstArr addObjectsFromArray:guestArr];
        [tab reloadData];
        [activity stopAnimating];
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1];
    [self creatNav];
    [self creatVisitor];
    
    tab = [[UITableView alloc]init];
    tab.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-50);
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center=self.view.center;
    activity.layer.cornerRadius = 10;
    activity.bounds = CGRectMake(0, 0, 100, 100);
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activity];
    

  }
//添加导航条
-(void)creatNav{
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"等待进入的访客";
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];

    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];

}
-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

// 添加访客
-(void)creatVisitor{
    
    UIButton *buttonSure = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSure.layer.cornerRadius = 10;
    [buttonSure setTitle:@"确认选择" forState:UIControlStateNormal];
    [buttonSure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonSure.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [buttonSure addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSure];
    
    buttonSure.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(40)
    .bottomSpaceToView(self.view,10);
}
-(void)sureBtnClick{
    if (idsArr.count == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择要进入的访客" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];

    }else{
    //点击确定选择后 将两个数组存入本地 并跳转到扫描页面
        
    [idsArr writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ids.text"] atomically:YES];
    [itemsArr writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/items.text"] atomically:YES];
    CodeViewController *code = [[CodeViewController alloc]init];
    [self presentViewController:code animated:YES completion:nil];
    }
    
  
}
//列表的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return gstArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag = @"flag";
    VisitorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flag];
    cell.tfThings.text = @"";
    [cell.btnSelect setImage:[UIImage imageNamed:@"noOk"] forState:UIControlStateNormal];
       if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"VisitorTableViewCell" owner:nil options:nil][0];
     cell.backgroundColor = [UIColor whiteColor];
           cell.tfThings.delegate = self;
        cell.tfPerson.font = [UIFont systemFontOfSize:14];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tfChange:) name:UITextFieldTextDidChangeNotification object:nil];
           cell.labBig.layer.cornerRadius = 10;
           cell.labBig.clipsToBounds = YES;
           cell.labBig.backgroundColor = [UIColor whiteColor];
           cell.labBig.layer.borderColor = [UIColor blackColor].CGColor;
           cell.labBig.layer.borderWidth = 1;
    }

    cell.btnSelect.tag = indexPath.row+1;
    GuestModel *model = [gstArr objectAtIndex:indexPath.row];
    cell.tfPerson.text = [NSString stringWithFormat:@"%@－%@",model.GuestCompany,model.GuestName];
    cell.time.text = model.CheckTime;
    if (thingDic.count !=0) {
        cell.tfThings.text = [thingDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }
    
    if ([idsArr containsObject:model.guestId]) {
        [cell.btnSelect setImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
    }else{
       [cell.btnSelect setImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
    }
    return cell;
    
}
//设置cell单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    VisitorTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    GuestModel *model = [gstArr objectAtIndex:indexPath.row];
    UITextField *tfItems = (UITextField*)[cell viewWithTag:20];
        if (cell.btnSelect.selected == YES) {
        cell.btnSelect.selected = NO;
        [cell.btnSelect setImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
        [idsArr removeObject:model.guestId];
        [itemsArr removeObject:tfItems.text];
        
    }else{
        
        cell.btnSelect.selected = YES;
        [cell.btnSelect setImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
        [idsArr addObject:model.guestId];
        [itemsArr addObject:tfItems.text];
        
    }
   
}
//接受输入框改变通知 获取内容
-(void)tfChange:(NSNotification*)notify{
    
        UITextField *tf = notify.object;
        VisitorTableViewCell *cell = (VisitorTableViewCell*)tf.superview.superview;
        NSIndexPath *path = [tab indexPathForCell:cell];
        GuestModel *model = [gstArr objectAtIndex:path.row];
        if ([idsArr containsObject:model.guestId]) {
            for (int i = 0; i<idsArr.count; i++) {
                NSString *guestId = [idsArr objectAtIndex:i];
                if ([guestId integerValue] == [model.guestId integerValue]) {
                    [itemsArr removeObjectAtIndex:i];
                    [itemsArr insertObject:tf.text atIndex:i];
                }
            }
            
            
        }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    VisitorTableViewCell*cell =  (VisitorTableViewCell*)[[textField superview]superview];
    NSIndexPath*path = [tab indexPathForCell:cell];
    cell.tfThings.text = textField.text;
    
    if (cell.tfThings.text.length != 0) {
        [thingDic setObject:cell.tfThings.text forKey:[NSString stringWithFormat:@"%ld",path.row]];
        [tab reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    }
    [textField resignFirstResponder];

     return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
