//
//  FirstViewController.m
//  WPTabBarVC
//
//  Created by MingMing on 16/8/22.
//  Copyright © 2016年 HWP. All rights reserved.
//

#import "FirstViewController.h"
#import "Header.h"
@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIScrollView *bigScrol;
    NSArray *titleAr ;
    NSArray *imgArr;
    UILabel *labRed;
    UICollectionView * collect;
  
}
@property(nonatomic,strong)NSMutableArray *yiChangArr;
@end

@implementation FirstViewController
//判断是否有网
-(void)getInternetInfo{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            KalertLogin(@"为了您更好的体验 请先连接网络");
        }else{
            return;
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self getInternetInfo];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title =@"立 讯";
    self.navigationController.navigationBarHidden = NO;
    if (self.navigationController.viewControllers.count >1) {
        self.tabBarController.tabBar.hidden =YES;
    }else {
        self.tabBarController.tabBar.hidden =NO;
  }
    _yiChangArr = [[NSMutableArray alloc]init];
    NSMutableArray *smellArr = [[NSMutableArray alloc]init];
    [HttpRequest getYiChang:@"L037520" completeWithData:^(YiChangModel *yichang) {
        [smellArr addObject:yichang];
        self.yiChangArr = smellArr;
        
    }];
}
-(void)setYiChangArr:(NSMutableArray *)yiChangArr{
    _yiChangArr = yiChangArr;
    if (_yiChangArr.count == 0) {
        labRed.hidden = YES;
    }else{
        labRed.hidden = NO;
        labRed.text = [NSString stringWithFormat:@"%ld",_yiChangArr.count];
    }
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];

    imgArr = [[NSArray alloc]initWithObjects:@"jp",@"ss",@"mj",@"sc",@"cb",@"cf",@"zf", nil];
    titleAr = [[NSArray alloc]initWithObjects:@"假日班车",@"宿舍管理",@"门禁管理",@"生产异常",@"仓库领料",@"仓库备料",@"申请招聘", nil];
    [self creatScrol];
    [self creatCollectionView];
     
    
}

-(void)creatScrol{
    
    bigScrol = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64)];
    bigScrol.showsVerticalScrollIndicator = NO;
    [self.view addSubview:bigScrol];
    
    NSMutableArray *images = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"pic1"],[UIImage imageNamed:@"pic2"],[UIImage imageNamed:@"pic3"],[UIImage imageNamed:@"pic4"], nil];
    SDCycleScrollView* scroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, 180) imageNamesGroup:images];
    [bigScrol addSubview:scroll];
}


//添加分区的瀑布流
-(UICollectionView*)creatCollectionView{
    if (collect) {
       
    }else{
        //创建一个layout布局类
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        //设置布局方向为垂直流布局
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((SCREENWIDTH-1)/4, (SCREENWIDTH-1)/4);
        layout. minimumInteritemSpacing = 0.2;
        layout.minimumLineSpacing = 0.2;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //创建collectionView 通过一个布局策略layout来创建
        collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0.2, 180.2, SCREENWIDTH-0.4, 20+(titleAr.count/4+1)*((SCREENWIDTH-1)/4)) collectionViewLayout:layout];
        collect.scrollEnabled = NO;
        collect.backgroundColor = [UIColor whiteColor];
        
        //代理设置
        collect.delegate=self;
        collect.dataSource=self;
        //注册item类型 这里使用系统的类型
        [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
        [bigScrol addSubview:collect];
    }
  
    
    
    if (titleAr.count%4 != /* DISABLES CODE */ (0)) {
          bigScrol.contentSize = CGSizeMake(SCREENWIDTH, 340+(titleAr.count/4+1)*((SCREENWIDTH-1)/4));
    }else{
         bigScrol.contentSize = CGSizeMake(SCREENWIDTH, 340+(titleAr.count/4)*((SCREENWIDTH-1)/4));
    }
    
    return collect;
}


// 每个区有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return titleAr.count;
}
//加载每一个cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell* cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    UIImageView*imagee = [cell viewWithTag:100];
    imagee.image = [UIImage imageNamed:@""];
    UILabel *labb = [cell viewWithTag:200];
    [labb removeFromSuperview];
    

    
    //设置cell的样式 标题和图片
    cell.layer.borderColor=[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1].CGColor;
    cell.layer.borderWidth= 1;

    
    //在cell上添加图片
    UIImageView *image = [[UIImageView alloc]init];
    image.tag = 100;
    image.image = [UIImage imageNamed:imgArr[indexPath.row]];
    [cell addSubview:image];
    image.sd_layout
    .leftSpaceToView(cell,cell.frame.size.width/3)
    .widthIs(cell.frame.size.width/3)
    .heightEqualToWidth()
    .topSpaceToView(cell,20);


    //在cell上添加文字
    UILabel *lab  = [[UILabel alloc]init];
    lab.tag = 200;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont fontWithName:@"Helvetica" size:14];
    lab.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    lab.text = titleAr[indexPath.item];
    [cell addSubview:lab];
    lab.sd_layout
    .leftSpaceToView(cell,0)
    .rightEqualToView(cell)
    .heightIs(30)
    .topSpaceToView(image,5);
    
    if (indexPath.item == 3) {
        
        labRed  = [[UILabel alloc]init];
        labb.tag = 1000;
        labRed.textAlignment = NSTextAlignmentCenter;
        labRed.font = [UIFont fontWithName:@"Helvetica" size:14];
        labRed.textColor = [UIColor whiteColor];
        labRed.layer.cornerRadius = 10;
        labRed.clipsToBounds = YES;
        labRed.backgroundColor = [UIColor redColor];
       
        [cell addSubview:labRed];
        labRed.sd_layout
        .topSpaceToView(cell,15)
        .rightSpaceToView(cell,cell.frame.size.width/4)
        .heightIs(20)
        .widthIs(20);
      
     
    }
    if (_yiChangArr.count == 0) {
        labRed.hidden = YES;
    }else{
        labRed.hidden = NO;
    }

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == 0) {

        BusNumberViewController*bus = [[BusNumberViewController alloc]init];
        [self.navigationController pushViewController:bus animated:YES];

    }else if (indexPath.item == 1){
        // 判断权限
        NSString *s = [[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"];
        [HttpRequest sendLoginRequest:s completeWithData:^(BOOL isSuccess) {
        if (isSuccess == YES) {
        HouseViewController*home = [[HouseViewController alloc]init];
        [self.navigationController pushViewController:home animated:YES];
        }else{
            KalertLogin(@"不好意思 您还没有对此操作的权限");
        }
     }];
    }else if(indexPath.item == 2){
        
        DoorHomeViewController*homeTwo = [[DoorHomeViewController alloc]init];
        [self.navigationController pushViewController:homeTwo animated:YES];
        
    }else if(indexPath.item == 3){
        
        MESViewController* mes = [[MESViewController alloc]init];
        mes.mesArr = _yiChangArr;
        [self.navigationController pushViewController:mes animated:YES];
        
    }else if(indexPath.item == 4){
        
        LingLiaoViewController* mes = [[LingLiaoViewController alloc]init];
        [self.navigationController pushViewController:mes animated:YES];
        
    }else if(indexPath.item == 5){
        
        BeiLiaoViewController* mes = [[BeiLiaoViewController alloc]init];
        [self.navigationController pushViewController:mes animated:YES];
        
    }else if(indexPath.item == 6){
        
        GuoZhangViewController* mes = [[GuoZhangViewController alloc]init];
        [self.navigationController pushViewController:mes animated:YES];
    }
    
   
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
