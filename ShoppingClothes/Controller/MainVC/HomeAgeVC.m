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
#import "CommodityModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "GetBaseByASI.h"
#import "MyCollectionViewCell.h"
#import "XLPlainFlowLayout.h"
#import "MJRefresh.h"
#import "UICustomLineLabel.h"
#import "FirstCustomScroll.h"
#import "SexScrollView.h"
#import "LastScrollView.h"
#import "FMDBShopping.h"
#import "Reachability.h"
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
@property (nonatomic,strong)Reachability *conn;

@end

@implementation HomeAgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    select = 1000;
     self.topDataArr = [NSMutableArray array];
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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    self.conn = [Reachability reachabilityForInternetConnection];
    [self.conn startNotifier];
    //self.topDataArr = [FMDBShopping selectDatabase];
    
   // NSLog(@"%@",self.topDataArr);
}

- (void)dealloc{
    [self.conn stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)networkStateChange{
    [self checkNetworkState];
}

- (void)checkNetworkState{
    Reachability *wife = [Reachability reachabilityForLocalWiFi];
    Reachability*connnet = [Reachability reachabilityForInternetConnection];
    if ([wife currentReachabilityStatus]!=NotReachable) {
        //[self refreshData];
        NSLog(@"有sife");
    }else if([connnet currentReachabilityStatus]!=NotReachable){
        //[self refreshData];
        NSLog(@"使用手机自带网络进行上网");
    }else{
        self.topDataArr = [FMDBShopping selectDatabase];
    }
}

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
            self.sexSectionArr[i] = arr;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (i==(self.sectionArr.count-1)) {
                    [_collection reloadData];
                }
            });
        }];
    }

 });
   
    [GetBaseByASI getTopScrollBase:^(NSArray *topArr) {
        self.topDataArr = [NSMutableArray arrayWithArray:topArr];
        [FMDBShopping insertIntoDataByID:topArr];
        
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
    [self createCollectionView];
    
}
- (void)createCollectionView{
    XLPlainFlowLayout *layout = [[XLPlainFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    //layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.naviHeight = 60.0;
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
//    if (self.topDataArr.count==0||self.dataArr.count==0||self.sexSectionArr.count) {
//        return 0;
//    }
        if (section<7) {
            return 0;
        }else{
            return self.dataArr.count;
        }
   
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section<7) {
        return cell;
    } else {
        CommodityModel *model = self.dataArr[indexPath.row];
        cell.model = model;
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
        FirstCustomScroll *firstScroll = [[FirstCustomScroll alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH-113) WithArr:self.topDataArr WithBtnArr:self.topTwoBtnArr WithID:self];
         _topScroll=firstScroll.topScroll;
        _top0Page=firstScroll.top0Page;
        [reusable addSubview:firstScroll];
        
    }if (indexPath.section<7&&indexPath.section>0) {
        SexScrollView *thirdSCView = [[SexScrollView alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH) WithNSArray:self.sexSectionArr[indexPath.section-1] WithID:self WithSection:(indexPath.section-1)];
        [reusable addSubview:thirdSCView];
    }else if(indexPath.section==7){
        LastScrollView *lastCollection = [[LastScrollView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 60) WithArray:selectedArr WithNSInteger:select];
         topB=lastCollection.lineView;
        [lastCollection createBlockTethod:^(NSInteger index) {
            [self goToSelfView:index];
        }];
        [reusable addSubview:lastCollection];
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
    
}

#pragma mark-------UIScrollViewDelegate----
//改变currentPage颜色
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == topFirstScrollVTag) {
        if (_topScroll.contentOffset.x==0) {
            _top0Page.currentPage = self.topDataArr.count;
        }else if(_topScroll.contentOffset.x==(self.topDataArr.count+1)*KMainW){
            _top0Page.currentPage = 0;
        }else{
            _top0Page.currentPage = (_topScroll.contentOffset.x/KMainW-1);
        }
    }
    for (NSInteger i=0; i<self.sexSectionArr.count; i++) {
        if (scrollView.tag==animationScrollTag+i) {
            UIScrollView *scroll = [_collection viewWithTag:animationScrollTag+i];
             UIPageControl *page = [_collection viewWithTag:(animationScrollTag+i+55)];
            if (scroll.contentOffset.x==0) {
                page.currentPage = [self.sexSectionArr[i][3] count];
            }else if(scroll.contentOffset.x==([self.sexSectionArr[i][2] count]+1)){
                page.currentPage = 0;
            }else{
                page.currentPage = (scrollView.contentOffset.x / KMainW-1);
            }
        }
    }
}
//循环滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == topFirstScrollVTag) {
        if (scrollView.contentOffset.x==0) {
            scrollView.contentOffset = CGPointMake((self.topDataArr.count)*KMainW+1, 0);
        }
        if (scrollView.contentOffset.x==(self.topDataArr.count+1)*KMainW) {
            scrollView.contentOffset = CGPointMake(KMainW, 0);
        }
    }
    for (NSInteger i=0; i<self.sexSectionArr.count; i++) {
        if (scrollView.tag==animationScrollTag+i) {
            if (scrollView.contentOffset.x==0) {
                scrollView.contentOffset = CGPointMake([self.sexSectionArr[i][2] count]*KMainW+1, 0);
            }
            if (scrollView.contentOffset.x==([self.sexSectionArr[i][2] count]+1)*KMainW) {
                scrollView.contentOffset = CGPointMake(KMainW, 0);
            }
        }
    }
}

-(void)goToSelfView:(NSInteger)sender
{
    UIButton *btn = [_collection viewWithTag:sender];
    UIButton *upBtn = [_collection viewWithTag:select];
    
    if (select!=sender) {
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [selectedArr replaceObjectAtIndex:(sender-1000) withObject:@"isNOSelect"];
        [upBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [selectedArr replaceObjectAtIndex:(select-1000) withObject:@"isSelect"];
        topB.frame = CGRectMake(btn.frame.origin.x, 50, KMainW/4, 6);
    }
    select = sender;
    if (sender==1000) {
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];
    }else if(sender==1001) {
        [GetBaseByASI getCollectionViewCellBaseUrlStr:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=38,33,34&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" WithBlock:^(NSArray *cellArr) {
            [self.dataArr removeAllObjects];
            self.dataArr = [NSMutableArray arrayWithArray:cellArr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collection reloadData];
            });
        }];

    }else if(sender==1002){
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
