Pod::Spec.new do |s|

  s.name         = "GreedCategory"
  s.version      = "0.1.0"
  s.summary      = "category for cocoa"
  s.description  = %{some category for cocoa }
  s.homepage     = "https://github.com/greedlab/GreedCategory"
  s.license      = "MIT"
  s.author       = { "Bell" => "bell@greedlab.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/greedlab/GreedCategory.git", :tag => s.version }
  s.source_files  = "GreedCategory", "GreedCategory/*.{h,m}"
  s.frameworks  = "Foundation","UIKit","CoreGraphics","CoreLocation"
  s.requires_arc = true

end
