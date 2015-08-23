module Loica::Build
  module Toolchains
    class XCode < Toolchain

      def available?
        false
      end

      def register!
        super do |conf|
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

            conf.linker.command = XCODE_PATH + '/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld'
            conf.archiver.command = XCODE_PATH + '/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool'
            conf.archiver.archive_options = '-o %{outfile} %{objs}'

            conf.gem target.root
        end
      end

    end # class XCode
  end # module Toolchains
end # module Loica::Build
