//
//  FiveViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/2.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "FiveViewController.h"
#import "Header.h"
@interface FiveViewController ()
{
    UIView*bigView;
}

@end

@implementation FiveViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count >1) {
        self.tabBarController.tabBar.hidden =YES;
    }else {
        self.tabBarController.tabBar.hidden =NO;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"我的";
    
     [self.view addSubview:[self createView]];
}



-(UIView*)createView{
    if (bigView) {
        return bigView;
    }else{
        bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64-48)];
        bigView.backgroundColor = [UIColor whiteColor];
        
        UIImageView*image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2- SCREENWIDTH/10, 20, SCREENWIDTH/5, SCREENWIDTH/5)];
        image.layer.cornerRadius = SCREENWIDTH/10;
        image.clipsToBounds = YES;
        [HttpRequest getPersonImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(UIImage *imageData) {
            image.image = imageData;
        }];
        [bigView addSubview:image];
        
        UILabel *labName = [[UILabel alloc]init];
        labName.font = [UIFont systemFontOfSize:14];
        labName.textAlignment = NSTextAlignmentCenter;
        [HttpRequest getPersonInfo:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(PeopleM *people) {
            labName.text = people.EmpName;
        }];
        [bigView addSubview:labName];
        labName.sd_layout
        .leftEqualToView(image)
        .rightEqualToView(image)
        .heightIs(20)
        .topSpaceToView(image,8);
        
        
        
        
        NSArray *arr = [[NSArray alloc]initWithObjects:@"个人资料",@"岗位说明",@"退出登录", nil];
        for (int i = 0; i<3; i++) {
            UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.layer.cornerRadius = 5;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i+1;
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [bigView addSubview:btn];
            if (i == 0 || i ==1) {
                btn.backgroundColor = [UIColor orangeColor];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                btn.sd_layout
                .leftSpaceToView(bigView,40)
                .rightSpaceToView(bigView,40)
                .topSpaceToView(labName,30+(i%3)*60)
                .heightIs(40);
            }else{
                btn.backgroundColor = [UIColor redColor];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                btn.sd_layout
                .leftSpaceToView(bigView,40)
                .rightSpaceToView(bigView,40)
                .topSpaceToView(labName,30+(i%3)*80)
                .heightIs(40);
            }
            
            

        }
        
        
        
        
        return bigView;
    }
}


-(void)btnClick:(UIButton*)btn{
    switch (btn.tag) {
        case 1:{
            PeopleViewController*people = [[PeopleViewController alloc]init];
            [self.navigationController pushViewController:people animated:YES];
            
        }
            break;
        case 2:{
            
            JobViewController*job = [[JobViewController alloc]init];
            [self.navigationController pushViewController:job animated:YES];
            
        }
            break;
        case 3:{
            
            UIAlertController*alert = [UIAlertController alertControllerWithTitle:@"是否退出登录" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"tfPsw"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                LoginView*login =[[LoginView alloc]init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:login animated:YES];

                
            }];
            [alert addAction:action1];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }];
            [alert addAction:action2];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
