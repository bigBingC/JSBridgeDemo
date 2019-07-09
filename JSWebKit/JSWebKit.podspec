
Pod::Spec.new do |spec|
  spec.name          = "JSWebKit"
  spec.version       = "0.0.1"
  spec.summary       = "A short description of JSWebKit."
  spec.description   = "iOS架构接入web组件，用来展示web相关页面及交互"
  spec.homepage      = "../"
  spec.license       = "MIT"
  spec.author        = { "cuibing" => "cuibing@dankegongyu.com" }
  spec.source        = { :git => "", :tag => "#{spec.version}" }
  spec.source_files  = "Class", "Class/**/*.{h,m}"
  spec.exclude_files = "Class/Exclude"
  spec.resource_bundles = {
    'JSWebKit' => ['Class/**/*.{storyboard,xib,xcassets,plist,jpg,png}']
  }
  spec.dependency "Masonry"
end
