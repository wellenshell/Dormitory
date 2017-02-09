//
//  PeopleViewController.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/5.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "PeopleViewController.h"
#import "Header.h"
@interface PeopleViewController ()
{
    NSArray*leftArr;
    NSString*code;
}
@property(nonatomic,strong) NSMutableArray*peopleArr;
@end

@implementation PeopleViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
    self.title = @"个人资料";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    leftArr = [[NSArray alloc]initWithObjects:@"",@"",@"",@"性       别:",@"出生日期:",@"邮       箱:",@"省份证号:",@"学       历:",@"毕业院校:",@"专修科系:",@"籍       贯:", nil];
   [HttpRequest getPersonInfo:[[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"] completeWithData:^(PeopleM *people) {
       code = people.EmpCode;
       NSString *birst = [people.Birthday substringWithRange:NSMakeRange(0, people.Birthday.length-8)];
      NSString *sub = [people.IdentityCard substringWithRange:NSMakeRange(people.IdentityCard.length-6, 6)];
           NSString *card = [people.IdentityCard stringByReplacingOccurrencesOfString:sub withString:@"******"];
       NSMutableArray *tempArr = [[NSMutableArray alloc]initWithObjects:people.EmpName,people.Assets,people.DeptName,people.Gender,birst,people.Email,card,people.EduExplain,people.School,people.Major,people.Address, nil];
       for (int i = 0; i<tempArr.count; i++) {
           if ([tempArr[i] isKindOfClass:[NSNull class]]) {
               [tempArr replaceObjectAtIndex:i withObject:@"NULL"];
           }
           
       }
       self.peopleArr = tempArr;
   }];
    
}
-(void)setPeopleArr:(NSMutableArray *)peopleArr{
   
    _peopleArr = peopleArr;
    
    UIImageView*imageBig = [[UIImageView alloc]init];
    [HttpRequest getPersonImage:[[NSUserDefaults standardUserDefaults]objectForKey:@"tfName"] completeWithData:^(UIImage *imageData) {
        imageBig.image = imageData;
    }];
    [self.view addSubview:imageBig];
    imageBig.sd_layout
    .rightSpaceToView(self.view,30)
    .topSpaceToView(self.view,70)
    .heightIs(SCREENHEIGHT*.2)
    .widthIs(SCREENWIDTH*.25);
    
    UILabel *labbottom = [[UILabel alloc]init];
    labbottom.font = [UIFont systemFontOfSize:14];
    labbottom.text = code;
    labbottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labbottom];
    labbottom.sd_layout
    .leftEqualToView(imageBig)
    .topSpaceToView(imageBig,5)
    .heightIs(20)
    .rightEqualToView(imageBig);
    
    for (int i = 0; i<_peopleArr.count; i++) {

        UILabel *labLeft = [[UILabel alloc]init];
        [self.view addSubview:labLeft];
        labLeft.sd_layout
        .leftSpaceToView(self.view,20)
        .topSpaceToView(self.view,100+(i%11)*35)
        .heightIs(30)
        .widthIs(100);
            if (i ==0 || i ==1 || i ==2) {
            
            if (i == 0) {
                labLeft.text = _peopleArr[0];
                labLeft.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
            }
            if (i == 1) {
                labLeft.text = _peopleArr[1];
                labLeft.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1];
                labLeft.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
                labLeft.sd_layout.widthIs(150);
            }
            
            if (i == 2) {
                labLeft.text = [NSString stringWithFormat:@"－ %@ －",_peopleArr[2]];
                labLeft.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
                labLeft.sd_layout.widthIs(150);
            }
        }else{
            
            CGSize size = [leftArr[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil]];
        
            
             CGRect rect1 = [peopleArr[i-1] boundingRectWithSize:CGSizeMake(self.view.frame.size.width-labLeft.frame.size.width-10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] context:nil];
            
            CGRect rect = [peopleArr[i] boundingRectWithSize:CGSizeMake(self.view.frame.size.width-labLeft.frame.size.width-10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] context:nil];
            
            UILabel *labRight = [[UILabel alloc]init];
            labRight.font = [UIFont systemFontOfSize:14];
            labRight.text = _peopleArr[i];
            labRight.numberOfLines = 0;
            [self.view addSubview:labRight];
            labRight.sd_layout
            .leftSpaceToView(self.view,20+size.width+10)
            .topSpaceToView(labbottom,50+((i-4)%11)*(rect1.size.height+15))
            .heightIs(rect.size.height+13)
            .widthIs(rect.size.width);
            
           

            labLeft.font = [UIFont systemFontOfSize:14];
            labLeft.text = leftArr[i];
            labLeft.sd_layout
            .topSpaceToView(labbottom,50+((i-4)%11)*(rect1.size.height+15))
            .widthIs(size.width);

            UIImageView*image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabShadow"]];
            [self.view addSubview:image];
            image.sd_layout
            .leftEqualToView(labLeft)
            .rightSpaceToView(self.view,10)
            .heightIs(1)
            .topSpaceToView(labRight,2);
        }
        
    }
    
    
  
}























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
