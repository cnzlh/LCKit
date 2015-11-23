
Pod::Spec.new do |s|
  s.name             = "LCKit"
  s.version          = "1.0.4"
  s.summary          = "Common methods for iOS."
  s.description      = <<-DESC
                       It is common methods used on iOS, which implement by Objective-C.
                       DESC

  s.homepage         = "https://github.com/cnzlh/LCKit"
  s.license          = 'MIT'
  s.author           = { "linhua" => "cnzlh@163.com" }
  s.source           = { :git => "https://github.com/cnzlh/LCKit.git", :tag => s.version, :submodules => true }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'CommonTools' do |commonTools|
    commonTools.source_files = 'Pod/Classes/CommonTools/**/*'
    commonTools.public_header_files = 'Pod/Classes/CommonTools/**/*.h'
  end
  
#  s.subspec 'NetworkEngine' do |networkEngine|
#      networkEngine.source_files = 'Pod/Classes/NetworkEngine/**/*'
#      networkEngine.public_header_files = 'Pod/Classes/NetworkEngine/**/*.h'
#      networkEngine.dependency 'AFNetworking', '~> 2.3'
#  end
  
  s.frameworks = 'UIKit', 'MapKit', 'Foundation', 'CoreGraphics'
# s.dependency 'AFNetworking', '~> 2.3'
end
