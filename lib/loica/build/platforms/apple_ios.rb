module Loica::Build
  module Platforms
    class AppleiOS < Platform
      XCODE_PATH = `xcode-select -print-path`.chomp rescue nil

      def enabled?
        Toolchains::XCode.available?
      end


      def crosbuilds_for(target)
        [
          # Device
          MRuby::CrossBuild.new(File.join(target.name,'devise')) do |conf|
            conf.params[:sdk] = :iPhoneOS
            toolchain Toolchains::XCode.name

            conf.gem target.root
          end,

          # Simulator
          MRuby::CrossBuild.new(File.join(target.name,'simulator')) do |conf|
            conf.params[:sdk] = :iPhoneSimulator
            toolchain Toolchains::XCode.name

            conf.gem target.root
          end
        ]
      end
    end
  end
end
