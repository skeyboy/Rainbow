Pod::Spec.new do |spec|
  spec.name         = 'Rainbow'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/skeyboy/Rainbow'
  spec.authors      = { 'lylapp' => 'lylapp@163.com' }
  spec.summary      = 'a brief app route manager'
  spec.source       = { :git => 'https://github.com/skeyboy/Rainbow.git', :tag => 'v3.1.0' }
  spec.source_files = 'Rainbow/Sources/**/*.{h,m,swift}'
  spec.framework    = 'UIKit'
end