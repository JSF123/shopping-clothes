//
//  CustomFirstView.m
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "CustomFirstView.h"
#import "CustomButton.h"
@implementation CustomFirstView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
//    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
//    left.frame = CGRectMake(10, 17, 24, 24);
//    [left setBackgroundImage:[UIImage imageNamed:@"botton_head_sort@2x"] forState:UIControlStateNormal];
//    [self addSubview:left];
//    _leftBtn = left;
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(10, 42, 25, 15);
//    label.font = [UIFont systemFontOfSize:12];
//    label.text = @"分类";
//    [self addSubview:label];
    CustomButton *customBtn = [[CustomButton alloc]init];
    customBtn.frame = CGRectMake(10, 17, 40, 40);
    [customBtn getCustomButtonTop:@"botton_head_sort@2x" WithButom:@"分类"];
    [self addSubview:customBtn];
    self.leftBtn = customBtn;
    
    CustomButton *rightB = [CustomButton new];
    rightB.frame = CGRectMake(KMainW-50, 17, 60, 40);
    [rightB getCustomRightTop:@"botton_shoppingcart_icon@3x" WithButom:@"购物车"];
    [self addSubview:rightB];
    self.rightBtn = rightB;
    
    
//    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.rightBtn.frame = CGRectMake(KMainW-40, 17, 25, 25);
//    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"icon_bbs_comment_detail@3x"] forState:UIControlStateNormal];
//    [self addSubview:self.rightBtn];
//    
//    UILabel *label1 = [[UILabel alloc]init];
//    label1.frame = CGRectMake(KMainW-40, 42, 25, 15);
//    label1.font = [UIFont systemFontOfSize:12];
//    label1.text = @"消息";
//    [self addSubview:label1];
    
    
    UIButton *middle = [UIButton buttonWithType:UIButtonTypeCustom];
    middle.frame = CGRectMake(KMainW/2-75, 22, 150, 30);
    [middle setTitle:@"🔍单品/品牌/红人" forState:UIControlStateNormal];
    middle.backgroundColor = [UIColor lightGrayColor];
    middle.alpha = 0.2;
    middle.layer.cornerRadius = 5;
    middle.layer.masksToBounds = YES;
    [middle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:middle];
    self.middleBtn = middle;

}


@end
