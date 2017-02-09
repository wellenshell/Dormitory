//
//  LingLiaoTableViewCell.h
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/13.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LingLiaoTableViewCell : UITableViewCell
{
    UILabel* labNamed;
}
@property(nonatomic,strong)UIButton*leftButton;
@property(nonatomic,strong)UILabel*lab;
@property(nonatomic,strong)UILabel*labNumber;
@property(nonatomic,strong)UIImageView*imageS;
@property(nonatomic,strong)UITextField *tfNumber;
@property(nonatomic,strong)UIImageView*time;
@property(nonatomic,strong)UIButton*tfTime;
@property(nonatomic,strong)UILabel*labName;
-(id)initWithLingLiao;
-(CGSize)getString:(NSString*)str size:(NSInteger)number;
-(void)getReturnString:(NSString*)str;
@end
