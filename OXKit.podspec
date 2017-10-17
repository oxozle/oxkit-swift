Pod::Spec.new do |s|
  s.name         = "OXKit"
  s.version      = "1.0"
  s.summary      = "Kit for iOS Swift"
  s.homepage     = "https://github.com/oxozle/oxkit-swift"
  s.license      = "MIT"
  s.author       = { "Dmitriy Azarov" => "contacts@oxozle.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/oxozle/oxkit-swift.git", :tag => s.version}
  s.source_files = "Sources/**/*.swift"

  s.ios.deployment_target = '9.0'
end
