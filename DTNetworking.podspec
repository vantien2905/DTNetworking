#
# Be sure to run `pod lib lint DTNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'DTNetworking'
s.version          = '0.1.1'
s.summary          = 'DTNetworking is library call api easy for mobile.'
s.swift_versions   = ['4.2', '5.0']
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
TODO: Add base networking.
DESC

s.homepage         = 'https://github.com/vantien2905/DTNetworking.git'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'vantien2905' => 'vantien2905@gmail.com' }
s.source           = { :git => 'https://github.com/vantien2905/DTNetworking.git', :branch => "master", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '11.0'

s.source_files = 'DTNetworking/Classes/**/*'

# s.resource_bundles = {
#   'DTNetworking' => ['DTNetworking/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
s.dependency 'SwiftyJSON'
s.dependency 'Alamofire'
s.dependency 'ObjectMapper'
s.dependency 'RealmSwift'
s.dependency 'Toast-Swift'
s.dependency 'ReachabilitySwift'
end
