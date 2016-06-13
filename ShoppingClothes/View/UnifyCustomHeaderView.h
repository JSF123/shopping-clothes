//
//  UnifyCustomHeaderView.h
//  ShoppingClothes
//
//  Created by student on 16/6/9.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnifyCustomHeaderView : UIView


@property (nonatomic,strong)UIImageView *_leftImage;

@property (nonatomic,strong)UIImageView *_rightImage;

@property (nonatomic,strong)UILabel *_titleLabel;

@property (nonatomic,strong)UIScrollView *_markScroll;

- (void)getCustomHeaderTitle:(NSString *)titleLabel  WithRightImage:(NSString *)rightImage WithLeftImage:(NSString *)leftImage;

- (void)trademarkscrollViewWith:(NSArray *)array;



@end
