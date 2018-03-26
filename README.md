# LWXDetailController

[![CI Status](http://img.shields.io/travis/storm52/LWXDetailController.svg?style=flat)](https://travis-ci.org/storm52/LWXDetailController)
[![Version](https://img.shields.io/cocoapods/v/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)
[![License](https://img.shields.io/cocoapods/l/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)
[![Platform](https://img.shields.io/cocoapods/p/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)

![image](https://github.com/storm52/LWXDetailController/blob/master/demo.gif)

##使用

继承LWXDetailController，重写headerView，指定子控制器数组，Done~

```
- (UIView *)headerView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    header.backgroundColor = UIColor.redColor;
    return header;
}

- (CustomHeaderView *)headerView{
    if (!_titleHeaderView) {
        _titleHeaderView = CustomHeaderView.new;
        _titleHeaderView.titleLabel.text = @"-----";
        _titleHeaderView.subTitleLabel.text = @"----";
    }
    return _titleHeaderView;
}


```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LWXDetailController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LWXDetailController'
```

## Author

storm52, liuwuxiong2506@tops001.com

## License

LWXDetailController is available under the MIT license. See the LICENSE file for more info.
