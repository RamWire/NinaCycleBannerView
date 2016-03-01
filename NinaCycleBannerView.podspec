Pod::Spec.new do |s|

  s.name         = ‘NinaCycleBannerView’
  s.version      = "0.0.1"
  s.summary      = "A cycle banner View for iOS.”
  s.homepage     = ‘https://github.com/RamWire/NinaCycleBannerView'
  s.license      = ‘MIT’
  s.author             = { “RamWire Zhao” => “zhaogengda@126.com” }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/RamWire/NinaCycleBannerView.git”, :tag => "0.0.1" }
  s.source_files  = "NinaCycleBannerView", "NinaCycleBannerView/**/*.{h,m}"
  s.public_header_files = "NinaCycleBannerView/**/*.h"
  s.framework  = "UIKit"
  s.dependency 'SDWebImage', '~>3.7'

end
