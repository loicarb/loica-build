module Loica::Build # :nodoc:

  # This represent's an application target build
  class Target < Configuration

    # Raised when the target's application is unknown
    ApplicationUnknownError = Class.new(Error)

    # Raised when the target's platform is unknown
    PlatformUnknownError = Class.new(Error)

    # The target's application
    #
    # @return [Loica::Build::Application] the application
    def application
      raise ApplicationUnknownError unless @application

      @application
    end

    # @see #application
    def application=(application)
      @application = application
    end

    # The target's target platform
    #
    # @return [Loica::Build::Platform] the platform
    def platform
      raise PlatformUnknownError unless @platform

      @platform
    end

    # @see #platform
    def platform=(platform)
      @platform = Platform.build(platform)
    end

    def name
      self.root.basename.to_s
    end

    def crossbuilds
      @crossbuilds ||= self.platform.crosbuilds_for(self)
    end
  end
end
