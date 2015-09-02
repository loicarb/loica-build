# This class is cool
# @abstract
module Loica::Build # :nodoc:
  class Platform

    def crosbuilds_for(target)
      raise NotImplementedError
    end

    def toolchain
      raise NotImplementedError
    end


    def enabled?
      false
    end

    private
      # Builds a Crossbuild object
      def crossbuild_with(target, sufix=nil, params={})
        toolchain.register!
        name = sufix ? File.join(target.name,sufix) : target.name

        MRuby::CrossBuild.new(name) do |conf|
          conf.params = params
          toolchain toolchain.name
          conf.gem target.root
        end
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
