Pod::Spec.new do |s|
  s.name         = "OXKit"
  s.version      = "0.4.1"
  s.summary      = "Kit for iOS Swift"
  s.homepage     = "http://oxozle.com"
  s.license      = "MIT"
  s.author       = { "Dmitriy Azarov" => "contacts@oxozle.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/oxozle/oxkit-swift.git", :tag => s.version}
  s.source_files = "Source/**/*.swift"

  s.dependency 'SwiftyJSON'
  s.dependency 'AsyncSwift'
end
