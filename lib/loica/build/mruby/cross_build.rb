module Loica::Build
  module MRuby
    # Loica specific Crossbuild aditions.
    class CrossBuild < ::MRuby::CrossBuild
      # Toolchain configuration params
      # Experiment that might be moved to MRuby
      attr_reader :params

      def initialize(*args)
        @params = {}
        super
      end

    end
  end
end
