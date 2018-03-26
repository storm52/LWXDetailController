//
//  ContentVC.h
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

#define SCREEN_WIDTH (SCREEN_SIZE.width)
#define SCREEN_HEIGHT (SCREEN_SIZE.height)

@interface ContentVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign)NSInteger index;
@end
