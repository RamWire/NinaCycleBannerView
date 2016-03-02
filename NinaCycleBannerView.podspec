Pod::Spec.new do |s|
  s.name     = 'NinaCycleBannerView'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.platform      = :ios, '7.0'
  s.summary  = 'A cycle banner View for iOS.'
  s.homepage = 'https://github.com/RamWire/NinaCycleBannerView'
  s.author   = { 'RamWire' => 'RamWire' }
  s.source   = { :git => 'https://github.com/RamWire/NinaCycleBannerView.git', :tag => '0.0.1' } 
  s.source_files = 'NinaCycleBannerView/**/*.{h,m}'
  s.framework = 'UIKit'
  s.requires_arc  = true
  s.dependency 'SDWebImage'
end
