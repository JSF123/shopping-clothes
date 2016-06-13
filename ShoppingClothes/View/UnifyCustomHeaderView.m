//
//  UnifyCustomHeaderView.m
//  ShoppingClothes
//
//  Created by student on 16/6/9.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "UnifyCustomHeaderView.h"

@implementation UnifyCustomHeaderView

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
    }
    return self;
}

- (void)createView{
    UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(self.frame.size.width/2-120, 10, 240, 80);
    [self addSubview:titleBtn];
    
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectZero];
    leftImage.backgroundColor = [UIColor cyanColor];
    [titleBtn addSubview:leftImage];
    self._leftImage = leftImage;
    
    UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectZero];
    rightImage.backgroundColor = [UIColor greenColor];
    [titleBtn addSubview:rightImage];
    self._rightImage = rightImage;
    
    UILabel *lefteLabel = [[UILabel alloc]init];
    lefteLabel.frame = CGRectMake(0, 40, 65, 40);
    lefteLabel.textAlignment = NSTextAlignmentRight;
    lefteLabel.font = [UIFont systemFontOfSize:18];
    lefteLabel.textColor = [UIColor lightGrayColor];
    lefteLabel.text = @"———";
    lefteLabel.alpha = 0.3;
    [titleBtn addSubview:lefteLabel];
    
    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.frame = CGRectMake(175, 40, 65, 40);
    rightLabel.textAlignment = NSTextAlignmentLeft;
    rightLabel.font = [UIFont systemFontOfSize:18];
    rightLabel.text = @"———";
    rightLabel.alpha = 0.3;
    rightLabel.textColor = [UIColor grayColor];
    [titleBtn addSubview:rightLabel];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(70, 40, 100, 40);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.textColor = [UIColor grayColor];
    [titleBtn addSubview:titleLabel];
    self._titleLabel = titleLabel;
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.frame.size.width-60, 20, 50, 40);
    [self addSubview:rightBtn];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"更多";
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor grayColor];
    label.frame = CGRectMake(0, 5, 30, 30);
    label.font = [UIFont systemFontOfSize:15];
    [rightBtn addSubview:label];
    
    UIImageView * gengimage = [[UIImageView alloc]init];
    gengimage.image = [UIImage imageNamed:@"mx_search_item_arrow@3x"];
    gengimage.frame = CGRectMake(30, 5, 20, 30);
    [rightBtn addSubview:gengimage];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1.5, KMainW, 1.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.alpha = 0.2;
    [self addSubview:lineView];
}

- (void)trademarkscrollViewWith:(NSArray *)array{

    UIScrollView *markScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, KMainW, 80)];
    markScroll.backgroundColor = [UIColor orangeColor];
    markScroll.contentSize = CGSizeMake(KMainW*array.count, 80);
    markScroll.tag = topFirstScrollVTag;
    //markScroll.delegate = self;
    markScroll.pagingEnabled = YES;
    markScroll.scrollEnabled = YES;
    markScroll.bounces = NO;
    markScroll.showsVerticalScrollIndicator = NO;
    markScroll.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW*i, 0, KMainW, 60);
        btn.tag = markScrollTag+i;
        [btn addTarget:self action:@selector(inToTOPScroll:) forControlEvents:UIControlEventTouchUpInside];
        [markScroll addSubview:btn];
    }
    [self addSubview:markScroll];
    self._markScroll = markScroll;

    
}

- (void)getCustomHeaderTitle:(NSString *)titleLabel  WithRightImage:(NSString *)rightImage WithLeftImage:(NSString *)leftImage{
    if (rightImage==nil) {
        self._leftImage.frame = CGRectMake(100, 5, 40, 30);
        self._leftImage.image = [UIImage imageNamed:rightImage];
        self._titleLabel.text = titleLabel;
    }
    if (leftImage!=nil&&rightImage!=nil) {
        self._leftImage.frame = CGRectMake(75, 5, 40, 30);
        self._leftImage.image = [UIImage imageNamed:leftImage];
        self._rightImage.frame = CGRectMake(125, 5, 40, 30);
        self._rightImage.image = [UIImage imageNamed:rightImage];
        self._titleLabel.text = titleLabel;
    }
}








@end
