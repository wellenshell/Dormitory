//
//  LingLiaoViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/13.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "LingLiaoViewController.h"
#import "Header.h"
#import "HMDatePickView.h"
#import "NSObject+Ext.h"
#import "NewModel.h"

@interface LingLiaoViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,DMDropDownMenuDelegate>
{
    UITableView*tab;
    NSMutableArray*buttonArr,*dataArr;
    UIView *backGroundView;
    DMDropDownMenu * dm1,*dm;
    UIDatePicker*picker;
    NSString*line;
    NSString*GongNumber;
    NSMutableDictionary*shuliangDic,*timeDic;
    UIActivityIndicatorView*activity;
    NSString *stringNumber;
    NSIndexPath*pathh;
}
@property(nonatomic,strong)NSMutableArray *lineArr,*gongArr,*selectBtnArr;
@end

@implementation LingLiaoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
    self.tabBarController.tabBar.hidden = YES;
   
    dataArr = [[NSMutableArray alloc]init];
    shuliangDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    timeDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    
    // NSString *name =[[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
    [activity startAnimating];
    [HttpRequest getLine:@"C056354" completeWithData:^(NSMutableArray *lineArr) {
        self.lineArr = lineArr;
       
    }];
    NSLog(@"---%@",_selectBtnArr);
}
-(void)setLineArr:(NSMutableArray *)lineArr{
   
//    line = lineArr[0];
//    [HttpRequest  getGongDan:@"C056354" line:lineArr[0] completeWithData:^(NSMutableArray *GongArr) {
//        self.gongArr = GongArr;
//       
//    }];
    _lineArr = lineArr;
    dm1.listArr = [NSArray arrayWithArray:_lineArr];
    dm1.curText.text = dm1.listArr[0];
    [dm1.menuTableView reloadData];
    
    [_selectBtnArr removeAllObjects];
    [shuliangDic removeAllObjects];
    [timeDic removeAllObjects];
    [tab reloadData];
    [activity stopAnimating];
   
}

-(void)setGongArr:(NSMutableArray *)gongArr{
   NSLog(@"-ARRAY-%@",gongArr);
    [dataArr removeAllObjects];
    [shuliangDic removeAllObjects];
    [timeDic removeAllObjects];
    [_selectBtnArr removeAllObjects];
    
    
    _gongArr = gongArr;
    dm.listArr = [NSArray arrayWithArray:gongArr];
    if (_gongArr.count == 0) {
        dm.curText.text = @" ";
        [dataArr removeAllObjects];
        [tab reloadData];
        return;
    }else{
    dm.curText.text = dm.listArr[0];
    [dm.menuTableView reloadData];
    [activity stopAnimating];
        [tab reloadData];
//    
//    [dataArr removeAllObjects];
//    GongNumber = gongArr[0];
//    [HttpRequest getLiaoHao:[_gongArr objectAtIndex:0] code:@"C056354" completeWithData:^(LingModel *ling) {
//        [dataArr addObject:ling];
//        [shuliangDic removeAllObjects];
//        [timeDic removeAllObjects];
//        [_selectBtnArr removeAllObjects];
//        for (int i = 0; i<dataArr.count; i++) {
//            [_selectBtnArr addObject:@(i+1)];
//        }
//
//        [tab reloadData];
//       [activity stopAnimating];
//    }];
//   
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
        _selectBtnArr = [[NSMutableArray alloc]init];
        buttonArr = [[NSMutableArray alloc]init];
        
        Model *model = [[Model alloc]init];
        UIView *bigView = [model returnTitleView:@"领料单"];
        [self.view addSubview:bigView];
        
        model.rightBtn.hidden = YES;
        model.leftBtn.hidden = NO;
        [model.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];

    
        backGroundView = [[UIView alloc]init];
        backGroundView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:backGroundView];
        backGroundView.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topSpaceToView(bigView,0)
        .bottomEqualToView(self.view);
    
    
    
        UIImageView*leftImage = [[UIImageView alloc]init];
        leftImage.image = [UIImage imageNamed:@"lineBie"];
        [backGroundView addSubview:leftImage];
        leftImage.sd_layout
        .leftSpaceToView(backGroundView,10)
        .heightIs(30)
        .widthIs(25)
        .topSpaceToView(backGroundView,10);
    
        dm1 = [[DMDropDownMenu alloc] initWithFrame:CGRectMake(40, 10, self.view.frame.size.width/2-80, 30)];
        dm1.delegate = self;
        [backGroundView addSubview:dm1];

    
    
        UIImageView*rightImage = [[UIImageView alloc]init];
        rightImage.image = [UIImage imageNamed:@"tabbar_icon_news_normal"];
        [backGroundView addSubview:rightImage];
        rightImage.sd_layout
        .leftSpaceToView(dm1,10)
        .heightIs(30)
        .widthIs(25)
        .topSpaceToView(backGroundView,10);
    
        dm = [[DMDropDownMenu alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 10,self.view.frame.size.width/2-10, 30)];
        dm.delegate = self;
        [backGroundView addSubview:dm];
    
    

    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"下单" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    button.sd_layout
    .rightSpaceToView(bigView,5)
    .widthIs(50)
    .heightIs(30)
    .topSpaceToView(bigView,30);
    
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    [backGroundView addSubview:tab];
    tab.sd_layout
    .leftEqualToView(backGroundView)
    .rightEqualToView(backGroundView)
    .topSpaceToView(backGroundView,50)
    .heightIs(self.view.frame.size.height);
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resgin)];
    [tab addGestureRecognizer:tap];
  
    
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
-(void)keyboardWillHide:(NSNotification*)notify{
    
    LingLiaoTableViewCell*cell =  (LingLiaoTableViewCell*)[tab cellForRowAtIndexPath:pathh];
        LingModel *model = [dataArr objectAtIndex:pathh.row];
    
        if ([stringNumber integerValue]>[model.Quantity integerValue]) {
            [KPromptBox showKPromptBoxWithMassage:@"需求数量不能大于剩余数量"];
    
        }else{
            cell.tfNumber.text = stringNumber;
        }
        if (cell.tfNumber.text.length != 0) {
            [shuliangDic setObject:cell.tfNumber.text forKey:[NSString stringWithFormat:@"%ld",pathh.row]];
            [tab reloadData];
        }
        model.quanty = [model.Quantity integerValue]-[stringNumber integerValue];
        NSLog(@"--%@--%ld",stringNumber,model.quanty);
}


-(void)resgin{
    [self.view endEditing:YES];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)selectIndex:(NSInteger)index AtDMDropDownMenu:(DMDropDownMenu *)dmDropDownMenu
{
    [activity startAnimating];
    if (dmDropDownMenu == dm1) {
        
        NSString *number = [_lineArr objectAtIndex:index];
        [HttpRequest  getGongDan:@"C056354" line:_lineArr[index] completeWithData:^(NSMutableArray *GongArr){
            self.gongArr = GongArr;
        }];
        line = number;
       
      
    }else{
        [dataArr removeAllObjects];
        [HttpRequest getLiaoHao:[_gongArr objectAtIndex:index] code:@"C056354" completeWithData:^(LingModel *ling) {
            [dataArr addObject:ling];
            [shuliangDic removeAllObjects];
            [timeDic removeAllObjects];
            [_selectBtnArr removeAllObjects];
            for (int i = 0; i<dataArr.count; i++) {
                [_selectBtnArr addObject:@(i+1)];
            }
            [tab reloadData];
           [activity stopAnimating];
        }];
        GongNumber = [_gongArr objectAtIndex:index];
       
    }
}
    
  


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
-(LingLiaoTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellFlag = @"flagf";
    LingLiaoTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellFlag];
   
    
    if (!cell) {
        cell = [[LingLiaoTableViewCell alloc]initWithLingLiao];
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tfNumber.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    
    
    LingModel *model = [dataArr objectAtIndex:indexPath.row];
    cell.labName.text = model.MaterialName;
    CGRect rect = [cell.labName.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] context:nil];
    cell.labName.sd_layout.widthIs(rect.size.width).heightIs(rect.size.height);
    cell.leftButton.tag = indexPath.row+1;
        if ([_selectBtnArr containsObject:@(cell.leftButton.tag)]) {
        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
    }else{
        [cell.leftButton setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
    }
    [cell.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
   
    
   
        cell.tfNumber.delegate = self;
      // [cell.tfNumber addTarget:self action:@selector(tfNumberClcik:) forControlEvents:UIControlEventEditingChanged];
    
       [cell.tfTime addTarget:self action:@selector(tfClick:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.lab.text = model.MaterialCode;
        CGSize size = [cell getString:cell.lab.text size:15];
        cell.lab.sd_layout.widthIs(size.width);
        
        cell.labNumber.text = [NSString stringWithFormat:@"(%@)",model.Quantity];
         [cell getReturnString:cell.labNumber.text];
        cell.labNumber.font = [UIFont systemFontOfSize:12];
   
   
    if (shuliangDic.count !=0) {
        cell.tfNumber.text = [shuliangDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
        cell.tfNumber.sd_layout.widthIs([cell getString:cell.tfNumber.text size:14].width+70);
       
    }
    if (timeDic.count !=0) {
    [cell.tfTime setTitle:[timeDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]] forState:UIControlStateNormal];
    }
   
    cell.tfTime.sd_layout.widthIs([cell getString:cell.tfTime.titleLabel.text size:14].width+20);
    
    
    return cell;

}

-(void)tfClick:(UIButton*)button{
    
    
    LingLiaoTableViewCell*cell =  (LingLiaoTableViewCell*)[button superview];
    NSIndexPath *indexPath = [tab indexPathForCell:cell];
    [cell.tfNumber resignFirstResponder];
    
    HMDatePickView *datePickVC = [[HMDatePickView alloc] initWithFrame:self.view.frame];
    datePickVC.maxYear = -1;
    datePickVC.date = [NSDate date];
    //设置字体颜色
    datePickVC.fontColor = [UIColor redColor];
    //日期回调
    datePickVC.completeBlock = ^(NSString *selectDate) {
        NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
        [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate*date = [dateformater dateFromString:selectDate];
        
        if ([date compare:[NSDate date]] == NSOrderedDescending) {
         
            return ;
        }else{
            [button setTitle:selectDate forState:UIControlStateNormal];
            [timeDic setObject:selectDate forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
            [tab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
       
    };
    [datePickVC configuration];
    
    [self.view addSubview:datePickVC];

}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    stringNumber = textField.text;
    LingLiaoTableViewCell*cell =  (LingLiaoTableViewCell*)[textField superview];
    pathh = [tab indexPathForCell:cell];
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    LingLiaoTableViewCell*cell =  (LingLiaoTableViewCell*)[textField superview];
    NSIndexPath*path = [tab indexPathForCell:cell];
    LingModel *model = [dataArr objectAtIndex:path.row];
   
    if ([textField.text integerValue]>[model.Quantity integerValue]) {
        [KPromptBox showKPromptBoxWithMassage:@"需求数量不能大于剩余数量"];
        
    }else{
    cell.tfNumber.text = textField.text;
    }
    if (cell.tfNumber.text.length != 0) {
        [shuliangDic setObject:cell.tfNumber.text forKey:[NSString stringWithFormat:@"%ld",path.row]];
        [tab reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    }
     model.quanty = [model.Quantity integerValue]-[textField.text integerValue];
    [textField resignFirstResponder];
    
   
    return YES;
}


-(void)leftButtonClick:(UIButton*)button{
 
        if ([_selectBtnArr containsObject:@(button.tag)]) {
             [button setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton"] forState:UIControlStateNormal];
             [_selectBtnArr removeObject:@(button.tag)];
          
        }else{

            [button setBackgroundImage:[UIImage imageNamed:@"favmanage_checkbutton_checked"] forState:UIControlStateNormal];
            [_selectBtnArr addObject:@(button.tag)];
           
        }

    
    NSLog(@"--%@--",_selectBtnArr);
}

//点击下单
-(void)commitClick{
    
    [activity startAnimating];
    [self.view endEditing:YES];
 
    NSMutableArray* listArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSString *lin;
    NSString*code;
    NSString*pro;
    NSString*work;
 
    if (_selectBtnArr.count == 0) {
        [KPromptBox showKPromptBoxWithMassage:@"请选择料号"];
        return;
    }else if (shuliangDic.count == 0){
        [KPromptBox showKPromptBoxWithMassage:@"请输入需求数量"];
        return;
    }
    else if (timeDic.count == 0){
        [KPromptBox showKPromptBoxWithMassage:@"请选择时间"];
        return;
    }
    
    else{
   
    for (NSNumber*number in _selectBtnArr) {
        
        NSMutableDictionary *itemDic = [[NSMutableDictionary alloc]init];
        
        LingLiaoTableViewCell*cell =  [tab cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[number integerValue]-1 inSection:0]];
        LingModel*model = [dataArr objectAtIndex:[number integerValue]-1];
      //  model.EmpCode = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
        model.EmpCode = @"L033712";
        model.Line = line;
        model.WorkOrderCode = GongNumber;
        model.DemandQuantity = [cell.tfNumber.text integerValue];
        model.DemandTime = cell.tfTime.titleLabel.text;
       
        lin =  model.Line;
        code = model.EmpCode;
        pro = model.ProfitceterCode;
        work = model.WorkOrderCode;
        
       
        
        [itemDic setObject:model.MaterialCode forKey:@"MaterialCode"];
        [itemDic setObject:model.MaterialName forKey:@"MaterialName"];
        [itemDic setObject:@(model.DemandQuantity) forKey:@"DemandQuantity"];
        
        NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
        [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate*date = [dateformater dateFromString:[NSString stringWithFormat:@"%@:00",model.DemandTime]];
        NSString *str = [dateformater stringFromDate:date];
       
        [itemDic setObject:str forKey:@"DemandTime"];
        [itemDic setObject:@(model.quanty) forKey:@"Quantity"];
        
        
        [listArray addObject:itemDic];
        
   
     }
        [HttpRequest XiaDan:@"C056354" line:lin pro:pro work:work list:listArray completeWithData:^(BOOL isOk) {
            if (isOk == YES) {
                
            }else{
                
            }
           [activity stopAnimating];
       }];
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}


-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
