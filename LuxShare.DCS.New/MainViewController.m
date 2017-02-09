//
//  MainViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "MainViewController.h"
#import "Header.h"
#import <AVFoundation/AVFoundation.h>
#import "YiChangJianKong.h"
#define kLocalNotificationKey @"kLocalNotificationKey"
#define kNotificationCategoryIdentifile @"kNotificationCategoryIdentifile"
#define kNotificationActionIdentifileStar @"kNotificationActionIdentifileStar"
#define kNotificationActionIdentifileComment @"kNotificationActionIdentifileComment"
@interface MainViewController ()<UITabBarControllerDelegate>
{
    NSTimer *timer,*timerYi;
}
@property(nonatomic,strong)NSMutableArray*arr;
@property(nonatomic,strong)NSMutableArray*arrYi;

@end

@implementation MainViewController
- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    //b.创建子控制器
    FirstViewController *c1=[[FirstViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:c1];
    c1.tabBarItem.title=@"首页";
    c1.tabBarItem.image=[[self image:[UIImage imageNamed:@"shouYe@2x" ] byScalingToSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [c1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
     [c1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateSelected];
    
    //按钮上的提示数字
    // c1.tabBarItem.badgeValue=@"1";
    
    //     SecondViewController *c2=[[SecondViewController alloc]init];
    //     UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:c2];
    //     c2.tabBarItem.title=@"通讯录";
    //     c2.tabBarItem.image=[UIImage imageNamed:@"tabbar_icon_found_normal@2x"];
    
    ThreeViewController *c3=[[ThreeViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:c3];
    c3.tabBarItem.title=@"审核";
    c3.tabBarItem.image=[[self image:[UIImage imageNamed:@"shenHe@2x" ] byScalingToSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [c3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    [c3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateSelected];

    
    
    FourViewController *c4=[[FourViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:c4];
    c4.tabBarItem.title=@"个人助手";
    c4.tabBarItem.image=[[self image:[UIImage imageNamed:@"geRenZhuShou@2x" ] byScalingToSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    [c4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    [c4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateSelected];

    
    
    FiveViewController*c5=[[FiveViewController alloc]init];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:c5];
    c5.tabBarItem.title=@"我的";
    c5.tabBarItem.image=[[self image:[UIImage imageNamed:@"woDe@2x" ] byScalingToSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    [c5.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    [c5.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateSelected];

    
    
    tb.viewControllers=@[nav1,nav3,nav4,nav5];
    tb.tabBar.backgroundImage=[UIImage imageNamed:@"bar.jpeg"];
    tb.delegate = self;
    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tb];
    //设置控制器为Window的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = tb;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//     _arr = [[NSMutableArray alloc]initWithCapacity:0];
//     _arrYi = [[NSMutableArray alloc]initWithCapacity:0];
    
//    [NSThread detachNewThreadSelector:@selector(startTimer) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(startTimer1) toTarget:self withObject:nil];
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        if (timer != nil) {
//            [timer invalidate];
//            timer = nil;
//        }
//        timer = [NSTimer scheduledTimerWithTimeInterval:600.0f target:self selector:@selector(timerClick ) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//        [[NSRunLoop currentRunLoop] run];
//        [timer fire];
//       
//        
//    });
//    
//    
//    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue1, ^{
//    
//        if (timerYi != nil) {
//            [timerYi invalidate];
//            timerYi = nil;
//
//        }
//            timerYi = [NSTimer scheduledTimerWithTimeInterval:1300.0f target:self selector:@selector(timerYiClick ) userInfo:nil repeats:YES];
//            [[NSRunLoop currentRunLoop]addTimer:timerYi forMode:NSRunLoopCommonModes];
//            [[NSRunLoop currentRunLoop] run];
//            [timerYi fire];
//        
//    });
   
}
//-(void)startTimer{
//    
//    if (timer != nil) {
//        [timer invalidate];
//        timer = nil;
//    }
//    
//    timer = [NSTimer scheduledTimerWithTimeInterval:290.0f target:self selector:@selector(timerClick ) userInfo:nil repeats:YES];
//    [timer fire];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    
//
//}
//-(void)startTimer1{
//    if (timerYi != nil) {
//        [timerYi invalidate];
//        timerYi = nil;
//        
//    }
//    timerYi = [NSTimer scheduledTimerWithTimeInterval:480.0f target:self selector:@selector(timerYiClick ) userInfo:nil repeats:YES];
//    [timerYi fire];
//    [[NSRunLoop currentRunLoop]addTimer:timerYi forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    
//
//}
//-(void)timerYiClick{
//    [_arrYi removeAllObjects];
//    MainViewController*main = self;
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"key"]!= nil) {
//        
//            [HttpRequest yiChangJianKong:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(NSMutableArray *arr) {
//                if (arr == nil) {
//                    return ;
//                }else{
//                    main.arrYi = arr;
//                 }
//                
//            }];
//
//        
//            }else{
//        [timerYi invalidate];
//        timerYi = nil;
//    }
//    
//
//}
//-(void)timerClick{
//        [_arr removeAllObjects];
//        MainViewController*main = self;
//        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"key"]!= nil) {
//            
//            [HttpRequest yiChangInfo:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(NSMutableArray *arr) {
//                if (arr == nil) {
//                    return ;
//                }else{
//                    main.arr = arr;
//                  
//                }
//                
//            }];
//        }else{
//            [timer invalidate];
//             timer = nil;
//        }
//
//    
//}
//-(void)setArr:(NSMutableArray *)arr{
//       _arr = arr;
//    for (TongModel*model1 in _arr) {
//        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//        //触发通知时间
//        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0f];
//        //重复间隔
//        //localNotification.repeatInterval = kCFCalendarUnitMinute;
//        localNotification.timeZone = [NSTimeZone defaultTimeZone];
//        //通知内容
//        localNotification.alertBody = [NSString stringWithFormat:@"线别:%@\n问题描述:%@\n备注:%@\n时间:%@",model1.Line,model1.Description,model1.Remark,model1.ModifyTime];
//        localNotification.applicationIconBadgeNumber = _arr.count;
//        localNotification.soundName = UILocalNotificationDefaultSoundName;
//        //通知参数
//        localNotification.userInfo = @{kLocalNotificationKey: [NSString stringWithFormat:@"线别:%@\n问题描述:%@\n备注:%@\n时间:%@",model1.Line,model1.Description,model1.Remark,model1.ModifyTime]};
//        localNotification.category = kNotificationCategoryIdentifile;
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//        
//    }
//    
//    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"arr" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:_arr,@"_arr", nil]];
//      AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
//}
//
//-(void)setArrYi:(NSMutableArray *)arrYi{
//    _arrYi = arrYi;
//    for (YiChangJianKong*model1 in _arrYi) {
//        UILocalNotification *localNotification1 = [[UILocalNotification alloc] init];
//        //触发通知时间
//        localNotification1.fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0f];
//        //重复间隔
//        //localNotification.repeatInterval = kCFCalendarUnitMinute;
//        localNotification1.timeZone = [NSTimeZone defaultTimeZone];
//        //通知内容
//        localNotification1.alertBody = [NSString stringWithFormat:@"类型:%@\n异常:%@\n时间:%@",model1.FromTo,model1.Subject,model1.Datetimereceived];
//        localNotification1.applicationIconBadgeNumber = _arrYi.count;
//        localNotification1.soundName = UILocalNotificationDefaultSoundName;
//        //通知参数
//        localNotification1.userInfo = @{kLocalNotificationKey: [NSString stringWithFormat:@"类型:%@\n异常:%@\n时间:%@",model1.FromTo,model1.Subject,model1.Datetimereceived]};
//        localNotification1.category = kNotificationCategoryIdentifile;
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification1];
//        
//    }
//    
//    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"arrYi" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:_arrYi,@"_arrYi", nil]];
//    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
//}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSInteger index = tabBarController.selectedIndex;
    switch (index) {
        case 0:{
            
        }
            break;
        case 1:{
            
        }
            break;
        case 2:{
            
        }
            break;
        case 3:{
            
        }
            break;
        case 4:{
            
        }
            break;
        default:
            break;
    }
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
