module Loica::Build
  module Toolchains
    class AndroidNDK < Toolchain
      HOMEBREW_NDK_PATH = '/usr/local/opt/android-ndk'
      ARCHITECTURES = %w{
        armeabi armeabi-v7a arm64-v8a
        mips mips64
        x86 x86_64
      }

      def available?
        ndk_path.directory?
      end

      def ndk_path
        Pathname(HOMEBREW_NDK_PATH)
      end

      def register!
        super do |conf|
          toolchain :clang
        end
      end
    end
  end
end
