module Loica::Build
  module Platforms
    class Web < Platform
      # TODO: Dynamic lookup of EMSCRIPTEN_DIR
      EMSCRIPTEN_DIR = '/usr/local/opt/emscripten'
      EMCC = File.join(EMSCRIPTEN_DIR, 'bin', 'emcc')
      EMXX = File.join(EMSCRIPTEN_DIR, 'bin', 'em++')
      EMLD = File.join(EMSCRIPTEN_DIR, 'bin', 'emcc')
      EMAR = File.join(EMSCRIPTEN_DIR, 'bin', 'emar')

      def enabled?
        File.directory?(EMSCRIPTEN_DIR)
      end

      def crosbuilds_for(target)
        [
          ::MRuby::CrossBuild.new(target.name) do |conf|
            toolchain :clang

            conf.cc do |cc|
              cc.command = EMCC
            end

            conf.cxx.command = EMLD
            conf.linker.command = EMLD
            conf.archiver.command = EMAR
          end
        ]
      end
    end
  end
end
