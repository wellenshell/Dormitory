//
//  DoorCheckViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "DoorCheckViewController.h"
#import "Header.h"
@interface DoorCheckViewController ()<UITextFieldDelegate>
{
    UILabel *lab;
    UIImage*image;
    
}

@end

@implementation DoorCheckViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNav];
    lab.text = _titleText;
    
    
}
//添加导航部分
-(void)creatNav{
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(6, 100, 60, 40)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:lable];
    
    UITextField *tfCode = [[UITextField alloc]init];
    tfCode.tag = 100;
    tfCode.delegate = self;
    tfCode.borderStyle = UITextBorderStyleRoundedRect;
    tfCode.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:tfCode];
    
    tfCode.sd_layout
    .leftSpaceToView(lable,5)
    .topEqualToView(lable)
    .rightSpaceToView(self.view,10)
    .heightIs(40);
    
    UIButton *buttonCheck = [[UIButton alloc]init];
    [buttonCheck setBackgroundColor:[UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1]];
    [buttonCheck setTitle:@"查询" forState:UIControlStateNormal];
    [buttonCheck addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonCheck setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonCheck.layer.cornerRadius = 10;
    [self.view addSubview:buttonCheck];
    
    
    buttonCheck.sd_layout
    .leftSpaceToView(self.view,20)
    .topSpaceToView(lable,40)
    .rightSpaceToView(self.view,20)
    .heightIs(40);
    
    
    
    UIButton *buttonSure = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSure.layer.cornerRadius = 10;
    [buttonSure setTitle:@"确认选择" forState:UIControlStateNormal];
    [buttonSure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonSure.backgroundColor = [UIColor colorWithRed:203.0/255.0 green:209.0/255.0 blue:44.0/255.0 alpha:1];
    [buttonSure addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSure];
    
    buttonSure.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(30)
    .bottomSpaceToView(self.view,10);
    
    //判断进入的是哪个页面
    if (_number == 11) { //进入的是查询人员
        buttonSure.hidden = YES;
        
        buttonCheck.hidden = NO;
        lable.hidden = NO;
        tfCode.hidden = NO;
        lable.text = @"工号:";
        lable.font = [UIFont systemFontOfSize:14];
        tfCode.placeholder = @"请输入工号";
    }else if (_number == 13){ //进入的是查询资产
        buttonSure.hidden = YES;
        buttonCheck.hidden = NO;
        lable.hidden = NO;
        tfCode.hidden = NO;
        lable.text = @"资产编号:";
        lable.font = [UIFont systemFontOfSize:13];
        tfCode.placeholder = @"请输入资产编号";
    }else{
        
        buttonCheck.hidden = YES;
        lable.hidden = YES;
        tfCode.hidden = YES;
    }
    
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)sureBtnClick{
    
}


//判断进入的是哪个页面
-(void)buttonClick{
    
    UITextField *tfCode = (UITextField*)[self.view viewWithTag:100];
    [tfCode resignFirstResponder];
    
    if (tfCode.text.length != 0) {
        
        // 判断输入的字符串中是否含有特殊字符 进行处理
        NSString *str1 =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
        NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str1];
        if (![emailTest evaluateWithObject:tfCode.text]) {
            [KPromptBox showKPromptBoxWithMassage:@"请检查是否输入正确"];
            return;
        }

        NSString *newCode = nil;
        for (int i = 0; i<tfCode.text.length; i++) {
            unichar c = [tfCode.text characterAtIndex:i];
            if (c >=0x4E00 && c <=0x9FFF)
            {
                [KPromptBox showKPromptBoxWithMassage:@"请检查是否输入正确"];
                return;
            }
            else
            {
                newCode = tfCode.text;
            }
 
        }
                NSString *str = [newCode stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        if (_number == 11) { //手动查询人员
            [HttpRequest getPersonalInfo:str completeWithData:^(PeopleModeller *people) {
                [HttpRequest getPersonImage:people.EmpCode completeWithData:^(UIImage *imageData) {
                    PeopleShowViewController*person = [[PeopleShowViewController alloc]init];
                    person.people = people;
                    person.imgPic = imageData;
                    [self presentViewController:person animated:YES completion:^{
                        tfCode.text = @"";
                        
                    }];
                }];
            }];
            
            
        }else if(_number == 13){ //手动查询资产
            
            NSMutableArray *thArr = [[NSMutableArray alloc]initWithCapacity:0];
            [HttpRequest getThingsInfo:str completeWithData:^(ThingsModel *thing) {
                
                [thArr addObject:thing];
                ThingViewController *things = [[ThingViewController alloc]init];
                
                things.model = thing;
                
                things.bigArr = thArr;
                
                [self presentViewController:things animated:YES completion:^{
                    tfCode.text = @"";
                    
                }];
                
            }];
            
        }else{
            
        }
    }else{
        KalertLogin(@"请先输入 在查询哦!");
    }
    
}

// 判断进来的时候是从哪进来的 出去的时候以什么方式出去
-(void)backBtnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
