//
//  PeopleShowViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "PeopleShowViewController.h"
#import "Header.h"
@interface PeopleShowViewController ()
{
    NSMutableArray *detailArr;
    NSString *grenger;
    UIImageView*picSmell;
    UIImage*smell;
    
}

@end

@implementation PeopleShowViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    kPublic;
    
    NSString *ok ;
    NSString *asset;
    
    //用一个数组接收传过来的数据 便于展示
    
    if ([_people.Assets isKindOfClass:[NSNull class]]) {
        ok = @"不允许";
        asset = @"没有登记";
    }else{
        ok = @"允许";
        asset = _people.Assets;
    }
        
    detailArr = [[NSMutableArray alloc]initWithObjects:_people.EmpCode,_people.EmpName,_people.Gender,_people.DeptName,_people.Title,asset,ok, nil];
    [self creatView];
    [HttpRequest getPersonLeave:_people.EmpCode completeWithData:^(NSString *leaveData) {
        if ([leaveData isKindOfClass:[NSNull class]]) {
            smell = [UIImage imageNamed:@"Artboard"];
        }else{
            smell = [UIImage imageNamed:@"Artboard Copy"];
        }
        picSmell.image = smell;
    }];
    
    
    
    
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
    .topSpaceToView(self.view,80)
    .widthRatioToView(self.view,.3)
    .heightEqualToWidth();
    
    picSmell = [[UIImageView alloc]init];
    picSmell.tag = 102;
    [self.view addSubview:picSmell];
    picSmell.sd_layout
    .leftSpaceToView(pic,20)
    .bottomEqualToView(pic)
    .widthRatioToView(pic,.9)
    .heightEqualToWidth();
    
    
    NSArray *titleArr = @[@"工号:",@"姓名:",@"性别:",@"部门:",@"职位名称:",@"资产:",@"携带资产出厂:"];
    
    for (int i =0; i<7; i++) {
        
        CGSize size = [titleArr[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil]];
        
        CGRect rect = [detailArr[i] boundingRectWithSize:CGSizeMake(self.view.frame.size.width-size.width-55-8, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] context:nil];
        
        UILabel *labDetail = [[UILabel alloc]init];
        labDetail.textAlignment = NSTextAlignmentLeft;
        [labDetail setNumberOfLines:0];
        labDetail.tag = i+20;
        labDetail.font = [UIFont systemFontOfSize:14];
        labDetail.text = detailArr[i];
        [self.view addSubview:labDetail];
        
        if (i == 6) {
            UILabel *laa = (UILabel*)[self.view viewWithTag:25];
            labDetail.sd_layout
            .leftSpaceToView(self.view,55+size.width+5)
            .rightSpaceToView(self.view,0)
            .heightIs(rect.size.height)
            .topSpaceToView(laa,15);
        }else{
            if (i == 5) {
                UILabel *laas = (UILabel*)[self.view viewWithTag:24];
                labDetail.sd_layout
                .leftSpaceToView(self.view,55+size.width+5)
                .rightSpaceToView(self.view,0)
                .heightIs(rect.size.height)
                .topSpaceToView(laas,15);
            }else{
                
                labDetail.sd_layout
                .leftSpaceToView(self.view,55+size.width+5)
                .rightSpaceToView(self.view,0)
                .heightIs(rect.size.height)
                .topSpaceToView(pic,25+(i%7)*(rect.size.height+20));
            }
        }
        
        
        UILabel *labName = [[UILabel alloc]init];
        labName.text = titleArr[i];
        labName.textAlignment = NSTextAlignmentLeft;
        labName.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:labName];
        if (i == 6) {
            labName.sd_layout
            .leftSpaceToView(self.view,55)
            .widthIs(size.width)
            .topEqualToView(labDetail)
            .heightIs(size.height);
        }else{
            
            labName.sd_layout
            .leftSpaceToView(self.view,55)
            .widthIs(size.width)
            .topEqualToView(labDetail)
            .heightIs(size.height);
        }
        
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
