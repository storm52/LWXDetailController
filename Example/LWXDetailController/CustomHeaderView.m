//
//  CustomHeaderView.m
//  FreeScollDemo
//
//  Created by liuwuxiong on 2018/3/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "CustomHeaderView.h"
#import <Masonry/Masonry.h>

@implementation CustomHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    UIView *seprator = UIView.new;
    seprator.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:.85 alpha:1.0];
    [self addSubview:seprator];
    [seprator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.bottom.equalTo(self);
        make.height.mas_equalTo(8);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(18);
        make.centerX.equalTo(self);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.left.centerX.equalTo(self.titleLabel);
        make.bottom.equalTo(self).offset(-18);
    }];
   
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = UILabel.new;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = UILabel.new;
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.textColor = UIColor.grayColor;
    }
    return _subTitleLabel;
}


@end
