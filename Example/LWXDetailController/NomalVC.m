//
//  NomalVC.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/22.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "NomalVC.h"

@interface NomalVC ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation NomalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = @"中国证券网讯（记者 李雁争）今日上午，科技部在北京国际会议中心第五会议厅召开新闻发布会，正式发布《2017年中国独角兽企业发展报告》 和 《2017年中关村独角兽企业发展报告》。\n\n蚂蚁金服以750亿美元估值第一，滴滴、小米分别以560亿美元、460亿美元估值列第二第三。\n排名前十的其它公司分别是阿里云、美团点评、宁德时代、今日头条、菜鸟网络、陆金所、借贷宝。\n";
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
