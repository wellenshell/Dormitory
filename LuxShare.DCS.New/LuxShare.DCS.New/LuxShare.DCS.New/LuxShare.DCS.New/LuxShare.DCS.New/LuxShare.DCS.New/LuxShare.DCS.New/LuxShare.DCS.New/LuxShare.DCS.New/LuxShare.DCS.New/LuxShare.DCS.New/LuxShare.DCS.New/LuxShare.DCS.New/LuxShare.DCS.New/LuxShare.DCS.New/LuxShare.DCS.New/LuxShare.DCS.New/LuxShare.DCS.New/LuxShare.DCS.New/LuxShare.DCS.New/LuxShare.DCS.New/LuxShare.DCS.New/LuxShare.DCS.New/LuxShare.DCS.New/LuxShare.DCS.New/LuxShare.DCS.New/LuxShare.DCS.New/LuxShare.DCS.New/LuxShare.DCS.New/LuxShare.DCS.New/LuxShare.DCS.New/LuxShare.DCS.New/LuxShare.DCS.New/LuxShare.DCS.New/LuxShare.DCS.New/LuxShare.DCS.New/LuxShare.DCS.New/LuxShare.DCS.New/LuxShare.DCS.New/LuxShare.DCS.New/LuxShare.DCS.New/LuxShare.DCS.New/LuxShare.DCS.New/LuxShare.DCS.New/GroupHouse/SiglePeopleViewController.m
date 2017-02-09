//
//  SiglePeopleViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "SiglePeopleViewController.h"
#import "Header.h"
@interface SiglePeopleViewController ()
{
    NSMutableArray *detailArr;
    NSString *grenger;
    UIImage *imgSmell;
    NSString *Title,*deptName,*chang;
    UIImage *imageBig;
}

@end

@implementation SiglePeopleViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([_people.LeaveType isKindOfClass:[NSNull class]]) {
        imgSmell = [UIImage imageNamed:@"Artboard"];
    }else{
        imgSmell = [UIImage imageNamed:@"Artboard Copy"];
    }
      
    detailArr = [[NSMutableArray alloc]initWithObjects:_people.EmpCode,_people.EmpName,_people.Gender,_people.DeptName,_people.TitleName,_people.Assets,nil];
    [self creatView];
    
    
    
    
}
//点击返回按钮 用模态弹出的方式进行推出页面
-(void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//添加控件
-(void)creatView{
    
    //添加导航信息
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"人员信息";
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    
    
    
    UIImageView *pic = [[UIImageView alloc]init];
    pic.tag = 101;
    pic.image = _imgPic;
    [self.view addSubview:pic];
    
    pic.sd_layout
    .leftSpaceToView(self.view,self.view.frame.size.width/2-(self.view.frame.size.width*.3))
    .topSpaceToView(self.view,100)
    .widthRatioToView(self.view,.3)
    .heightEqualToWidth();
    
    UIImageView *picSmell = [[UIImageView alloc]init];
    picSmell.tag = 102;
    picSmell.image = imgSmell;
    [self.view addSubview:picSmell];
    picSmell.sd_layout
    .leftSpaceToView(pic,20)
    .bottomEqualToView(pic)
    .widthRatioToView(pic,.9)
    .heightEqualToWidth();
    
    
    
    
    NSArray *titleArr = @[@"工号:",@"姓名:",@"性别:",@"部门:",@"职位名称:",@"厂区:"];
    
    for (int i =0; i<6; i++) {
        
        CGSize size = [titleArr[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil]];
        CGRect rect = [detailArr[i] boundingRectWithSize:CGSizeMake(self.view.frame.size.width-size.width-55-8, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] context:nil];
        
        UILabel *labDetail = [[UILabel alloc]init];
        labDetail.textAlignment = NSTextAlignmentLeft;
        [labDetail setNumberOfLines:0];
        labDetail.tag = i+20;
        labDetail.font = [UIFont systemFontOfSize:14];
        labDetail.text = detailArr[i];
        [self.view addSubview:labDetail];
        labDetail.sd_layout
        .leftSpaceToView(self.view,55+size.width+5)
        .rightSpaceToView(self.view,0)
        .heightIs(rect.size.height)
        .topSpaceToView(pic,30+(i%7)*(rect.size.height+20));
        
        
        
        
        UILabel *labName = [[UILabel alloc]init];
        labName.text = titleArr[i];
        labName.textAlignment = NSTextAlignmentLeft;
        labName.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:labName];
        labName.sd_layout
        .leftSpaceToView(self.view,55)
        .widthIs(size.width)
        .topEqualToView(labDetail)
        .heightIs(size.height);
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
