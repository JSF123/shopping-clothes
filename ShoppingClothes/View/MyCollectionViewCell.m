//
//  MyCollectionViewCell.m
//  ShoppingClothes
//
//  Created by student on 16/6/12.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UICustomLineLabel.h"
@implementation MyCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
    }
    return self;
}

- (void)setModel:(CommodityModel *)model{
    if (_model!= model) {
        _model = model;
        [__bagImage sd_setImageWithURL:[NSURL URLWithString:_model.picUrl]];
        [__littleImage sd_setImageWithURL:[NSURL URLWithString:_model.nationalFlag]];
        __nameLab.text = _model.title;
        __priceLab.text = _model.price;
        __originPriceLab.text = _model.origin_price;
        __countryLab.text = model.country;
        //NSLog(@"%@",_model.picUrl);
    }
}

- (void)createView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, (KMainW-10)/2, (KMainW-10)/2 *scaleWH+90);
    [self addSubview:btn];
    self.button = btn;
    
    UIImageView * bagImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, (KMainW-10)/2, (KMainW-10)/2 *scaleWH)];
    [btn addSubview:bagImage];
    self._bagImage = bagImage;
    
    UIImageView *littleImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, (KMainW-10)/2 *scaleWH+20, 15, 15)];
    [btn addSubview:littleImage];
    self._littleImage = littleImage;
    
    UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(littleImage.frame.origin.x+20, littleImage.frame.origin.y, 40, 15)];
    rightLabel.font = [UIFont systemFontOfSize:15];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    [btn addSubview:rightLabel];
    self._countryLab = rightLabel;
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, littleImage.frame.origin.y+20, (KMainW-10)/2-20, 20)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [btn addSubview:nameLabel];
    self._nameLab = nameLabel;
    
    UILabel *pricelabel = [[UILabel alloc]initWithFrame:CGRectMake(10, nameLabel.frame.origin.y+25 ,80, 25)];
    pricelabel.font = [UIFont systemFontOfSize:25];
    pricelabel.textAlignment = NSTextAlignmentCenter;
    pricelabel.textColor = [UIColor redColor];
    [btn addSubview:pricelabel];
    self._priceLab = pricelabel;
    
    UICustomLineLabel *originPrice = [[UICustomLineLabel alloc]initWithFrame:CGRectMake(pricelabel.frame.origin.x+85, pricelabel.frame.origin.y+10, 60, 15)];
    originPrice.textColor = [UIColor lightGrayColor];
    originPrice.font = [UIFont systemFontOfSize:15];
    originPrice.textAlignment = NSTextAlignmentCenter;
    originPrice.lineType = LineTypeMiddle;
    [btn addSubview:originPrice];
    self._originPriceLab = originPrice;
    
}


@end
