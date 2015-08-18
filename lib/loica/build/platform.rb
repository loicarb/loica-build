# This class is cool
# @abstract
module Loica::Build # :nodoc:
  class Platform

    def crosbuilds_for(target)
      raise NotImplementedError
    end

    class << self
      def build(platform)
        case platform
        when Symbol, String then Platforms.const_get(platform).new
        when Class then platform.new
        else
          platform
        end
      end
    end
  end
end
