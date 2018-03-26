#
# Be sure to run `pod lib lint LWXDetailController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWXDetailController'
  s.version          = '0.1.1'
  s.summary          = '快速设置一个有头视图有自定义的子控制器的详情页'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/storm52/LWXDetailController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'storm52' => 'liuwuxiong2506@tops001.com' }
  s.source           = { :git => 'https://github.com/storm52/LWXDetailController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.dependency 'ReactiveObjC', '~> 2.1.0'
  s.dependency 'YPTabBarController'
  s.dependency 'Masonry'

  s.source_files = 'LWXDetailController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LWXDetailController' => ['LWXDetailController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
