
Pod::Spec.new do |s|

  s.name         = "APFancyPager"
  s.version      = "1.1"
  s.summary      = "A fancy pager view controller framework for Swift/Objective-C"
  s.description  = <<-DESC
            A fancy pager view controller framework for Swift/Objective-C
                   DESC

  s.homepage     = "https://github.com/AppsComTr/APFancyPager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Orhun Mert Simsek" => "mert@apps.com.tr" }
  s.social_media_url   = "http://twitter.com/orhunmertsimsek"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/AppsComTr/APFancyPager.git", :tag => s.version }

  s.source_files  = "APFancyPager/**/*.{h,m,swift}"
  s.swift_version = "4.2"

  s.documentation_url = "http://apps.com.tr/APFancyPager/docs/"

end
