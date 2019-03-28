#
# Be sure to run `pod lib lint DKExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DKExtensions'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DKExtensions.'
  
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kuzindmitry/DKExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kuzindmitry' => 'dmitry@kuzin.es' }
  s.source           = { :git => 'https://github.com/kuzindmitry/DKExtensions.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'

  s.source_files = 'DKExtensions/Classes/**/*'
  
  s.swift_version = '5.0'
  
s.frameworks = 'CFNetwork', 'UIKit'
   s.dependency 'Alamofire'
end
