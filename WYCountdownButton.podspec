
Pod::Spec.new do |s|
 

s.name         = 'WYCountdownButton'
    s.version      = '1.0.1'
s.summary      = '简单的倒计时按钮封装'
    s.homepage     = 'https://github.com/lwy121810/WYCountdownButtonDemo'
     s.license      = "MIT"
    s.authors      = { 'lwy121810' => '381319898@qq.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/lwy121810/WYCountdownButtonDemo.git', :tag => s.version.to_s }
    s.source_files = 'WYCountdownButton/*.{h,m}'
    s.requires_arc = true

end

