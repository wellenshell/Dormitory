//
//  MESTableViewCell.m
//  LuxShare.DCS.New
//
//  Created by MingMing on 16/9/8.
//  Copyright © 2016年 Luxshare. All rights reserved.
//

#import "MESTableViewCell.h"
#import "Header.h"
@implementation MESTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithMES{
    if (self == [super init]) {
        
        
        _cellView = [[UIView alloc]init];
        _cellView.backgroundColor =[UIColor whiteColor];
        _cellView.layer.borderWidth = 1;
        _cellView.layer.borderColor = [UIColor blackColor].CGColor;
        _cellView.layer.cornerRadius = 10;
        
        [self addSubview:_cellView];
        _cellView.sd_layout
        .leftSpaceToView(self,10)
        .rightSpaceToView(self,10)
        .topEqualToView(self)
        .bottomSpaceToView(self,8);
        
            _cname = [[UILabel alloc]init];
            _cname.text = @"公司名称:";
            _cname.textAlignment = NSTextAlignmentLeft;
            _cname.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_cname];
            _cname.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_cellView,5)
            .heightIs(25)
            .widthIs([self getString:_cname.text].width);
        
        
            _labcOMP = [[UILabel alloc]init];
            _labcOMP.textAlignment = NSTextAlignmentLeft;
            _labcOMP.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_labcOMP];
            _labcOMP.sd_layout
            .leftSpaceToView(_cname,0)
            .topEqualToView(_cname)
            .heightIs(25)
            .widthIs(50);

        
        _qu = [[UILabel alloc]init];
        _qu.text = @"区       域:";
        _qu.textAlignment = NSTextAlignmentLeft;
        _qu.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_qu];
        _qu.sd_layout
        .leftSpaceToView(_cellView,5)
        .topSpaceToView(_cname,5)
        .heightIs(25)
        .widthIs([self getString:_qu.text].width);
        
        _labQu = [[UILabel alloc]init];
        _labQu.textAlignment = NSTextAlignmentLeft;
        _labQu.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labQu];
        _labQu.sd_layout
        .leftSpaceToView(_qu,0)
        .topEqualToView(_qu)
        .heightIs(25)
        .widthIs(50);

        
            _zhuan = [[UILabel alloc]init];
            _zhuan.text = @"专案名称:";
            _zhuan.textAlignment = NSTextAlignmentLeft;
            _zhuan.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_zhuan];
            _zhuan.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_labQu,5)
            .heightIs(25)
            .widthIs([self getString:_zhuan.text].width);
        
            _labZhuan = [[UILabel alloc]init];
            _labZhuan.textAlignment = NSTextAlignmentLeft;
            _labZhuan.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_labZhuan];
            _labZhuan.sd_layout
            .leftSpaceToView(_zhuan,0)
            .topEqualToView(_zhuan)
            .heightIs(25)
            .widthIs(50);


            _yichang = [[UILabel alloc]init];
            _yichang.text = @"异常类型:";
            _yichang.textAlignment = NSTextAlignmentLeft;
            _yichang.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_yichang];
            _yichang.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_zhuan,5)
            .heightIs(25)
            .widthIs([self getString:_yichang.text].width);
        
            _labYI = [[UILabel alloc]init];
            _labYI.textAlignment = NSTextAlignmentLeft;
            _labYI.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_labYI];
            _labYI.sd_layout
            .leftSpaceToView(_yichang,0)
            .topEqualToView(_yichang)
            .heightIs(25)
            .widthIs(50);

        

            _dds = [[UILabel alloc]init];
            _dds.text = @"异常明细:";
            _dds.textAlignment = NSTextAlignmentLeft;
            _dds.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_dds];
            _dds.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_yichang,5)
            .heightIs(25)
            .widthIs([self getString:_dds.text].width);
        
        
            _labDDS = [[UILabel alloc]init];
            _labDDS.textAlignment = NSTextAlignmentLeft;
            _labDDS.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_labDDS];
            _labDDS.sd_layout
            .leftSpaceToView(_dds,0)
            .topEqualToView(_dds)
            .heightIs(25)
            .widthIs(50);
        
        

            _rema = [[UILabel alloc]init];
            _rema.text = @"补充说明:";
            _rema.textAlignment = NSTextAlignmentLeft;
            _rema.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_rema];
            _rema.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_dds,5)
            .heightIs(25)
            .widthIs([self getString:_rema.text].width);
        
        
        
            _labrema = [[UILabel alloc]init];
            _labrema.textAlignment = NSTextAlignmentLeft;
            _labrema.numberOfLines = 0;
            _labrema.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_labrema];
            _labrema.sd_layout
            .leftSpaceToView(_rema,0)
            .topEqualToView(_rema)
            .heightIs(25)
            .widthIs(50);
        

        
        _name = [[UILabel alloc]init];
        _name.text = @"呼叫人姓名:";
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_name];
        _name.sd_layout
        .leftSpaceToView(_cellView,5)
        .topSpaceToView(_labrema,5)
        .heightIs(25)
        .widthIs([self getString:_name.text].width);
        
        
        
        _labName = [[UILabel alloc]init];
        _labName.textAlignment = NSTextAlignmentLeft;
        _labName.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labName];
        _labName.sd_layout
        .leftSpaceToView(_name,0)
        .topEqualToView(_name)
        .heightIs(25)
        .widthIs(70);
        


            _tep = [[UILabel alloc]init];
            _tep.text = @"呼叫人电话:";
            _tep.textAlignment = NSTextAlignmentLeft;
            _tep.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_tep];
            _tep.sd_layout
            .leftSpaceToView(_cellView,5)
            .topSpaceToView(_name,5)
            .heightIs(25)
            .widthIs([self getString:_tep.text].width);

        
            _lanTEP = [[UILabel alloc]init];
            _lanTEP.textAlignment = NSTextAlignmentLeft;
            _lanTEP.font = [UIFont systemFontOfSize:13];
            [_cellView addSubview:_lanTEP];
            _lanTEP.sd_layout
            .leftSpaceToView(_tep,0)
            .topEqualToView(_tep)
            .heightIs(25)
            .widthIs(50);
        

        
        
        
        _liCenter = [[UILabel alloc]init];
        _liCenter.text = @"利润中心:";
        _liCenter.textAlignment = NSTextAlignmentLeft;
        _liCenter.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_liCenter];
        _liCenter.sd_layout
        .leftSpaceToView(_labcOMP,10)
        .topEqualToView(_labcOMP)
        .heightIs(25)
        .widthIs([self getString:_liCenter.text].width);
        
        
        _labLi = [[UILabel alloc]init];
        _labLi.textAlignment = NSTextAlignmentLeft;
        _labLi.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labLi];
        _labLi.sd_layout
        .leftSpaceToView(_liCenter,0)
        .topEqualToView(_liCenter)
        .heightIs(25)
        .widthIs(50);
        
        
        
        _ling = [[UILabel alloc]init];
        _ling.text = @"领导名称:";
        _ling.textAlignment = NSTextAlignmentLeft;
        _ling.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_ling];
        _ling.sd_layout
        .leftSpaceToView(_labZhuan,10)
        .topEqualToView(_labZhuan)
        .heightIs(25)
        .widthIs([self getString:_ling.text].width);
        
        _labLing = [[UILabel alloc]init];
        _labLing.textAlignment = NSTextAlignmentLeft;
        _labLing.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labLing];
        _labLing.sd_layout
        .leftSpaceToView(_ling,0)
        .topEqualToView(_ling)
        .heightIs(25)
        .widthIs(50);

        
        _ds = [[UILabel alloc]init];
        _ds.text = @"异常分类:";
        _ds.textAlignment = NSTextAlignmentLeft;
        _ds.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_ds];
        _ds.sd_layout
        .leftSpaceToView(_labYI,10)
        .topEqualToView(_labYI)
        .heightIs(25)
        .widthIs([self getString:_ds.text].width);
        
        _labDS = [[UILabel alloc]init];
        _labDS.textAlignment = NSTextAlignmentLeft;
        _labDS.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labDS];
        _labDS.sd_layout
        .leftSpaceToView(_ds,0)
        .topEqualToView(_ds)
        .heightIs(25)
        .widthIs(50);

        
        

        
        
        _time = [[UILabel alloc]init];
        _time.text = @"呼叫时间:";
        _time.textAlignment = NSTextAlignmentLeft;
        _time.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_time];
        _time.sd_layout
        .leftSpaceToView(_cellView,5)
        .topSpaceToView(_tep,5)
        .heightIs(25)
        .widthIs([self getString:_time.text].width);
        
        
        _labTime = [[UILabel alloc]init];
        _labTime.textAlignment = NSTextAlignmentLeft;
        _labTime.font = [UIFont systemFontOfSize:13];
        [_cellView addSubview:_labTime];
        _labTime.sd_layout
        .leftSpaceToView(_time,0)
        .topEqualToView(_time)
        .heightIs(25)
        .widthIs(50);
        

        
    }
    return self;
}


-(CGSize)getString:(NSString*)str{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil]];
    
     return size;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
