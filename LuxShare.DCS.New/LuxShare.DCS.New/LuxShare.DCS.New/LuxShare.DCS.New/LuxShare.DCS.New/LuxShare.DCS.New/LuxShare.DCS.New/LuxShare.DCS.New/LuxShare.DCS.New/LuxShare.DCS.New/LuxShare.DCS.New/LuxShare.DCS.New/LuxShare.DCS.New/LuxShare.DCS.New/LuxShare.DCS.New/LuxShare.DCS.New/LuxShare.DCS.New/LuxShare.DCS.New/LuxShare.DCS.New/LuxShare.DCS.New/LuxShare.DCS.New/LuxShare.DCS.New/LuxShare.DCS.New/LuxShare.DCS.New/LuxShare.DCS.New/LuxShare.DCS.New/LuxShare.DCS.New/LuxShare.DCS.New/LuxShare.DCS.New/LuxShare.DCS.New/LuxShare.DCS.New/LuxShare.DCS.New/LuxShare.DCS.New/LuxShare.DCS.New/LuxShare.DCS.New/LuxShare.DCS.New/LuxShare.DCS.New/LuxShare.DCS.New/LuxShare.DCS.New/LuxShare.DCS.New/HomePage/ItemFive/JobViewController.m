//
//  JobViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/5.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "JobViewController.h"
#import "Header.h"
@interface JobViewController ()
{
    UIView *bigView;
    UILabel *labRight;
    UILabel *labName;
}
@property(nonatomic,strong)NSMutableArray*rightArr;
@end

@implementation JobViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
    self.title = @"岗位说明";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [HttpRequest getPersonInfo:[[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"] completeWithData:^(PeopleM *people) {
        NSMutableArray*arr  = [[NSMutableArray alloc]initWithObjects:people.DeptCode,people.DeptName,people.DirectBossEmpName,@"林育民",people.SalaryLevelName, nil];
        for (int i = 0;i<arr.count;i++) {
            if ([arr[i] isKindOfClass:[NSNull class]]) {
               [arr replaceObjectAtIndex:i withObject:@"NULL"];
            }
        }
        self.rightArr = arr;
    }];
    [self.view addSubview:[self createView]];
    
    
}
-(UIView*)createView{
    if (bigView) {
        return bigView;
    }else{
        bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
       
        
        UIImageView*image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2- SCREENWIDTH/10, 20, SCREENWIDTH/5, SCREENWIDTH/5)];
        image.layer.cornerRadius = SCREENWIDTH/10;
        image.clipsToBounds = YES;
        [HttpRequest getPersonImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"tfName"] completeWithData:^(UIImage *imageData) {
            image.image = imageData;
        }];
        [bigView addSubview:image];
        
        labName = [[UILabel alloc]init];
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
        
    
        
        
         return bigView;
    }
   
}


-(void)setRightArr:(NSMutableArray *)rightArr{
    _rightArr = rightArr;
    NSArray *leftArr = [[NSArray alloc]initWithObjects:@"部门编号",@"部门名称",@"直属主管",@"上级主管",@"资       位", nil];
    for (int i =0; i<5; i++) {
        
        UILabel *labLeft = [[UILabel alloc]init];
        labLeft.text = leftArr[i];
        labLeft.font =  [UIFont fontWithName:@"Helvetica" size:14];
        [bigView addSubview:labLeft];
        labLeft.sd_layout
        .leftSpaceToView(bigView,bigView.frame.size.width/4)
        .topSpaceToView(labName,40+(i%5)*40)
        .widthIs(80)
        .heightIs(30);
        
        labRight = [[UILabel alloc]init];
        labRight.text = _rightArr[i];
        labRight.textAlignment = NSTextAlignmentLeft;
        labRight.font = [UIFont systemFontOfSize:14];
        [bigView addSubview:labRight];
        labRight.sd_layout
        .leftSpaceToView(labLeft,8)
        .rightSpaceToView(bigView,50)
        .topEqualToView(labLeft)
        .heightIs(30);
        
        UIImageView*image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabShadow"]];
        [bigView addSubview:image];
        image.sd_layout
        .leftSpaceToView(bigView,40)
        .rightSpaceToView(bigView,40)
        .heightIs(1)
        .topSpaceToView(labLeft,5);
        
    }

}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
