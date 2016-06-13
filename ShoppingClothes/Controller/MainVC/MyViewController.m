//
//  MyViewController.m
//  ManShopping
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 student. All rights reserved.
//

#import "MyViewController.h"
#import "CustomNavigation.h"
#import "LoginViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    self.navigationController.navigationBarHidden = YES;
    CustomNavigation * view = [[CustomNavigation alloc]initWithFrame:CGRectMake(0, 0, KMainW, 64)];
    
    [view  getNavigationTitleLeft:@"bottom_head_shezhi@2x.png" withMiddle:@"" withRightM:@"botton_shoppingcart_icon@3x.png" withRight:@"bottom_comment_button@2x.png"];
    [view.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.rightmBtn addTarget:self action:@selector(shoppeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view];

}


- (void)jumpLoginViewController{

    LoginViewController * login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KMainW, KMainH-64) style: UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
  
}
#pragma mark ---导航点击事件
- (void)leftBtnClicked:(UIButton *)btn{

    
    
    
}

- (void)shoppeBtnClicked:(UIButton *)btn{
    
    [self jumpLoginViewController];

}

- (void)rightBtnClicked:(UIButton *)btn{

    [self jumpLoginViewController];

}

#pragma mark ----tableView 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 3) {
        return 1;
    }else{
    
        return 2;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 200;
        }else{
        
            return 100;
        }
    }else{
    
        return 100;
    }


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *subViews = [NSArray arrayWithArray:cell.contentView.subviews];
    for (UIView * view in subViews) {
        [view removeFromSuperview];
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KMainW/2-50, 20, 100, 100)];
        NSString * path = [[NSBundle mainBundle]pathForResource:@"icon_head_portrait@2x" ofType:@"png"];
        imageView.image = [UIImage imageWithContentsOfFile:path];
        imageView.layer.cornerRadius = 50;
        imageView.layer.masksToBounds = YES;
        [cell.contentView addSubview:imageView];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW/2-80, 140, 160, 40);
        [btn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString * path1 = [[NSBundle mainBundle]pathForResource:@"icon_tuangou_jinxing@2x" ofType:@"png"];
        
        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:path1] forState:UIControlStateNormal];
        [btn setTitle:@"登录" forState:UIControlStateNormal];
           
        [cell.contentView addSubview:btn];
        }else{
        
            NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"关注的人",@"我的粉丝",@"关注的品牌",nil];
            for (int i = 0; i<3; i++) {
                
            
            UIButton * attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            attentionBtn.frame = CGRectMake(KMainW/3*i, 0, KMainW/3, 100);
            [attentionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [attentionBtn setTitle:[NSString stringWithFormat:@"%@",arr[i]] forState:UIControlStateNormal];
            [attentionBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
                attentionBtn.tag = i+100;
            [cell.contentView addSubview:attentionBtn];
            
            }
        
        
        }
       
    }else if(indexPath.section == 1){
        
        NSMutableArray * labelArr = [NSMutableArray arrayWithObjects:@"待付款",@"待发货",@"待收获",@"待评价",@"退款/退货", nil];
        NSMutableArray * imageArr = [NSMutableArray arrayWithObjects:@"icon_my_payment@3x",@"icon_my_send@3x",@"icon_my_collect@2x.png",@"icon_my_pingjia@2x.png",@"icon_my_return@2x.png", nil];
        
        if (indexPath.row == 0) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
           
        btn.frame = cell.contentView.frame;
        [btn addTarget:self action:@selector(orderBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:btn];
        
        UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 150, 40)];
        leftLabel.text = @"明星衣橱订单";
        [btn addSubview:leftLabel];
        
        UILabel * rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(KMainW-120, 35, 80, 30)];
        rightLabel.text = @"全部订单>";
        [btn addSubview:rightLabel];
        }else{
        
            for (int i = 0; i < 5; i++) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(KMainW/5*i, 0, KMainW/5, 100);
                [btn addTarget:self action:@selector(orderClicked:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = i+1000;
                [cell.contentView addSubview:btn];
                
               
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(btn.frame.size.width/2-30, btn.frame.size.height/2+10, 80, 30)];
                label.text = [NSString stringWithFormat:@"%@",labelArr[i]];
                [btn addSubview:label];
                
                UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width/2-20, 10, 40, 40)];
                imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[i]]];
                [btn addSubview:imageView];
                
            }
        
        
        
        
        }
    }else if (indexPath.section == 2){
        
        NSMutableArray * labelArr = [NSMutableArray arrayWithObjects:@"会员专享",@"优惠券",@"我的红包", nil];
        NSMutableArray * imageArr = [NSMutableArray arrayWithObjects:@"icon_my_vip@2x.png",@"icon_my_coupon@2x.png",@"icon_my_red@2x.png",nil];
        if (indexPath.row == 0) {
            
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 60)];
        label.text = @"我的福利";
        [cell.contentView addSubview:label];
        }else{
        
            for (int i = 0; i<3; i++) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(KMainW/3*i, 0, KMainW/3, 100);
                btn.tag = i + 10000;
                [btn addTarget:self action:@selector(welfareClicked:) forControlEvents:UIControlEventTouchUpInside];
                [cell.contentView addSubview:btn];
                
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(btn.frame.size.width/2-30, btn.frame.size.height/2+20, 80, 30)];
                label.text = [NSString stringWithFormat:@"%@",labelArr[i]];
                [btn addSubview:label];
                
                UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width/2-15, btn.frame.size.height/2-20, 30, 30)];
                image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[i]]];
                [btn addSubview:image];
            }
        
        }
        
    }else if(indexPath.section == 3){
    
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 20, 120, 60);
        [btn setTitle:@"我的收获地址" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(Clicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        [cell.contentView addSubview:btn];
        
    
    }else if(indexPath.section == 4){
        if (indexPath.row == 0) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 20, 80, 60);
        [btn setTitle:@"我的收藏" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(collectClicked:) forControlEvents:UIControlEventTouchUpInside];
           [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           

        [cell.contentView addSubview:btn];
        }else{
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(20, 20, 80, 60);
            [btn setTitle:@"我的发帖" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(postClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
            [cell.contentView addSubview:btn];
        
        }
        
    }else if(indexPath.section == 5){
        if (indexPath.row == 0) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 20, 100, 60);
        [btn setTitle:@"帮助与反馈" forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(helpClicked:) forControlEvents:UIControlEventTouchUpInside];
           

        [cell.contentView addSubview:btn];
        
        }else{
        
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(20, 20, 260, 60);
            [btn setTitle:@"明星衣橱客服：400-650-6468" forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(telClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.contentView addSubview:btn];
        
        }
        
    }

    
    
    return cell;

}

#pragma mark ---登录点击事件
- (void)loginBtnClicked:(UIButton *)btn{

    [self jumpLoginViewController];

}
#pragma mark ---登录点击下关注的人、我的粉丝、关注的品牌点击事件
- (void)btnClicked:(UIButton *)btn{

    if (btn.tag%100 == 0) {
        [self jumpLoginViewController];
    }else if(btn.tag%100 == 1){
    
        [self jumpLoginViewController];
    }else if(btn.tag %100 == 2){
        
        [self jumpLoginViewController];}

}
#pragma mark ---明星衣橱订单点击事件
- (void)orderBtnClicked:(UIButton *)btn{

    
    if (btn.tag%1000 == 0) {
        [self jumpLoginViewController];
    }else if(btn.tag%1000 == 1){
        
        [self jumpLoginViewController];
    }else if(btn.tag %1000 == 2){
        
        [self jumpLoginViewController];
    }else if (btn.tag%1000 == 3){
        [self jumpLoginViewController];
        }else if (btn.tag%1000 == 4){
        [self jumpLoginViewController];
        }else if (btn.tag%1000 == 5){
        [self jumpLoginViewController];
        }
}
#pragma mark ---明星衣橱订单下Btn点击事件
- (void)orderClicked:(UIButton *)btn{

    [self jumpLoginViewController];
}
#pragma mark ---我的福利点击事件
- (void)welfareClicked:(UIButton *)btn{

    if (btn.tag%10000 == 0) {
        [self jumpLoginViewController];
    }else if (btn.tag%10000 == 1){
    [self jumpLoginViewController];
    }else if (btn.tag%10000 == 2){
    [self jumpLoginViewController];
    }

}
#pragma mark ---我的收获地址
- (void)Clicked:(UIButton *)btn{

    [self jumpLoginViewController];
}
#pragma mark ---收藏
- (void)collectClicked:(UIButton *)btn{
  [self jumpLoginViewController];
}
#pragma mark ---发帖
- (void)postClicked:(UIButton *)btn{
   [self jumpLoginViewController];
}
#pragma mark ---帮助反馈
- (void)helpClicked:(UIButton *)btn{}
#pragma mark ---客服电话
- (void)telClicked:(UIButton *)btn{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"400-650-6468" message:nil preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"呼叫" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    
    [alert addAction:action];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];

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
