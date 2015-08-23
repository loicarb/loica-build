module Loica::Build # :nodoc:
  module Platforms # :nodoc:

    # The Web platform build apps for browsers
    class Web < Platform

      def enabled?
        Toolchains::Emscripten.available?
      end

      def crosbuilds_for(target)
        Toolchains::Emscripten.register!

        [
          MRuby::CrossBuild.new(target.name) do |conf|
            toolchain Toolchains::Emscripten.name

            conf.gem target.root
          end
        ]
      end

    end # class Web
  end # module Platforms
end # module Loica::Build
