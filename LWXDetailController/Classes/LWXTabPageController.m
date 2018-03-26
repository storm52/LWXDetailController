//
//  TabViewController.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "LWXTabPageController.h"


@interface LWXTabPageController ()

@end

@implementation LWXTabPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.itemTitleColor = UIColor.grayColor;
    [self setContentScrollEnabled:YES tapSwitchAnimated:YES];

    self.tabBar.indicatorColor = UIColor.grayColor;
    [self.tabBar setIndicatorInsets:UIEdgeInsetsMake(42, 10, 0, 10) tapSwitchAnimated:YES];
   
}
- (void)viewDidLayoutSubviews{
      CGSize screenSize = UIScreen.mainScreen.bounds.size;
    [self setTabBarFrame:CGRectMake(0, 0, screenSize.width, 44)
        contentViewFrame:CGRectMake(0, 44,screenSize.width, self.view.frame.size.height-44)];
}
- (RACSignal *)contentScrollSignal{
    @weakify(self);
    RACSignal *changedTab=[self rac_signalForSelector:@selector(didSelectViewControllerAtIndex:)];
    return [[[[changedTab  map:^__kindof RACSignal * _Nullable(RACTuple *value) {
        @strongify(self);
        id<PageScrollDelegate> scrollVC = (id<PageScrollDelegate>)self.viewControllers[[value.first integerValue]];
        BOOL scrollable = [scrollVC respondsToSelector:@selector(scrollView)] ;
        return scrollable?RACObserve(scrollVC.scrollView, contentOffset):[RACSignal return:[NSNull null]];
    }] switchToLatest] filter:^BOOL(id  _Nullable value) {
        return [value isKindOfClass:NSNull.class] || [value CGPointValue].y != 0;
    }] map:^id _Nullable(id  _Nullable value) {
        if ([value isKindOfClass:NSNull.class]) return value;
        @strongify(self);
       id<PageScrollDelegate> scrollVC = (id<PageScrollDelegate>)self.selectedController;
        return  scrollVC.scrollView;
    }];
}


@end
