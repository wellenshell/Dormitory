//
//  AppDelegate.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/19.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "AppDelegate.h"
#import "Header.h"
#import <AdSupport/AdSupport.h>
#import <AVFoundation/AVFoundation.h>
#import <BugHD/BugHD.h>
#import "UMMobClick/MobClick.h"
#import <PgyUpdate/PgyUpdateManager.h>
@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc]init];
    NSLog(@"---------------");
    //蒲公英上的应用更新提示
    [[PgyUpdateManager sharedPgyManager] startManagerWithAppId:@"67e2518f1eb502188eafd9543542259a"];
    [[PgyUpdateManager sharedPgyManager] checkUpdate];

       
    NSString *key = [[NSUserDefaults standardUserDefaults]objectForKey:@"key"];
    if (!key) {
        
        LoginView*first = [[LoginView alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:first];
        self.window.rootViewController = nav;
    }else{
    
        HouseViewController*first = [[HouseViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:first];
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
    
      //异常崩溃信息
     NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
   
    //友盟统计
    UMConfigInstance.appKey = @"5849290ae88bad6a010016fa";
    [MobClick startWithConfigure:UMConfigInstance];


    
    
    
    
    return YES;
}
void UncaughtExceptionHandler(NSException *exception) {
    /**
     *  获取异常崩溃信息
     */
    NSArray *callStack = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *content = [NSString stringWithFormat:@"=====门禁===异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[callStack componentsJoinedByString:@"\n"]];
    
    /**
     *  把异常崩溃信息发送至开发者邮件
     */
    NSMutableString *mailUrl = [NSMutableString string];
    [mailUrl appendString:@"mailto:Mingming.Du@luxshare-ict.com"];
    [mailUrl appendString:@"?subject=程序异常，请配合发送异常报告，谢谢合作！"];
    [mailUrl appendFormat:@"&body=%@", content];
    
    // 打开地址
    NSString *mailPath = [mailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailPath]];
    
}


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskPortrait;
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   }

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
