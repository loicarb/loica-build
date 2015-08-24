module Loica::Build
  module Platforms
    class AppleiOS < Platform
      XCODE_PATH = `xcode-select -print-path`.chomp rescue nil

      def enabled?
        Toolchains::XCode.available?
      end


      def crosbuilds_for(target)
        [
          #   type      sdk
          %w{ devise    iPhoneOS },
          %w{ simulator iPhoneSimulator }
        ].map do |type, sdk|
          MRuby::CrossBuild.new(File.join(target.name,type)) do |conf|
            conf.params[:sdk] = sdk
            toolchain Toolchains::XCode.name

            conf.gem target.root
          end
        end
      end
    end
  end
end
