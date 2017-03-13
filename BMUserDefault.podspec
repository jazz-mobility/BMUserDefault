Pod::Spec.new do |s|
   s.name         = "BMUserDefault"
   s.version      = "1.0.0"
   s.summary      = "custom UserDefault like NSUserDefault, specific store path, thread safe auto store"
   s.homepage     = "https://github.com/zhengbomo/BMUserDefault"
   s.license      = "MIT"
   s.authors      = { 'bomo' => 'zhengbomo@hotmail.com'}
   s.platform     = :ios, "8.0"
   s.source       = { :git => "https://github.com/zhengbomo/BMUserDefault", :tag => s.version }
   s.source_files = 'BMUserDefault/BMUserDefault/BMUserDefault/*.{h,m}'
   s.requires_arc = true

end
