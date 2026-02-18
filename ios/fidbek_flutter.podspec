Pod::Spec.new do |s|
  s.name             = 'fidbek_flutter'
  s.version          = '1.0.5'
  s.summary          = 'Flutter wrapper for Fidbek binary SDKs.'
  s.description      = <<-DESC
Flutter method-channel bridge for the Fidbek mobile SDK.
The iOS implementation is distributed as a prebuilt XCFramework.
  DESC
  s.homepage         = 'https://fidbek.com'
  s.license          = { :type => 'Commercial', :text => 'Copyright Fidbek' }
  s.author           = { 'Fidbek' => 'support@fidbek.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency       'Flutter'
  s.platform         = :ios, '13.0'
  s.swift_version    = '5.9'
  s.static_framework = true
  s.vendored_frameworks = 'FidbekSDK.xcframework'
end
