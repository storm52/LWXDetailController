//
//  MyDetailController.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "MyDetailController.h"
#import "CustomHeaderView.h"
#import "NomalVC.h"
#import "ContentVC.h"

@interface MyDetailController ()
@property(nonatomic,strong)CustomHeaderView *titleHeaderView;
@end

@implementation MyDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    self.title = @"详细";
    self.tabPageController.tabBar.itemTitleFont = [UIFont systemFontOfSize:15];
    self.tabPageController.tabBar.indicatorScrollFollowContent = YES;
     [self initViewControllers];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.titleHeaderView.titleLabel.text = @"蚂蚁金服、滴滴上榜2017年独角兽名单";
         self.titleHeaderView.subTitleLabel.text = @"[摘要]根据科技部的中国独角兽企业发展报告，蚂蚁金服、滴滴、小米分别位居前三。阿里云、美团点评、宁德时代、今日头条、菜鸟网络、陆金所、借贷宝等跻身前十。";
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initViewControllers{
    
    NSMutableArray *vcArray = [NSMutableArray array];
    NomalVC *normal = [[NomalVC alloc] init];
    normal.yp_tabItemTitle = @"文章内容";
    [vcArray addObject:normal];
    int i = 0;
    while (i<2) {
        ContentVC *controller = [[ContentVC alloc] init];
        controller.yp_tabItemTitle = i==0 ?@"全部名单":@"评论";
        controller.index = i;
        [vcArray addObject:controller];
        i++;
    }
    
    self.tabPageController.viewControllers = vcArray;

}
- (UIView *)headerView {
//    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
//    header.backgroundColor = UIColor.redColor;
//    return header;
    return self.titleHeaderView;
}
- (CustomHeaderView *)titleHeaderView{
    if (!_titleHeaderView) {
        _titleHeaderView = CustomHeaderView.new;
        _titleHeaderView.titleLabel.text = @"-----";
        _titleHeaderView.subTitleLabel.text = @"----";
    }
    return _titleHeaderView;
}
@end
