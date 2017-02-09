//
//  LoginView.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/24.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "LoginView.h"
#import "Header.h"
#import "keychainDeviceID.h"


@interface LoginView ()<UITextFieldDelegate>
{
    
    UITextField *_tfName,*_tfPsw;
    UISwitch *_swi;
    UIActivityIndicatorView*activity;
    
}

@end

@implementation LoginView

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
    
}
//判断是否有网
-(void)getInternetInfo{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            KalertLogin(@"不好意思 请先连接网络");
            [activity stopAnimating];
        }else{
            return;
        }
    }];
}

//判断是否记住密码 并显示
-(void)changeState{
    
    NSString *on =[[NSUserDefaults standardUserDefaults]objectForKey:@"on"];
    //判断首先看是否已注销（如果注销就将输入框清空 wei置为off） 如果没有就判断上次swi是否打开（如果打开就将wei置为on 并且输入框有内容）
    NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
     NSString *psw = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfPsw"];
    
    if (on != nil) {
        _swi.on = YES;
        _tfName.text = name;
        _tfPsw.text = psw;
    }else{
        _swi.on = NO;
        _tfName.text = nil;
        _tfPsw.text = nil;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNav];
    [self creatLoginView];
    [self changeState];
    
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
    
    self.navigationController.navigationBarHidden = YES;
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(0, 30, self.view.frame.size.width, 30);
    lab.textColor = [UIColor blackColor];
    lab.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:24]];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"用户登录";
    [self.view addSubview:lab];
}


//添加视图
-(void)creatLoginView{
    
    UIImageView *imageLogin = [[UIImageView alloc]initWithFrame:CGRectMake(20, 70,self.view.frame.size.width-40, SCREENHEIGHT*.2)];
    imageLogin.image = [UIImage imageNamed:@"Wall_Luxshare-ICT_OL"];
    [self.view addSubview:imageLogin];
    
    _tfName = [[UITextField alloc]initWithFrame:CGRectMake(30, SCREENHEIGHT*.2+90, self.view.frame.size.width-60, SCREENHEIGHT*.1)];
    _tfName.placeholder = @"请输入用户名";
    _tfName.borderStyle = UITextBorderStyleLine;
    _tfName.tag = 10;
    _tfName.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:20]];
    _tfName.clearButtonMode = UITextFieldViewModeUnlessEditing;
    _tfName.delegate = self;
    [self.view addSubview:_tfName];
    
    _tfPsw = [[UITextField alloc]init];
    _tfPsw.placeholder = @"请输入密码";
    _tfPsw.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:20]];
    _tfPsw.borderStyle = UITextBorderStyleLine;
    _tfPsw.tag = 20;
    _tfPsw.delegate = self;
    _tfPsw.secureTextEntry = YES;
    _tfPsw.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [self.view addSubview:_tfPsw];
    _tfPsw.sd_layout
    .leftEqualToView(_tfName)
    .rightEqualToView(_tfName)
    .heightIs(SCREENHEIGHT*.1)
    .topSpaceToView(_tfName,SCREENHEIGHT*.01);
    
    _swi = [[UISwitch alloc]init];
    _swi.onTintColor
    = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [_swi addTarget:self action:@selector(swiClick) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_swi];
    
    _swi.sd_layout
    .rightSpaceToView(self.view,40)
    .topSpaceToView(_tfPsw,SCREENWIDTH*.04)
    .heightIs(40)
    .widthIs(100);
    
    
    
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"记住我";
    lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:17]];
    lab.textColor = [UIColor blackColor];
    [self.view addSubview:lab];
    
    lab.sd_layout
    .rightSpaceToView(_swi,0)
    .topSpaceToView(_tfPsw,SCREENWIDTH*.03)
    .heightIs(40)
    .widthIs(SCREENWIDTH*.2);
    
    
    
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1]];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:20]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    [self.view addSubview:button];
    
    button.sd_layout
    .leftSpaceToView(self.view,SCREENWIDTH/10)
    .rightSpaceToView(self.view,SCREENWIDTH/10)
    .bottomSpaceToView(self.view,SCREENHEIGHT*.15)
    .heightIs(SCREENHEIGHT*.08);
    
    
}

//记住我
-(void)swiClick{
    
}

-(void)buttonClick{
    [self getInternetInfo];
   
    if (_tfName.text.length == 0 || _tfPsw.text.length == 0) {
       KalertLogin(@"账号或密码不能为空");
    }else{
        
        NSString *newString = [_tfName.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *newPsw = [_tfPsw.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        // 判断输入的字符串中是否含有最特殊字符 进行处理
        NSString *str1 =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
        NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str1];
        if (![emailTest evaluateWithObject:newString]) {
            KalertLogin(@" 请检查输入是否正确! 请不要含有空格等特殊字符");
            return;
        }
        unichar c = [newString characterAtIndex:0];
        if (c >=0x4E00 && c <=0x9FFF)
        {
          KalertLogin(@"请输入正确的工号");
            return;
        }else{
            //判断权限
           [HttpRequest sendLogin:newString completeWithData:^(BOOL isSuccess) {
               if (isSuccess == YES) {
                   NSString *UUID = [keychainDeviceID getUUID];
                   [HttpRequest sendLoginRequest:newString pasword:newPsw uuid:UUID completeWithData:^(BOOL isSuccess) {
                       // 登录成功
                       if (isSuccess == YES) {
                           if (_swi.on == YES) {
                               
                               //只是为了判断是否打开
                               [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"on"];
                           }else{
                               [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"on"];
                           }
                           
                           [activity stopAnimating];
                           HouseViewController*first = [[HouseViewController alloc]init];
                           [self.navigationController pushViewController:first animated:YES];
                           
                           
                           [[NSUserDefaults standardUserDefaults]setObject:[_tfName.text stringByReplacingOccurrencesOfString:@" " withString:@""] forKey:@"tfName"];
                        
                           
                           [[NSUserDefaults standardUserDefaults]setObject:[_tfPsw.text stringByReplacingOccurrencesOfString:@" " withString:@""] forKey:@"tfPsw"];
                           
                           [[NSUserDefaults standardUserDefaults]setObject:@"key" forKey:@"key"];
                           
                           [[NSUserDefaults standardUserDefaults]synchronize];
                           
                           
                           
                           
                       }else{
                           
                           [activity stopAnimating];
                           
                       }
                   }];
 
               }else{
                   
               }
           }];
           
           }
    
    
 }


}

//按回车键时输入框的光标移移动
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == 10) {
        
        [_tfName resignFirstResponder];
        [_tfPsw  becomeFirstResponder];
        
    }else{
        [_tfPsw resignFirstResponder];
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
