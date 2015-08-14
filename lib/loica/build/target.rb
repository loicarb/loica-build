module Loica::Build # :nodoc:

  # This represent's an application target build
  class Target < Configuration

    # The target's application
    #
    # @return [Loica::Build::Application] the application
    attr_accessor :application
  end
end
