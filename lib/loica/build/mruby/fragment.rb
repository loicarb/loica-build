module Loica::Build
  module MRuby
    class Fragment < ApplicationGem
      def name
        @name ||= "fragment-#{dir_name}"
      end
    end # class Fragment
  end # module MRuby
end # module Loica::Build
