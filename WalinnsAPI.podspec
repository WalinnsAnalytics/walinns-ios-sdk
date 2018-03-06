Pod::Spec.new do |s|
s.name              = 'WalinnsAPI'
s.version           = '1.0.1'
s.summary           = 'A really cool SDK for mobile analytics.'
s.homepage          = 'https://github.com/Rejoylin/WalinnsAPI-ObjC'

s.author            = { 'Name' => 'rejoylin2015@gmail.com' }
s.license           = { :type => 'MIT', :file => 'LICENSE' }
s.platform          = :ios
s.source            = { :git => 'https://github.com/Rejoylin/WalinnsAPI-ObjC.git' }
s.source_files = 'WalinnsAPI.framework/Headers/*.h'
s.ios.deployment_target = '8.0'
s.ios.vendored_frameworks = 'WalinnsAPI.framework'
end


