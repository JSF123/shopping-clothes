//
//  HomeAgeVC.m
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "HomeAgeVC.h"
#import "CustomNavigation.h"
#import "CustomFirstView.h"
#import "ClassificationVC.h"
#import "SearchVC.h"
#import "RightController.h"
#import "CustomHeaderView.h"
#import "CommodityModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "GetBaseByASI.h"
#import "MyCollectionViewCell.h"
#import "XLPlainFlowLayout.h"
#import "MJRefresh.h"
#import "UICustomLineLabel.h"
@interface HomeAgeVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>


{
    NSInteger select;
    NSMutableArray *selectedArr;
    UIView *topB;
    UICollectionView * _collection;
    UIPageControl *_top0Page;
    UIScrollView *_topScroll;
}
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *topDataArr;
@property (nonatomic,strong)NSMutableArray *topTwoBtnArr;
@property (nonatomic,strong)NSArray *sectionArr;
@property (nonatomic,strong)NSMutableArray *sexSectionArr;

@end

@implementation HomeAgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //static NSInteger select=1000;
    self.view.backgroundColor = [UIColor whiteColor];
    select = 1000;
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    item.frame = CGRectMake(KMainW-100, 22, 200, 30);
    [item setTitle:@"🔍单品/品牌/红人" forState:UIControlStateNormal];
    [item setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    item.backgroundColor = [UIColor lightGrayColor];
    item.alpha = 0.1;
    item.layer.cornerRadius = 5;
    item.layer.masksToBounds = YES;
    [item addTarget:self action:@selector(goToSearchVC:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = item;
    //[self createTopTitleBtn];
    
}
//-(instancetype)init
//{
//    XLPlainFlowLayout *layout = [XLPlainFlowLayout new];
//    layout.itemSize = CGSizeMake(100, 100);
//    //layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    layout.naviHeight = 44.0;
//    return [self initWithCollectionViewLayout:layout];
//}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    _collection.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getNSArrayBase];
        [_collection.mj_header endRefreshing];
    }];
    [_collection.mj_header beginRefreshing];

}

- (void)getNSArrayBase{
    selectedArr = [NSMutableArray arrayWithObjects:@"isNOSelect",@"isSelect",@"isSelect",@"isSelect", nil];
    self.sectionArr = @[@"http://api-v2.mall.hichao.com/mall/region/new?region_id=1&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc",@"http://api-v2.mall.hichao.com/mall/region/new?region_id=2&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc",@"http://api-v2.mall.hichao.com/mall/region/new?region_id=3&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc",@"http://api-v2.mall.hichao.com/mall/region/new?region_id=4&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc",@"http://api-v2.mall.hichao.com/mall/region/new?region_id=5&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc",@"http://api-v2.mall.hichao.com/mall/region/new?region_id=6&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc"];
    self.sexSectionArr = [NSMutableArray arrayWithCapacity:self.sectionArr.count];
    for (NSInteger i = 0; i < self.sectionArr.count; i++) {
        
        self.sexSectionArr[i] = [NSMutableArray array];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    for (NSInteger i=0; i<self.sectionArr.count; i++) {
        GetBaseByASI *getBase = [GetBaseByASI new];
        [getBase getCountryProduceBase:self.sectionArr[i] WithBlock:^(NSArray *countryArr) {
           
            NSMutableArray *arr = [NSMutableArray array];
            arr = [NSMutableArray arrayWithArray:countryArr];
                //NSLog(@"%@",)
//           [self.sexSectionArr addObject:arr];
            self.sexSectionArr[i] = arr;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (i==(self.sectionArr.count-1)) {
                    [_collection reloadData];
                }
            });
            // NSLog(@"%@",self.sexSectionArr[0][0]);
        }];
    }

 });
    self.topDataArr = [NSMutableArray array];
    [GetBaseByASI getTopScrollBase:^(NSArray *topArr) {
        self.topDataArr = [NSMutableArray arrayWithArray:topArr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_collection reloadData];
        });

    }];
    self.topTwoBtnArr = [NSMutableArray array];
    [GetBaseByASI getTwoBtnBase:^(NSArray *twoBtnArr) {
        
        self.topTwoBtnArr = [NSMutableArray arrayWithArray:twoBtnArr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_collection reloadData];
        });
    }];
    self.dataArr = [NSMutableArray array];
    [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
        self.dataArr = [NSMutableArray arrayWithArray:cellArr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_collection reloadData];
        });
        
    }];

    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //[self createNavigationView];
    [self createCollectionView];
    
}
/*
- (void)createNavigationView{
    CustomFirstView *firstView = [[CustomFirstView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 64)];
    [firstView.leftBtn addTarget:self action:@selector(pushClass:) forControlEvents:UIControlEventTouchUpInside];
    [firstView.rightBtn addTarget:self action:@selector(pushMessage:) forControlEvents:UIControlEventTouchUpInside];
    [firstView.middleBtn addTarget:self action:@selector(pushSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstView];
    UIView *fgView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, KMainW, 1)];
    fgView.backgroundColor = [UIColor lightGrayColor];
    fgView.alpha = 0.1;
    [self.view addSubview:fgView];
}
*/
- (void)createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH-49) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseableView];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collection = collectionView;
}

#pragma mark------UICollectionViewDataSource,UICollectionViewDelegate-----

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section<7) {
        return 0;
    }else{
        return self.dataArr.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.sexSectionArr.count==0) {
        return 0;
    }
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (self.sexSectionArr.count==0) {
        return 0;
    }
    if (indexPath.section<7) {
        return cell;
    } else {
        CommodityModel *model = self.dataArr[indexPath.row];
        cell.model = model;
       // NSLog(@"-===-=-=-%@",model.picUrl);
        return cell;
    }
    return cell;
}


//行大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section<7) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake((KMainW-10)/2, (KMainW-10)/2 *scaleWH+90);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusable = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseableView forIndexPath:indexPath];
    NSArray *subViews = reusable.subviews;
    for (UIView *view in subViews) {
        [view removeFromSuperview];
    }
    if (indexPath.section==0) {
        UIView *topView0 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH-113)];
        //topView0.backgroundColor = [UIColor grayColor];
        [reusable addSubview:topView0];
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KMainW, (KMainH-113-10)/2)];
        scroll.backgroundColor = [UIColor orangeColor];
        scroll.contentSize = CGSizeMake(KMainW*4, (KMainH-113-10)/2);
        scroll.tag = topFirstScrollVTag;
        scroll.delegate = self;
        scroll.pagingEnabled = YES;
        scroll.scrollEnabled = YES;
        scroll.bounces = NO;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        for (NSInteger i=0; i<self.topDataArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(KMainW*i, 0, KMainW, (KMainH-113-10)/2);
            btn.tag = top0ScrollTag+i;
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.topDataArr[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(inToTOPScroll:) forControlEvents:UIControlEventTouchUpInside];
            [scroll addSubview:btn];
        }
        [topView0 addSubview:scroll];
        _topScroll = scroll;
        UIPageControl *pageC = [[UIPageControl alloc]initWithFrame:CGRectMake(KMainW/2-30, (KMainH-113-10)/2-30, 60, 10)];
        pageC.numberOfPages = 4;
        pageC.currentPage = 0;
        pageC.pageIndicatorTintColor = [UIColor whiteColor];
        pageC.currentPageIndicatorTintColor = [UIColor redColor];
        [topView0 addSubview:pageC];
        _top0Page = pageC;
        
        for (NSInteger i=0; i<self.topTwoBtnArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+((KMainW-25)/2+5)*i, (KMainH-113-10)/2+5, (KMainW-25)/2, (KMainH-113-10)/2);
            btn.tag = top0Tag+i;
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.topTwoBtnArr[i]] forState:UIControlStateNormal];
          [btn addTarget:self action:@selector(inToTopTimeView:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor purpleColor];
            [topView0 addSubview:btn];
        }

    }if (indexPath.section<7&&indexPath.section>0) {
        
        UIView *thirdSCView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH)];
        //topView0.backgroundColor = [UIColor grayColor];
        [reusable addSubview:thirdSCView];
        CustomHeaderView *headerView = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 100)];
        NSString *str =self.sexSectionArr[indexPath.section-1][0][0];
        [headerView.countryBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:str] forState:UIControlStateNormal];
        [thirdSCView addSubview:headerView];
        
        [self getTrademarkscrollViewWith:self.sexSectionArr[indexPath.section-1][1]];
        [self getAnimationScrollerWithArray:self.sexSectionArr[indexPath.section-1][2] WithSection:(indexPath.section-1)];
        [self getIntroduceScrollViewWithArray:self.sexSectionArr[indexPath.section-1][3]];
        [self getViewAddSubView:thirdSCView];

    }else if(indexPath.section==7){
        UIView *lastCollection = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 60)];
        [reusable addSubview:lastCollection];
        NSArray *arr = @[@"今日上新",@"上装",@"裙装",@"裤装"];
            for (NSInteger i=0; i<arr.count; i++) {
            NSString *str = selectedArr[i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(KMainW/4*i, 5, KMainW/4, 40);
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            if ([str isEqualToString:@"isNOSelect"]) {
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }else{
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            
            [btn addTarget:self action:@selector(goToSelfView:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1000+i;
            [lastCollection addSubview:btn];
        }
        UIButton *btn = [self.view viewWithTag:select];
        topB = [[UIView alloc]init];
        topB.backgroundColor = [UIColor redColor];
        topB.frame = CGRectMake(btn.frame.origin.x, 50, KMainW/4, 6);
        [lastCollection addSubview:topB];

    }
    
    return reusable;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
         return CGSizeMake(KMainW, KMainH-113);
    }if (section<7) {
        return CGSizeMake(KMainW, KMainH);
    }else{
        return CGSizeMake(KMainW, 60);
    }
    
    //return CGSizeMake(0, 0);;
}
#pragma mark-------addSubViews---

- (void)getViewAddSubView:(UIView *)view{
    
    [view addSubview:self._markScroll];
    [view addSubview:self._animationScroll];
    [view addSubview:self._animationPage];
    [view addSubview:self._introduceScroll];

}
#pragma mark-------markScroll方法--------
- (void)getTrademarkscrollViewWith:(NSArray *)array{
    
    UIScrollView *markScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, KMainW, 80)];
   // markScroll.backgroundColor = [UIColor orangeColor];
    markScroll.contentSize = CGSizeMake(KMainW/4*(array.count+1), 80);
    markScroll.tag = markScrollTag;
    markScroll.delegate = self;
    markScroll.pagingEnabled = YES;
    markScroll.scrollEnabled = YES;
    markScroll.bounces = NO;
    markScroll.showsVerticalScrollIndicator = NO;
    markScroll.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<array.count; i++) {
        
        NSString * str = array[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW/4*i, 0, KMainW/4, 60);
        btn.tag = markScrollBtnTag+i;
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:str] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(markScroll:) forControlEvents:UIControlEventTouchUpInside];
        [markScroll addSubview:btn];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(KMainW/4*array.count+10, 5, 60, 60);
    btn.tag = markScrollMoreTag;
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_more@3x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(markScrollMore:) forControlEvents:UIControlEventTouchUpInside];
    [markScroll addSubview:btn];
    //[self addSubview:markScroll];
    self._markScroll = markScroll;
    
    
}
#pragma mark------animationScroll--------

- (void)getAnimationScrollerWithArray:(NSArray *)array WithSection:(NSInteger)indSection{
    UIScrollView *animationScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 180, KMainW, KMainH-350)];
    animationScroller.backgroundColor = [UIColor orangeColor];
    animationScroller.contentSize = CGSizeMake(KMainW*array.count, KMainH-350);
    animationScroller.tag = animationScrollTag +indSection;
    animationScroller.delegate = self;
    animationScroller.pagingEnabled = YES;
    animationScroller.scrollEnabled = YES;
    animationScroller.bounces = NO;
    animationScroller.showsVerticalScrollIndicator = NO;
    animationScroller.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<array.count; i++) {
        NSString *str = array[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW*i, 0, KMainW, KMainH-350);
        btn.tag = animationScrollBtnTag+i;
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:str] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(animationScroll:) forControlEvents:UIControlEventTouchUpInside];
        [animationScroller addSubview:btn];
    }
    
    self._animationScroll = animationScroller;
    UIPageControl *animationPage = [[UIPageControl alloc]initWithFrame:CGRectMake(KMainW/2-30, (KMainH-230)+30, 60, 10)];
    //animationPage.backgroundColor = [UIColor redColor];
    animationPage.numberOfPages = array.count;
    animationPage.currentPage = 0;
    animationPage.pageIndicatorTintColor = [UIColor whiteColor];
    animationPage.currentPageIndicatorTintColor = [UIColor redColor];
    animationPage.tag = animationScrollTag + 55+indSection;

    self._animationPage = animationPage;
    

}

#pragma mark-----introduceScroll--------

- (void)getIntroduceScrollViewWithArray:(NSArray *)array{
    UIScrollView *indroduceScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, KMainH-150, KMainW, 150)];
    //indroduceScroll.backgroundColor = [UIColor orangeColor];
    indroduceScroll.contentSize = CGSizeMake(KMainW/4*(array.count+1), 150);
    indroduceScroll.tag = indroduceScrollTag;
    indroduceScroll.delegate = self;
    indroduceScroll.pagingEnabled = YES;
    indroduceScroll.scrollEnabled = YES;
    indroduceScroll.bounces = NO;
    indroduceScroll.showsVerticalScrollIndicator = NO;
    indroduceScroll.showsHorizontalScrollIndicator = NO;
    for (NSInteger i=0; i<array.count; i++) {
        CommodityModel *model = array[i];
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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(KMainW/4*array.count+20, 10, 60, 60);
    btn.tag = markScrollMoreTag;
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_more@3x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(markScrollMore:) forControlEvents:UIControlEventTouchUpInside];
    [indroduceScroll addSubview:btn];
    //[self addSubview:markScroll];
    self._introduceScroll = indroduceScroll;
}

#pragma mark-------UIScrollViewDelegate----
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == topFirstScrollVTag) {
        _top0Page.currentPage = _topScroll.contentOffset.x/KMainW;
    }
    for (NSInteger i=0; i<self.sexSectionArr.count; i++) {
        if (scrollView.tag==animationScrollTag+i) {
            UIPageControl *page = [self.view viewWithTag:(scrollView.tag+55)];
            page.currentPage = scrollView.contentOffset.x / KMainW;
        }
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag == topFirstScrollVTag) {
    if (scrollView.contentOffset.x==0) {
        scrollView.contentOffset = CGPointMake(3*KMainW+1, 0);
    }
        if (scrollView.contentOffset.x==3*KMainW) {
            scrollView.contentOffset = CGPointMake(0, 0);
        }
    }
    for (NSInteger i=0; i<self.sexSectionArr.count; i++) {
        if (scrollView.tag==animationScrollTag+i) {
            if (scrollView.contentOffset.x==0) {
                scrollView.contentOffset = CGPointMake(([self.sexSectionArr[i] count]-1)*KMainW+1, 0);
            }
            if (scrollView.contentOffset.x==([self.sexSectionArr[i] count]-1)*KMainW) {
                scrollView.contentOffset = CGPointMake(0, 0);
            }
            
        }

    }
}

#pragma mark-----TopView点击事件---

- (void)inToTOPScroll:(UIButton *)sender{
    
}

- (void)inToTopTimeView:(UIButton *)sneder{
    
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

-(void)goToSelfView:(UIButton *)sender{
    UIButton *btn = [self.view viewWithTag:sender.tag];
    UIButton *upBtn = [self.view viewWithTag:select];
    
    if (select!=sender.tag) {
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [selectedArr replaceObjectAtIndex:(sender.tag-1000) withObject:@"isNOSelect"];
        [upBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [selectedArr replaceObjectAtIndex:(select-1000) withObject:@"isSelect"];
        topB.frame = CGRectMake(btn.frame.origin.x, 50, KMainW/4, 6);
    }
    select = sender.tag;
    if (sender.tag==1000) {
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];
    }else if(sender.tag==1001) {
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=38,33,34&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];

    }else if(sender.tag==1002){
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=39,40&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];
    }else{
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=49,45,48,46,44&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];

    }
    
}

#pragma mark--------导航栏点击事件-------
//- (void)pushClass:(UIButton *)sender{
//    LeftController *leftC = [[LeftController alloc]init];
//    [self.navigationController pushViewController:leftC animated:YES];
//}
//
//- (void)pushMessage:(UIButton *)sender{
//    RightController *rightC = [RightController new];
//    [self.navigationController pushViewController:rightC animated:YES];
//}

- (void)goToSearchVC:(UIButton *)sender{
    SearchVC *search = [[SearchVC alloc]init];
    [self.navigationController pushViewController:search animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
