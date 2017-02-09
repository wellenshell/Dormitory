//
//  ScanningViewController.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/8.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "ScanningViewController.h"
#import "Header.h"
#import <AVFoundation/AVFoundation.h>
@interface ScanningViewController ()<ZBarReaderViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    ZBarCameraSimulator *cameraSim;
    NSString *data;
    UILabel*lab;
    NSMutableArray *list;
    AVAudioPlayer*player;
    NSMutableArray *arr,*showArr;
    UITableView*tab;
    NSMutableDictionary *dic ;
    
}
@end

@implementation ScanningViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kPublic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatNav];
    [self setScanView];
    list = [[NSMutableArray alloc]initWithCapacity:0];
    showArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    arr = [NSMutableArray arrayWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleA.plist"]];
    for (NSString *coo in arr) {
        [showArr addObject:coo];
        
    }
}

//添加导航部分
-(void)creatNav{
    Model *model = [[Model alloc]init];
    UIView *bigView = [model returnTitleView:@"扫描乘车人员信息"];
    [model.leftBtn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [model.rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigView];
    
    UILabel *labText = [[UILabel alloc]init];
    labText.text = @"将条码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别";
    labText.textColor = [UIColor blackColor];
    labText.textAlignment = NSTextAlignmentLeft;
    labText.font = [UIFont systemFontOfSize:self.view.frame.size.width/34];
    [self.view addSubview:labText];
    
    labText.sd_layout
    .leftSpaceToView(self.view,10)
    .topSpaceToView(self.view,70)
    .heightIs(30)
    .widthIs(self.view.frame.size.width);
}
//二维码的扫描区域
- (void)setScanView
{
    ZBarReaderView *readerView = [[ZBarReaderView alloc]init];
    readerView.frame = CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.height-200);
    readerView.readerDelegate = self;
    [self.view addSubview:readerView];
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    tab.layer.cornerRadius = 10;
    tab.clipsToBounds = YES;
    tab.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .bottomSpaceToView(self.view,5)
    .topSpaceToView(readerView,10);
    
    if(TARGET_IPHONE_SIMULATOR) {
        cameraSim = [[ZBarCameraSimulator alloc]initWithViewController: self];
        cameraSim.readerView = readerView;
    }
    [readerView start];
}
//实现代理方法 进行读取二维码的内容
- (void)readerView: (ZBarReaderView*) readerView
     didReadSymbols: (ZBarSymbolSet*) symbols
          fromImage: (UIImage*) image{
    
    for(ZBarSymbol *sym in symbols) {
        NSString *code = sym.data;
        if (code != nil) {
            if ([arr containsObject:code]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
                
                if ([list containsObject:code]) {
                    [list removeObject:code];
                    [list addObject:code];
                }else{
                    [list addObject:code];
                }
                
                
                NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yes" ofType:@"wav"]];
                player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
                //设置初始音量大小
                player.volume = 1;
                [player play];
                AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
                [self presentViewController:alert animated:YES completion:^{
                    [self performSelector:@selector(after:) withObject:alert afterDelay:1];
                    
                }];
                
                
                for (NSString *c in list) {
                    if ([showArr containsObject:c]) {
                        [showArr removeObject:c];
                        [tab reloadData];
                    }
                }
                
                NSLog(@"--------%@------%ld",showArr,showArr.count);
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您还没有预约" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:YES completion:^{
                    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"no" ofType:@"wav"]];
                    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
                    //设置初始音量大小
                    player.volume = 1;
                    //预播放
                    [player play];
                    [self performSelector:@selector(after:) withObject:alert afterDelay:1];
                    
                }];
                
            }
        }
        
        
        break;
    }
    
}
-(void)after:(UIAlertController *)alert{
    [alert dismissViewControllerAnimated:YES completion:nil];
}
//回到主页面
-(void)leftClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您正在进行扫描,如果此时返回,扫描过的数据将消失,确定要返回吗" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:sure];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {return; }];[alert addAction:cancel];[self presentViewController:alert animated:YES completion:nil];
}
-(void)rightClick{
    //确定提交后的操作 刷新列表 如果没有选择乘车人就进行选择
    if (list.count == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择乘车人员" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:^{
            // 延时退出
            [self performSelector:@selector(after:) withObject:alert afterDelay:.5];
        }];
        
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要提交吗" message:nil preferredStyle:UIAlertControllerStyleAlert]; UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 确定提交了之后 向服务器发送请求
            
            [HttpRequest refushPeople:_shiftCode list:list completeWithData:^(PeopleModel *model) {
            }];
            BusNumberViewController*bus = [self.navigationController.viewControllers objectAtIndex:0];
            [self.navigationController popToViewController:bus animated:YES];
        }];
        [alert addAction:sure];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {return; }];[alert addAction:cancel];[self presentViewController:alert animated:YES completion:nil];
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return showArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellsmell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.textLabel.text = @"";
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
    dic = [NSMutableDictionary dictionaryWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/peopleB.plist"]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@－%@",[dic objectForKey:[showArr objectAtIndex:indexPath.row]],[showArr objectAtIndex:indexPath.row]];
    
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"还没上车人员工号                %ld",showArr.count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
