//
//  CustomView.h
//  ManShopping
//
//  Created by student on 16/6/8.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic,strong)UIButton * middleBtn;
@property (nonatomic,strong)UIButton * projectBtn;
@property (nonatomic,strong)UIButton * rightBtn;
@property (nonatomic,strong)UILabel * label;

- (instancetype)initWithFrame:(CGRect)frame withBool:(BOOL)selected;

@end
