module Loica::Build
  module MRuby
    class Target < ApplicationGem
      def name
        @name ||= "target-#{dir_name}"
      end
    end # class Target
  end # module MRuby
end # module Loica::Build
