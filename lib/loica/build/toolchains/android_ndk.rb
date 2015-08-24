module Loica::Build # :nodoc:
  module Toolchains # :nodoc:

    # Helper class to handle NDK crosscompilation
    class AndroidNDK < Toolchain

      # Default NDK installation path from homebrew
      HOMEBREW_PATH = '/usr/local/opt/android-ndk'

      # NDK toolchains
      TOOLCHAINS = [:gcc, :clang]

      # NDK Architectures
      ARCHITECTURES = %w{
        armeabi armeabi-v7a arm64-v8a
        mips mips64
        x86 x86_64
      }

      def available?
        path.directory?
      end

      def path
        Pathname(HOMEBREW_PATH)
      end

      def host_platform
        @host_platform ||= case RUBY_PLATFORM
        when /cygwin|mswin|mingw|bccwin|wince|emx/i
          'windows'
        when /x86_64-darwin/i
          'darwin-x86_64'
        when /darwin/i
          'darwin-x86'
        when /x86_64-linux/i
          'linux-x86_64'
        when /linux/i
          'linux-x86'
        else
          raise NotImplementedError, "Unknown host platform (#{RUBY_PLATFORM})"
        end
      end

      # Wrapper to an specific architecture on a given toolchain on the NDK
      #
      # @private
      class Architecture
        attr_reader :toolchain

        def initialize(params)
          @toolchain = params.fetch(:toolchain){ :gcc }
          @arch = params.fetch(:arch)

          raise ArgumentError, "Invalid Android NDK toolchain (#{@toolchain.inspect})" unless TOOLCHAINS.include?(@toolchain)
          raise ArgumentError, "Invalid Android NDK architecture (#{@arch.inspect})" unless ARCHITECTURES.include?(@arch)
        end

      end # class Architecture

      def register!
        super do |conf|
          arch = Architecture.new(conf.params)

          toolchain arch.toolchain

          # Archive
          conf.exts.library = '.so'
        end
      end

    end # class AndroidNDK
  end # module Toolchains
end # module Loica::Build
