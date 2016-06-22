//
//  SexScrollView.h
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexScrollView : UIView

@property (nonatomic,strong)NSArray *titleArr;

@property (nonatomic,strong)NSArray * markArr;

@property (nonatomic,strong)NSArray *animationArr;

@property (nonatomic,strong)NSArray *priceArr;

@property (nonatomic,strong)UIButton *countryBtn;

@property (nonatomic,assign)id delegate;

@property (nonatomic,assign)NSInteger index;


- (instancetype)initWithFrame:(CGRect)frame  WithNSArray:(NSArray *)array  WithID:(id)delegate  WithSection:(NSInteger)section;


@end
