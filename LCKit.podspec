#
# Be sure to run `pod lib lint LCKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LCKit"
  s.version          = "1.0.0"
  s.summary          = "Common methods for iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       It is common methods used on iOS, which implement by Objective-C.
                       DESC

  s.homepage         = "https://github.com/cnzlh/LCKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "linhua" => "cnzlh@163.com" }
  s.source           = { :git => "https://github.com/cnzlh/LCKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

#  s.source_files = 'Pod/Classes/**/*'
#    s.resource_bundles = {
#      'LCKit' => ['Pod/Assets/*.png']
#    }
#  s.public_header_files = 'Pod/Classes/**/*.h'

  s.subspec 'CommonTools' do |commonTools|
      commonTools.source_files = 'Pod/Classes/CommonTools/**/*'
      commonTools.public_header_files = 'Pod/Classes/CommonTools/**/*.h'
  end

  
  
  s.frameworks = 'UIKit', 'MapKit', 'Foundation', 'CoreGraphics'
  s.dependency 'AFNetworking', '~> 2.3'
end
