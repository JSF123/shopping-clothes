//
//  CollocationView.h
//  ManShopping
//
//  Created by student on 16/6/11.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollocationView : UIView

@property (nonatomic,strong)UIScrollView * scrollerView;

@property (nonatomic,strong)UIButton * selectedBtn;

@property (nonatomic,strong)UILabel * label;

- (instancetype)initWithFrame:(CGRect)frame;

@end
