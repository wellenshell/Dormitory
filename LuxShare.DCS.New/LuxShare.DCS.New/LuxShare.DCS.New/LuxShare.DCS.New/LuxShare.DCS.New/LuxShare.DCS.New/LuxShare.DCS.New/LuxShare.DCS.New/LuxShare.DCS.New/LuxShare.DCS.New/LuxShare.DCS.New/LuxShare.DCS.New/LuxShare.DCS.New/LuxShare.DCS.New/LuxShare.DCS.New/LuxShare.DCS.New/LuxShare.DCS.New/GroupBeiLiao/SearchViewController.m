//
//  SearchViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/2.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "SearchViewController.h"
#import "Header.h"

@interface myTextField : UITextField

@end

@implementation myTextField

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super leftViewRectForBounds:bounds];
    rect = CGRectMake(rect.origin.x + 10, rect.origin.y, rect.size.width, rect.size.height);
    return rect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super rightViewRectForBounds:bounds];
    rect = CGRectMake(rect.origin.x - 10, rect.origin.y, rect.size.width, rect.size.height);
    return rect;
}

@end

@interface SearchViewController ()<UITextFieldDelegate>
{
    UIView*bigView;
}

@end

@implementation SearchViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"查 询";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBarController.tabBar.hidden = YES;
    
    UIButton*leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 80, 30);
    [leftBtn setTitle:@"< 返回" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
}
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self creatView]];
    
    
}

-(UIView*)creatView{
    if (!bigView) {
        bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
        bigView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
        
        UIImageView*image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2- SCREENWIDTH/10, 20, SCREENWIDTH/5, SCREENWIDTH/5)];
        image.layer.cornerRadius = SCREENWIDTH/10;
        image.clipsToBounds = YES;
        [HttpRequest getPersonImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(UIImage *imageData) {
            image.image = imageData;
        }];
        [bigView addSubview:image];
        
        NSArray *imaegArr = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"comm_user"],[UIImage imageNamed:@"comm-mudixianbie"],[UIImage imageNamed:@"comm-xianbie"], nil];
         NSArray *titleArr = [[NSArray alloc]initWithObjects:@"  工号",@"  线别",@"  目的线别",nil];
        for (int i = 0; i<3; i++) {
            myTextField*tf = [[myTextField alloc]init];
            tf.tag = i+1;
            tf.delegate = self;
            tf.borderStyle = UITextBorderStyleLine;
            UIImageView*imageView = [[UIImageView alloc]init];
            imageView.image = imaegArr[i];
            imageView.frame = CGRectMake(0, 0, 20, 20);
            tf.leftView = imageView;
            tf.leftViewMode = UITextFieldViewModeAlways;
            tf.placeholder = titleArr[i];
            [bigView addSubview:tf];
            tf.sd_layout
            .leftSpaceToView(bigView,30)
            .rightSpaceToView(bigView,30)
            .topSpaceToView(image,20+(i%3)*50)
            .heightIs(40);
            
            if (i == 0) {
                UIButton*imRight = [UIButton buttonWithType:UIButtonTypeCustom];
                [imRight addTarget:self action:@selector(saoMiaoClick) forControlEvents:UIControlEventTouchUpInside];
                [imRight setBackgroundImage:[UIImage imageNamed:@"comm-saoyisao"] forState:UIControlStateNormal];
                imRight.frame = CGRectMake(0, 0, 20, 20);
                tf.rightView = imRight;
                tf.rightViewMode = UITextFieldViewModeAlways;
            }
            
        }
        
        myTextField*tf1 = [bigView viewWithTag:3];
        UIButton*checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkBtn setTitle:@"查 询" forState:UIControlStateNormal];
        [checkBtn addTarget:self action:@selector(checkBtnClick) forControlEvents:UIControlEventTouchUpInside];
        checkBtn.backgroundColor = [UIColor orangeColor];
        [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        checkBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [bigView addSubview:checkBtn];
        checkBtn.sd_layout
        .leftSpaceToView(bigView,30)
        .rightSpaceToView(bigView,30)
        .heightIs(40)
        .topSpaceToView(tf1,40);
        
        return bigView;
    }else{
        return bigView;
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)saoMiaoClick{
    
}
-(void)checkBtnClick{
    
}























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
