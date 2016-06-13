//
//  MyCollectionViewCell.h
//  ShoppingClothes
//
//  Created by student on 16/6/12.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommodityModel.h"
@interface MyCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)CommodityModel *model;

@property (nonatomic,strong)UIButton *button;

@property (nonatomic,strong)UIImageView *_bagImage;

@property (nonatomic,strong)UIImageView *_littleImage;

@property (nonatomic,strong)UILabel *_countryLab;

@property (nonatomic,strong)UILabel *_nameLab;

@property (nonatomic,strong)UILabel *_priceLab;

@property (nonatomic,strong)UILabel *_originPriceLab;


@end
