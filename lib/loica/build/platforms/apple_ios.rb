module Loica::Build
  module Platforms
    class AppleiOS < Platform
      MIN_IOS_VERSION = 4.3
      XCODE_PATH = `xcode-select -print-path`.chomp rescue nil

      def enabled?
        !!XCODE_PATH
      end


      def crosbuilds_for(target)
        [
          # Device
          ::MRuby::CrossBuild.new(File.join(target.name,'Devise')) do |conf|
            toolchain :clang

            [conf.cc, conf.cxx, conf.objc].each do |cc|
              cc.command = XCODE_PATH + '/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang'
              %w{armv7 armv7s arm64}.each do |arch|
                cc.flags << %Q[-arch #{arch}]
              end
              cc.flags << %Q[-miphoneos-version-min=#{MIN_IOS_VERSION}]
              cc.flags << %Q[-isysroot "#{XCODE_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk"]
              cc.flags << %Q[-fmessage-length=0 -std=gnu99 -fpascal-strings -fexceptions -fasm-blocks -gdwarf-2]
              cc.flags << %Q[-fobjc-abi-version=2]
            end
          end
          # TODO: Simulator build
          #  ::MRuby::CrossBuild.new(File.join(target.name,'Simulator')) do |conf|
          #  end
        ]
      end
    end
  end
end
