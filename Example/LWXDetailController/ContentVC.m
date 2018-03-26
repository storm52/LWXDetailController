//
//  ContentVC.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/21.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "ContentVC.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "LWXTabPageController.h"

@interface ContentVC ()<UITableViewDataSource,UITableViewDelegate,PageScrollDelegate>

@property(nonatomic,strong)NSArray *namesArray;
@property(nonatomic,strong)NSArray *commentsArray;

@end

@implementation ContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = UIView.new;
    self.namesArray = @[@"蚂蚁金服",@"滴滴",@"小米",@"阿里云",@"美团点评",@"宁德时代",@"今日头条",@"菜鸟网络",@"陆金所",@"借贷宝",@"微众银行",@"平安医保科技",@"口碑",@"金融壹账通",@"京东金融"];
    self.commentsArray = @[@"蚂蚁金服还是6的",@"一眼看过去马爸爸占一半"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.index == 0 ? self.namesArray.count : self.commentsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *text = self.index == 0 ? self.namesArray[indexPath.row]:self.commentsArray[indexPath.row];
    cell.textLabel.text = text;
    return cell;
}
- (UIScrollView *)scrollView{
    return self.tableView;
}
@end
