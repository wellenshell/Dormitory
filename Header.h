//
//  Header.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/19.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define kPublic self.view.backgroundColor = [UIColor whiteColor];self.navigationController.navigationBarHidden = YES;
#define KNAME [[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"];

#import "UIFONT.h"
#import <SVProgressHUD.h>
#import <SDAutoLayout.h>
#import <SDCycleScrollView.h>
#import <UIImageView+WebCache.h>
#import <AFNetworking.h>
#import <ZBarSDK.h>
#import <MJRefresh.h>
#import <AFNetworkReachabilityManager.h>
#import "LoginView.h"
#import "HttpRequest.h"
#import "KPromptBox.h"
#import "Model.h"

////-------------------------------------------------乘车
//  提示框
#define KalertView  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要提交吗" message:nil preferredStyle:UIAlertControllerStyleAlert]; UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {ReFushViewController *refush = [[ReFushViewController alloc]init];[self presentViewController:refush animated:YES completion:nil];}];[alert addAction:sure];UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {return; }];[alert addAction:cancel];[self presentViewController:alert animated:YES completion:nil];




//---------------------------------------------------宿舍管理
// 倒入的类名字

#import "SiglePeopleViewController.h"
#import "PeopleM.h"
#import "Public.h"
#import "MoreTableViewCell.h"
#import "LXAlertView.h"
//---------------------------------------------------门禁管理
//使用富文本加载 显示不同的字体颜色
#define KaddText(strName)  NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:strName];NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]};[AttributedStr setAttributes:attributeDict range:NSMakeRange(3, strName.length-9)];UILabel *labText = [[UILabel alloc]init];labText.attributedText = AttributedStr;labText.font = [UIFont systemFontOfSize:15.0];labText.textAlignment = NSTextAlignmentCenter;[self.view addSubview:labText];labText.sd_layout.leftSpaceToView(self.view,30).rightSpaceToView(self.view,30).bottomSpaceToView(self.view,80).heightIs(40);

#define KalertLogin(massage) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:massage preferredStyle:UIAlertControllerStyleAlert];UIAlertAction *sure = [UIAlertAction actionWithTitle:@"知道啦" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {return ;}];[alert addAction:sure];[self presentViewController:alert animated:YES completion:nil];


// 倒入的类名字
#import "DoorHomeViewController.h"
#import "DoorScanningViewController.h"
#import "DoorCheckViewController.h"
#import "VisitorViewController.h"
#import "PeopleModeller.h"
#import "PeopleShowViewController.h"
#import "ThingViewController.h"
#import "GuestModel.h"
#import "VisitorTableViewCell.h"
#import "DidGuestTableViewCell.h"
#import "ThingsModel.h"
#import "CodeViewController.h"
#import "ManufacturerModel.h"
#import "SureCodeViewController.h"
#import "LeaveViewController.h"
#import "ThingTableViewCell.h"
#import "GongYingShangViewController.h"
#import "ChangShang.h"
#import "HouseViewController.h"
#import "SaoMiaoViewController.h"
#import "CheckPeopleViewController.h"
#endif /* Header_h */
