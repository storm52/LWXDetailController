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
@property (nonatomic,strong,readwrite) TabPageController *tabPageController;
@end

@implementation LWXDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.scrollView];
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
        make.height.equalTo(self.view);
    }];
    
     @weakify(self);
    RACSignal *currentSubScrollOffset =  self.tabPageController.contentScrollSignal;
    [[currentSubScrollOffset filter:^BOOL(id  _Nullable value) {
        BOOL canScoll =[value isKindOfClass:UIScrollView.class];
        if (!canScoll) {//子控制器不支持滑动时，处理父容器ScrollView
            RACSignal *scrollSignal = [self rac_signalForSelector:@selector(scrollViewDidScroll:) fromProtocol:@protocol(UIScrollViewDelegate)];
            [[scrollSignal takeUntil:currentSubScrollOffset]  subscribeNext:^(id  _Nullable x) {
                CGFloat  offsetY = MAX(0,self.scrollView.contentOffset.y);
                if (offsetY>=headerView.frame.size.height) {
                    self.scrollView.contentOffset = CGPointMake(0,headerView.frame.size.height);
                }
            }];
        }
        return canScoll;
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
//FixMe: 不知道为什么不写这个函数，上面的scrollSingal不会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

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
- (TabPageController *)tabPageController{
    if (!_tabPageController) {
        _tabPageController = TabPageController.new;
    }
    return _tabPageController;
}

- (UIView *)headerView{
    return UILabel.new;
}

@end
