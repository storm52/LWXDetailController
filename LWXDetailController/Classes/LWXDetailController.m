//
//  ContainerVC.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "LWXDetailController.h"
#import <Masonry/Masonry.h>

@interface MyScrollView : UIScrollView

@end
@implementation MyScrollView

// 这个方法是支持多手势，当滑动子控制器中的scrollView时，TableView也能接收滑动事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

@end


@interface LWXDetailController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong,readwrite) LWXTabPageController *tabPageController;
@end

@implementation LWXDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
  
    UIView *headerView = [self headerView];
    [self.scrollView addSubview:headerView];
    if (CGRectEqualToRect(headerView.frame, CGRectZero)) {
        [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.centerX.equalTo(self.scrollView);
            make.width.mas_equalTo(screenSize.width);
        }];
    }
    
    [self addChildViewController:self.tabPageController];
    [self.tabPageController didMoveToParentViewController:self];
    [self.scrollView addSubview:self.tabPageController.view];
    [self.tabPageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerX.bottom.equalTo(self.scrollView);
        make.top.mas_equalTo(headerView.mas_bottom);
        make.height.equalTo(self.scrollView.mas_height);
    }];
    
     @weakify(self);
    RACSignal *currentSubScrollOffset =  self.tabPageController.contentScrollSignal;
    [[currentSubScrollOffset filter:^BOOL(id  _Nullable value) {
        return [value isKindOfClass:UIScrollView.class];
    }]  subscribeNext:^(UIScrollView *subScrollView) {
        @strongify(self);
        CGFloat  offsetY = MAX(0,self.scrollView.contentOffset.y+subScrollView.contentOffset.y);
        if (offsetY<headerView.frame.size.height) {
            subScrollView.contentOffset = CGPointZero;
        }else{
        

            self.scrollView.contentOffset = CGPointMake(0,headerView.frame.size.height);
        }
    }];
}
- (void)viewDidLayoutSubviews{
    if (@available(iOS 11.0, *) && self.view.safeAreaInsets.bottom>0) {
         self.scrollView.frame = self.view.safeAreaLayoutGuide.layoutFrame;
    }else{
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat  offsetY = MAX(0,self.scrollView.contentOffset.y);
    if (offsetY>=self.headerView.frame.size.height) {
        self.scrollView.contentOffset = CGPointMake(0,self.headerView.frame.size.height);
    }
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = MyScrollView.new;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}
- (LWXTabPageController *)tabPageController{
    if (!_tabPageController) {
        _tabPageController = LWXTabPageController.new;
    }
    return _tabPageController;
}

- (UIView *)headerView{
    return UILabel.new;
}

@end
