module Loica::Build
  module Platforms
    class Android < Platform

      def enabled?
        Toolchains::AndroidNDK.available?
      end

      def architectures
        @architectures ||= Toolchains::AndroidNDK::ARCHITECTURES.dup
      end

      def crosbuilds_for(target)
        Toolchains::AndroidNDK.register!

        self.architectures.map do |arch|
          MRuby::CrossBuild.new(File.join(target.name,arch)) do |conf|
            conf.params[:arch] = arch
            toolchain Toolchains::AndroidNDK.name

            conf.gem target.root
          end
        end
      end # def crosbuilds_for

    end # class Android
  end # module Platforms
end # module Loica::Build
