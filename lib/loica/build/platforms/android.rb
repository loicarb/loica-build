module Loica::Build
  module Platforms
    class Android < Platform
      ANDROID_NDK = '/usr/local/opt/android-ndk'
      ABIS = [
        %w{ arm64-v8a arm },
        %w{ armeabi arm },
        %w{ armeabi-v7a arm },
        %w{ mips mips },
        %w{ mips64 mips },
        %w{ x86 x86 },
        %w{ x86_64 x86 }
      ]

      def enabled?
        File.directory?(ANDROID_NDK)
      end

      def crosbuilds_for(target)
        ENV['ANDROID_NDK_HOME'] = ANDROID_NDK
        ENV['GCC_VERSION'] = '4.9'

        ABIS.map do |abi, arch|
          ENV['ANDROID_TARGET_ARCH'] = arch
          ENV['ANDROID_TARGET_ARCH_ABI'] = abi

          ::MRuby::CrossBuild.new(File.join(target.name,abi)) do |conf|
            toolchain :androideabi

            conf.gem target.root
          end
        end
      end
    end
  end
end
