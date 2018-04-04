# LWXDetailController

[![CI Status](http://img.shields.io/travis/storm52/LWXDetailController.svg?style=flat)](https://travis-ci.org/storm52/LWXDetailController)
[![Version](https://img.shields.io/cocoapods/v/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)
[![License](https://img.shields.io/cocoapods/l/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)
[![Platform](https://img.shields.io/cocoapods/p/LWXDetailController.svg?style=flat)](http://cocoapods.org/pods/LWXDetailController)

![image](https://github.com/storm52/LWXDetailController/blob/master/demo.gif)

## 使用

继承LWXDetailController，重写headerView，指定子控制器数组，Done~

内容控制器可滑动，实现PageScrollDelegate，返回滑动的视图
```
- (UIScrollView *)scrollView{
    return self.tableView;
}
```
指定头部视图
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
## 实现

用ReactiveObjC实现，监听切换事件，并对新的UIScrollView 的offset进行监听，与本身scrollview的offset协调。如果子控制器不是可滑动的，则切换到监听本身的offset即可

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

storm52, storm52@qq.com

## License

LWXDetailController is available under the MIT license. See the LICENSE file for more info.
