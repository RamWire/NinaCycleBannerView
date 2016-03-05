Pod::Spec.new do |s|
  s.name     = 'NinaCycleBannerView'
  s.version  = '0.0.3'
  s.license  = 'MIT'
  s.platform      = :ios, '7.1'
  s.summary  = 'A cycle banner View for iOS.'
  s.homepage = 'https://github.com/RamWire/NinaCycleBannerView'
  s.author   = { 'RamWire' => 'RamWire' }
  s.source   = { :git => 'https://github.com/RamWire/NinaCycleBannerView.git', :tag => s.version.to_s }
  s.source_files = 'NinaCycleBannerView/**/*.{h,m}'
  s.framework = 'UIKit'
  s.requires_arc  = true
  s.dependency 'SDWebImage'
end
