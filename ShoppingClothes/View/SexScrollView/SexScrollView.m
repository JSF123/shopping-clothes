//
//  SexScrollView.m
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "SexScrollView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "CommodityModel.h"
#import "UICustomLineLabel.h"
@implementation SexScrollView


- (instancetype)initWithFrame:(CGRect)frame  WithNSArray:(NSArray *)array  WithID:(id)delegate  WithSection:(NSInteger)section
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        self.titleArr = array[0];
        self.markArr = array[1];
        self.animationArr = array[2];
        self.priceArr = array[3];
        self.index = section;
        [self createView];
    }
    return self;
}

- (void)createView{
    UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(0, 10, KMainW, 80);
    [titleBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.titleArr[0]] forState:UIControlStateNormal];
    [self addSubview:titleBtn];
    self.countryBtn = titleBtn;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1.5, KMainW, 1.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.alpha = 0.2;
    [self addSubview:lineView];
    [self getMarkScrollView];
    [self getAnimationScrollView];
    [self getIndroduceScrollView];
    
}


- (void)getMarkScrollView{
    UIScrollView *markScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, KMainW, 80)];
    // markScroll.backgroundColor = [UIColor orangeColor];
    markScroll.contentSize = CGSizeMake(KMainW/4*(self.markArr.count+1), 80);
    markScroll.tag = markScrollTag;
    markScroll.delegate = self.delegate;
    markScroll.pagingEnabled = YES;
    markScroll.scrollEnabled = YES;
    markScroll.bounces = NO;
    markScroll.showsVerticalScrollIndicator = NO;
    markScroll.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<self.markArr.count; i++) {
        
        NSString * str = self.markArr[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW/4*i, 0, KMainW/4, 60);
        btn.tag = markScrollBtnTag+i;
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:str] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(markScroll:) forControlEvents:UIControlEventTouchUpInside];
        [markScroll addSubview:btn];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(KMainW/4*self.markArr.count+10, 5, 60, 60);
    btn.tag = markScrollMoreTag;
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_more@3x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(markScrollMore:) forControlEvents:UIControlEventTouchUpInside];
    [markScroll addSubview:btn];
    [self addSubview:markScroll];

}

- (void)getAnimationScrollView{
    UIScrollView *animationScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 180, KMainW, KMainH-350)];
    animationScroller.backgroundColor = [UIColor orangeColor];
    animationScroller.contentSize = CGSizeMake(KMainW*(self.animationArr.count+2), KMainH-350);
    animationScroller.tag = animationScrollTag +_index;
    animationScroller.delegate = self.delegate;
    animationScroller.pagingEnabled = YES;
    animationScroller.scrollEnabled = YES;
    animationScroller.bounces = NO;
    animationScroller.showsVerticalScrollIndicator = NO;
    animationScroller.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<(self.animationArr.count+2); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW*i, 0, KMainW, KMainH-350);
        btn.tag = animationScrollBtnTag+i-1;
        if (i==0) {
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.animationArr[(self.animationArr.count-1)]] forState:UIControlStateNormal];
             }else if(i>0&&i<(self.animationArr.count+1)){
                 [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.animationArr[(i-1)]] forState:UIControlStateNormal];
             }else if(i==(self.animationArr.count+1)){
                 [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.animationArr[0]] forState:UIControlStateNormal];
             }
        
        [btn addTarget:self action:@selector(animationScroll:) forControlEvents:UIControlEventTouchUpInside];
        [animationScroller addSubview:btn];
    }
    animationScroller.contentOffset = CGPointMake(KMainW, 0);
    [self addSubview:animationScroller];
    UIPageControl *animationPage = [[UIPageControl alloc]initWithFrame:CGRectMake(KMainW/2-30, (KMainH-230)+30, 60, 10)];
    //animationPage.backgroundColor = [UIColor redColor];
    animationPage.numberOfPages = self.animationArr.count;
    animationPage.currentPage = 0;
    animationPage.pageIndicatorTintColor = [UIColor whiteColor];
    animationPage.currentPageIndicatorTintColor = [UIColor redColor];
    animationPage.tag = animationScrollTag + 55+_index;
    [self addSubview:animationPage];
    

}

- (void)getIndroduceScrollView{
    UIScrollView *indroduceScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, KMainH-150, KMainW, 150)];
    //indroduceScroll.backgroundColor = [UIColor orangeColor];
    indroduceScroll.contentSize = CGSizeMake(KMainW/4*(self.priceArr.count+1), 150);
    indroduceScroll.tag = indroduceScrollTag;
    indroduceScroll.delegate = self.delegate;
    indroduceScroll.pagingEnabled = YES;
    indroduceScroll.scrollEnabled = YES;
    indroduceScroll.bounces = NO;
    indroduceScroll.showsVerticalScrollIndicator = NO;
    indroduceScroll.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<self.priceArr.count; i++) {
        CommodityModel *model = self.priceArr[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW/4*i, 0, KMainW/4, 150);
        btn.tag = indroduceScrollBtnTag+i;
        [btn addTarget:self action:@selector(introduceScroll:) forControlEvents:UIControlEventTouchUpInside];
        [indroduceScroll addSubview:btn];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, KMainW/4, 80)];
        [image sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
        [btn addSubview:image];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 85, KMainW/4, 15)];
        nameLabel.text = model.title;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont systemFontOfSize:14];
        [btn addSubview:nameLabel];
        
        UILabel *newPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 105, KMainW/4, 20)];
        newPriceLabel.textColor = [UIColor redColor];
        newPriceLabel.font = [UIFont systemFontOfSize:18];
        newPriceLabel.text = model.price;
        newPriceLabel.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:newPriceLabel];
        
        UICustomLineLabel *oldPriceLabel = [[UICustomLineLabel alloc]initWithFrame:CGRectMake(10, 130, KMainW/4, 15)];
        oldPriceLabel.textColor = [UIColor lightGrayColor];
        oldPriceLabel.font = [UIFont systemFontOfSize:14];
        oldPriceLabel.text = model.origin_price;
        oldPriceLabel.lineType = LineTypeMiddle;
        oldPriceLabel.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:oldPriceLabel];
        
    }
    UIButton *btnI = [UIButton buttonWithType:UIButtonTypeCustom];
    btnI.frame = CGRectMake(KMainW/4*self.priceArr.count+20, 10, 60, 60);
    btnI.tag = markScrollMoreTag;
    [btnI setBackgroundImage:[UIImage imageNamed:@"icon_more@3x"] forState:UIControlStateNormal];
    [btnI addTarget:self action:@selector(indroduceScrollMore:) forControlEvents:UIControlEventTouchUpInside];
    [indroduceScroll addSubview:btnI];
    [self addSubview:indroduceScroll];

}


//animationScroll
- (void)animationScroll:(UIButton *)sender{
    
}

//markScroll:
- (void)markScroll:(UIButton *)sender{
    
}
//introduceScroll
- (void)introduceScroll:(UIButton *)sender{
    
}


- (void)markScrollMore:(UIButton *)sender{
    
}

- (void)indroduceScrollMore:(UIButton *)sender{
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
