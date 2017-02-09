//
//  SaoMiaoViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/25.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "SaoMiaoViewController.h"
#import "Header.h"
@interface SaoMiaoViewController ()<ZBarReaderViewDelegate>
{
    ZBarCameraSimulator *cameraSim;
    NSString *data;
    UIView *bigV;
    
    
}
@end

@implementation SaoMiaoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNav];
    [self.view addSubview:[self returnView]];
}

//添加导航部分
-(void)creatNav{
    
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 20, self.view.frame.size.width, SCREENHEIGHT/10);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
   UILabel* lab = [[UILabel alloc]init];
    lab.text = @"扫描人员信息";
    lab.frame = CGRectMake(0, 0, SCREENWIDTH, bigView.bounds.size.height);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:24]];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.userInteractionEnabled = YES;
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0,lab.bounds.size.height/2, lab.bounds.size.height);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [lab addSubview:button];
    
    UILabel *labText = [[UILabel alloc]init];
    labText.text = @"将条码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别";
    labText.font = [UIFont systemFontOfSize:[UIFONT fontWithDevice:17]];
    labText.textColor = [UIColor blackColor];
    labText.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:labText];
    
    labText.sd_layout
    .leftSpaceToView(self.view,10)
    .topSpaceToView(self.view,20+SCREENHEIGHT/10)
    .heightIs(50)
    .widthIs(self.view.frame.size.width);
    
   
}
//二维码的扫描区域
-(UIView*)returnView{
    if (bigV) {
        return bigV;
    }else{
        
        bigV = [[UIView alloc]initWithFrame:CGRectMake(0, 20+SCREENHEIGHT/10, SCREENWIDTH, SCREENHEIGHT)];
        bigV.backgroundColor = [UIColor whiteColor];
        
        UILabel *labText = [[UILabel alloc]init];
        labText.text = @"将条码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别";
        labText.textColor = [UIColor blackColor];
        labText.textAlignment = NSTextAlignmentLeft;
        labText.font = [UIFont systemFontOfSize:self.view.frame.size.width/34];
        [bigV addSubview:labText];
        
        labText.sd_layout
        .leftSpaceToView(bigV,10)
        .topSpaceToView(bigV,0)
        .heightIs(30)
        .widthIs(SCREENWIDTH);
        
        ZBarReaderView *readerView = [[ZBarReaderView alloc]init];
        readerView.frame = CGRectMake(10, 30, self.view.frame.size.width-20, self.view.frame.size.height-66-SCREENHEIGHT/10);
        readerView.readerDelegate = self;
        ZBarImageScanner * scanner = readerView.scanner;
        [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
        [bigV addSubview:readerView];
        
        if(TARGET_IPHONE_SIMULATOR) {
            cameraSim = [[ZBarCameraSimulator alloc]
                         initWithViewController: self];
            cameraSim.readerView = readerView;
        }
        [readerView start];

        
        return bigV;
    }
}
//实现代理方法 进行读取二维码的内容
- (void) readerView: (ZBarReaderView*) readerView
     didReadSymbols: (ZBarSymbolSet*) symbols
          fromImage: (UIImage*) image{
    
    for(ZBarSymbol *sym in symbols) {
        NSString *code = sym.data;
        
        NSLog(@"---code---%@",code);

        //在这解析 获取信息之后 将model传入下一个展示页面 判断进入那个页面
        //查询人员页面
      
        if (code != nil) {
            if (code.length>7) {
                 [KPromptBox showKPromptBoxWithMassage:@"请扫描你的厂牌"];
            }else{
            [HttpRequest getPersonImage:code completeWithData:^(UIImage *imageData) {
                if (imageData == nil) {
                    return ;
                }else{
                [HttpRequest getPersonInfo:code completeWithData:^(PeopleM *people) {
                    if (people == nil) {
                        return ;
                    }else{
                    SiglePeopleViewController*person = [[SiglePeopleViewController alloc]init];
                    person.people = people;
                    person.imgPic = imageData;
                    [self presentViewController:person animated:YES completion:nil];
                    }
                }];
                }
            }];
            
            break;
            }
        }
            }
    
}
//回到主页面
-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
