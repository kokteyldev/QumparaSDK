Pod::Spec.new do |s|
  s.name             = 'QumparaSDK'
  s.version          = '1.3.0'
  s.license          = { :type => 'Copyright', :text => <<-LICENSE
                          Copyright 2019
                          Nobium Bilgi Teknolojileri.
                        LICENSE
                      }
  s.homepage         = 'http://www.nobium.com.tr/'
  s.author           = { 'Nobium' => 'info@nobium.com.tr' }
  s.summary          = 'Qumpara SDK'
  s.description      = 'Qumpara SDK offers digital offers for physical campaigns.'

  s.source           = { :git => 'https://github.com/kokteyldev/QumparaSDK.git',
                         :tag => s.version.to_s }
  s.documentation_url = 'https://github.com/kokteyldev/QumparaSDK/blob/master/README.md'

  s.platform              = :ios
  s.ios.deployment_target = '13.0'

  s.vendored_frameworks = 'QumparaSDK/QumparaSDK.xcframework'
  s.resources           = ['Sources/QumparaSDKResources/QumparaResources.bundle']

  s.frameworks = 'AdSupport', 'WebKit', 'CoreTelephony'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC -lc++'
  }

  s.dependency 'QumparaAnalyticsSDK', '~> 1.0.1'
end
