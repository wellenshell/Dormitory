//
//  KaoQinViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/8/30.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "KaoQinViewController.h"
#import "Header.h"
@interface KaoQinViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView*tab;
    NSMutableArray*dataArr;
    UIActivityIndicatorView*activity;
    NSString *newString ;
}
@end

@implementation KaoQinViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [activity startAnimating];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"coverpage_animation"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    NSArray *arr = [[NSArray alloc]initWithObjects:@"当前",@"上一月", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:arr];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    segment.frame = CGRectMake(self.view.frame.size.width/2-75, 25, 150, 35);
    self.navigationItem.titleView = segment;
    
    tab = [[UITableView alloc]init];
    tab.delegate = self;
    tab.dataSource = self;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tab];
    tab.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(SCREENHEIGHT)
    .topSpaceToView(self.view,10);

    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center=self.view.center;
    activity.layer.cornerRadius = 10;
    activity.bounds = CGRectMake(0, 0, 100, 100);
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:activity];
    [activity startAnimating];

    
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY/MM/dd"];
    NSString* dateStr = [formater stringFromDate:[NSDate date]];
    NSString *da = [NSString stringWithFormat:@"%@/%@/%@",[dateStr componentsSeparatedByString:@"/"][0],[dateStr componentsSeparatedByString:@"/"][1],@"01"];
    
    [HttpRequest kaoQin:@"L037520" dt:da completeWithData:^(KaoQinModel *kao) {
        [dataArr addObject:kao];
        [tab reloadData];
        [activity stopAnimating];
    }];

}


-(void)segmentClick:(UISegmentedControl*)segment{
    [activity startAnimating];
    
   if (segment.selectedSegmentIndex == 0) {
        
        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"YYYY/MM/dd"];
        NSString* dateStr = [formater stringFromDate:[NSDate date]];
               NSString *da = [NSString stringWithFormat:@"%@/%@/%@",[dateStr componentsSeparatedByString:@"/"][0],[dateStr componentsSeparatedByString:@"/"][1],@"01"];
        [dataArr removeAllObjects];
        [HttpRequest kaoQin:@"L037520" dt:da completeWithData:^(KaoQinModel *kao) {
            [dataArr addObject:kao];
            [tab reloadData];
            [activity stopAnimating];
        }];
    }else{

        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"YYYY/MM/dd"];
        NSString* dateStr = [formater stringFromDate:[NSDate date]];
        NSString *string = [dateStr componentsSeparatedByString:@"/"][1];
       
        if ([string integerValue]<10) {
            newString = [NSString stringWithFormat:@"0%ld",[string integerValue]-1] ;
        }else{
            newString = [NSString stringWithFormat:@"%ld",[string integerValue]-1] ;
        }

        NSString *da = [NSString stringWithFormat:@"%@/%@/%@",[dateStr componentsSeparatedByString:@"/"][0],newString,@"01"];
        [dataArr removeAllObjects];
        [HttpRequest kaoQin:@"L037520" dt:da completeWithData:^(KaoQinModel *kao) {
            [dataArr addObject:kao];
            [tab reloadData];
            [activity stopAnimating];
        }];

        

    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 230;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*tabCellId = @"KaoQinCell";
    KaoQinTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:tabCellId];
    
     if (!cell) {
        
        cell = [[NSBundle mainBundle]loadNibNamed:@"KaoQinTableViewCell" owner:nil options:nil][0];
        cell.bigView.layer.cornerRadius = 10;
        cell.bigView.layer.borderColor = [UIColor grayColor].CGColor;
        cell.bigView.layer.borderWidth = 1;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    KaoQinModel*model = [dataArr objectAtIndex:indexPath.row];
    cell.labTime.text = [model.Riqi stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    cell.nomalShang.text = model.Daka1;
    cell.noonXia.text = model.Daka2;
    cell.noonShang.text = model.Daka3;
    cell.xiaXia.text = model.Daka4;
    cell.beiLab.text = model.Beizhu;
    if (![cell.beiLab.text isEqualToString:@" "]) {
        cell.nomalLab.text = @"异常";
        cell.nomalLab.textColor = [UIColor redColor];
    }else{
        cell.nomalLab.text = @"正常";
        cell.nomalLab.textColor = [UIColor blackColor];

    }
    return cell;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
