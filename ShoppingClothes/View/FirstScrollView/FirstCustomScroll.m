//
//  FirstCustomScroll.m
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "FirstCustomScroll.h"

#import "UIButton+WebCache.h"
@interface FirstCustomScroll ()
{
    
}
@end

@implementation FirstCustomScroll


- (instancetype)initWithFrame:(CGRect)frame  WithArr:(NSArray *)array WithBtnArr:(NSArray *)arr  WithID:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollArr = array;
        self.bottomBtnArr = arr;
        self.delegate = delegate;
        [self createView];
    }
    return self;
}

- (void)createView{
    if (self.scrollArr.count==0||self.bottomBtnArr.count==0) {
        return;
    }
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KMainW, (KMainH-113-10)/2)];
    scroll.backgroundColor = [UIColor orangeColor];
    scroll.contentSize = CGSizeMake(KMainW*(self.scrollArr.count+2), (KMainH-113-10)/2);
    scroll.tag = topFirstScrollVTag;
    scroll.delegate = self.delegate;
    scroll.pagingEnabled = YES;
    scroll.scrollEnabled = YES;
    scroll.bounces = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    
    for (NSInteger i=0; i<(self.scrollArr.count +2); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW*i, 0, KMainW, (KMainH-113-10)/2);
        btn.tag = top0ScrollTag+i-1;
        if (i==0) {
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.scrollArr[self.scrollArr.count-1]] forState:UIControlStateNormal];
        }if (i<(self.scrollArr.count +1)&&i>0) {
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.scrollArr[i-1]] forState:UIControlStateNormal];
        }else if (i==(self.scrollArr.count+1)) {
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.scrollArr[0]] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(inToTOPScroll:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:btn];
    }
    scroll.contentOffset = CGPointMake(KMainW, 0);
    [self addSubview:scroll];
    _topScroll = scroll;
    UIPageControl *pageC = [[UIPageControl alloc]initWithFrame:CGRectMake(KMainW/2-30, (KMainH-113-10)/2-30, 60, 10)];
    pageC.numberOfPages = self.scrollArr.count;
    pageC.currentPage = 0;
    pageC.pageIndicatorTintColor = [UIColor whiteColor];
    pageC.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageC];
    _top0Page = pageC;
    
    for (NSInteger i=0; i<self.bottomBtnArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+((KMainW-25)/2+5)*i, (KMainH-113-10)/2+5, (KMainW-25)/2, (KMainH-113-10)/2);
        btn.tag = top0Tag+i;
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.bottomBtnArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(inToTopTimeView:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor purpleColor];
        [self addSubview:btn];
    }

}

#pragma mark-----TopView点击事件---

- (void)inToTOPScroll:(UIButton *)sender{
    
}

- (void)inToTopTimeView:(UIButton *)sneder{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
