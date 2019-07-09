
Pod::Spec.new do |spec|

  spec.name         = "DKResourceLinkKit"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of DKResourceLinkKit."
  spec.description  = "不同bundle加载资源类"
  spec.homepage     = "../"
  spec.license      = "MIT"
  spec.author       = { "cuibing" => "cuibing@dankegongyu.com" }
  spec.source       = { :git => "", :tag => "#{spec.version}" }
  spec.source_files  = "Class", "Class/**/*.{h,m}"
  spec.exclude_files = "Class/Exclude"
  # spec.dependency "JSONKit", "~> 1.4"

end
