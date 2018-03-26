//
//  ContainerVC.h
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWXTabPageController.h"


@interface LWXDetailController : UIViewController


@property (nonatomic,strong,readonly) LWXTabPageController *tabPageController;

//支持autolayout,所以内部可以内容填充布局,当然给定frame也支持了
- (UIView *)headerView;

@end




