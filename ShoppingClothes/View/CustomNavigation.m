//
//  CustomNavigation.m
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "CustomNavigation.h"

@implementation CustomNavigation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        self.alpha = 0.5;
    }
    return self;
}

- (void)createView{
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:left];
    _leftBtn = left;
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.rightBtn];

    self.middleLable = [[UILabel alloc]init];
        [self addSubview:self.middleLable];
    
    self.rightmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:self.rightmBtn];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 63, KMainW, 1)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.alpha = 0.2;
    [self addSubview:view];
}

- (void)getNavigationTitleLeft:(NSString *)left  withMiddle:(NSString *)middle withRightM:(NSString *)rightM withRight:(NSString *)right{
    if (left==nil||right==nil||middle==nil||rightM==nil) {
        return;
    }else{
        if (left !=nil) {
            _leftBtn.frame = CGRectMake(10, 22, 30, 30);
            [_leftBtn setBackgroundImage:[UIImage imageNamed:left] forState:UIControlStateNormal];
        }
        if (middle!=nil) {
            self.middleLable.frame = CGRectMake(KMainW/2-50, 22, 100, 30);
            self.middleLable.text = middle;
            self.middleLable.textAlignment = NSTextAlignmentCenter;

        }
        if (rightM!=nil) {
            self.rightmBtn.frame = CGRectMake(KMainW/2+60, 22, 30, 30);
            [self.rightmBtn setBackgroundImage:[UIImage imageNamed:rightM] forState:UIControlStateNormal];
        }
        if (right!=nil) {
            self.rightBtn.frame = CGRectMake(KMainW-40, 22, 30, 30);
            [self.rightBtn setBackgroundImage:[UIImage imageNamed:right] forState:UIControlStateNormal];
        }
    }
}


@end

//CustomNavigation *customView = [[CustomNavigation alloc]initWithFrame:CGRectMake(0, 0, KMainW, 64)];
//[customView getNavigationTitleLeft:@"bottom_head_sort@2x" withMiddle:@"首页" withRightM:@"AppIcon60x60@3x" withRight:@"botton_head_shoppingcar@3x"];
//[self.view addSubview:customView];
