//
//  LastScrollView.h
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HeaderBlock)(NSInteger index);

@interface LastScrollView : UIView

@property (nonatomic,strong)NSArray *selectdArr;

@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,assign)NSInteger select;

@property (nonatomic,strong)HeaderBlock lastHeader;

- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array WithNSInteger:(NSInteger)select;

- (void)createBlockTethod:(HeaderBlock)myBlock;


@end
