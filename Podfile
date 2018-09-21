source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

target 'MathPowerMVVMCRx' do
  pod 'ReactiveSwift'
  pod 'ReactiveCocoa'
  pod 'SwiftLint'
  pod 'SnapKit', '~> 4.0.0'

  target 'MathPowerMVVMCRxTests' do
    inherit! :search_paths

  end

end

swift_4_1_pod_targets = ['SnapKit']

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    if config.name.downcase.include? 'debug'
      config.build_settings['SWIFT_COMPILATION_MODE'] = 'singlefile'
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES';
      config.build_settings['ENABLE_TESTABILITY'] = 'YES';
    else
      config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO';
      config.build_settings['ENABLE_TESTABILITY'] = 'NO';
    end
  end

end
