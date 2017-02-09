//
//  CodeViewController.m
//  Luxshare.DCS
//
//  Created by George Tsai on 16/7/16.
//  Copyright © 2016年 DCS. All rights reserved.
//

#import "CodeViewController.h"
#import "Header.h"
@interface CodeViewController ()<ZBarReaderViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    ZBarCameraSimulator *cameraSim;
    NSString *data;
    UITableView *tab;
 
    
}
@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNav];
    [self setScanView];
    _infoArr = [[NSMutableArray alloc]initWithCapacity:0];
    [self creatViewShow];
    
}
//添加导航部分
-(void)creatNav{
    
    UIView *bigView = [[UIView alloc]init];
    bigView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    bigView.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:120.0/255.0 blue:189.0/255.0 alpha:1];
    [self.view addSubview:bigView];
    
    UILabel* lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(bigView.frame.size.width/2-50, 20, 100, 44);
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.text = @"接待人员扫描";
    lab.textAlignment = NSTextAlignmentCenter;
    [bigView addSubview:lab];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(3, 30, 30, 30);
    [button setImage:[UIImage imageNamed:@"coverpage_animation"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:button];

    
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
    readerView.frame = CGRectMake(10, 100, self.view.frame.size.width-20, self.view.frame.size.height-110);
    readerView.readerDelegate = self;
    [self.view addSubview:readerView];
    
    if(TARGET_IPHONE_SIMULATOR) {
        cameraSim = [[ZBarCameraSimulator alloc]
                     initWithViewController: self];
        cameraSim.readerView = readerView;
    }
    
    [readerView start];
    
    
}
-(void)backBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//实现代理方法 进行读取二维码的内容
- (void) readerView: (ZBarReaderView*) readerView
     didReadSymbols: (ZBarSymbolSet*) symbols
          fromImage: (UIImage*) image{
    
    for(ZBarSymbol *sym in symbols) {
        //如果扫描出来东西 就进行提示并跳转到展示页面
        if (sym.data != nil) {
            
            // 判断本地是否存在这个文件 如果存在就取出里面的文件内容 作为接口的参数 进行网路数据请求
            if ([[NSFileManager defaultManager] fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ids.text"]]) {
                NSMutableArray* idsArr = [NSMutableArray arrayWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ids.text"]];
                NSMutableArray* itemsArr = [NSMutableArray arrayWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/items.text"]];
                [_infoArr removeAllObjects];
                [HttpRequest getDidComGuestInfo:sym.data guest:idsArr things:itemsArr completeWithData:^(NSMutableArray *guestArr) {
                   
                    [_infoArr addObjectsFromArray:guestArr];
                    [tab reloadData];
                    
                    [UIView animateWithDuration:1 animations:^{
                        tab.frame = CGRectMake(40,150, tab.frame.size.width, 250);
                    }];
                }];
            } 
           
        }
        
        
        break;
    }
    
}



-(void)creatViewShow{

    tab = [[UITableView alloc]init];
    tab.layer.cornerRadius = 20;
    tab.frame = CGRectMake(40,self.view.frame.size.height , self.view.frame.size.width-80, 0);
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    
    
    
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"进厂人员";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _infoArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag = @"v";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:flag];
    cell.textLabel.text = @"";
    cell.detailTextLabel.text = @"";
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:flag];
       
    }
    GuestModel *model = _infoArr[indexPath.row];
    cell.textLabel.text = model.GuestCompany;
    cell.detailTextLabel.text = model.GuestName;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
