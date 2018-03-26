//
//  TabViewController.h
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YPTabBarController/YPTabBarController.h>
#import <ReactiveObjC/ReactiveObjC.h>

@protocol PageScrollDelegate<NSObject>
@optional
@property(nonatomic,readonly)UIScrollView *scrollView;
@end

@interface LWXTabPageController : YPTabBarController

- (RACSignal *)contentScrollSignal;

@end
