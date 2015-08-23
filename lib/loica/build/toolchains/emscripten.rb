module Loica::Build # :nodoc:
  module Toolchains # :nodoc:

    # Emscripten toolchain builds to asm.js
    class Emscripten < Toolchain

      # By default we look at the homebrew install path
      HOMEBREW_PATH = '/usr/local/opt/emscripten'

      # Is Emscripten toolchain is available
      def available?
        path.directory?
      end

      # Emscripten installed path
      def path
        Pathname(HOMEBREW_PATH)
      end

      # Path to an emscripten binary
      def bin(name)
        self.path.join('bin',name.to_s).to_s
      end

      # Register emscripten toolchain to be used by MRuby's build tasks
      def register!
        super do |conf|
          toolchain :clang

          conf.cc do |cc|
            cc.command = Emscripten.bin(:emcc)
          end

          conf.cxx.command = Emscripten.bin('em++')
          conf.linker.command = Emscripten.bin(:emcc)

          # Archive
          conf.exts.library = '.js'
          conf.archiver.archive_options = '-o %{outfile} %{objs}'
          conf.archiver.command = Emscripten.bin(:emcc)
        end
      end

    end # class Emscripten
  end # module Toolchains
end # module Loica::Build
