Pod::Spec.new do |s|
  s.name     = 'NinaCycleBannerView'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A cycle banner View for iOS.'
  s.homepage = 'https://github.com/RamWire/NinaCycleBannerView'
  s.author   = { 'RamWire' => 'RamWire' }
  s.source   = { :git => 'https://github.com/RamWire/NinaCycleBannerView.git', :tag => '0.0.1' }
  s.platform = :ios  
  s.source_files = 'NinaCycleBannerView//*.{h,m}'
  s.framework = 'UIKit'
  s.dependency 'SDWebImage'
end