//
//  FirstCustomScroll.h
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnBlock)(UIButton *btn);

@interface FirstCustomScroll : UIView

@property (nonatomic,strong)NSArray *scrollArr;

@property (nonatomic,strong)NSArray *bottomBtnArr;

@property (nonatomic,assign)id delegate;

@property (nonatomic,strong)btnBlock btnSelected;

@property (nonatomic,strong)UIPageControl *top0Page;
@property (nonatomic,strong)UIScrollView *topScroll;



- (instancetype)initWithFrame:(CGRect)frame  WithArr:(NSArray *)array WithBtnArr:(NSArray *)arr  WithID:(id)delegate;


@end
