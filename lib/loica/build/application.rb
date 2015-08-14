module Loica::Build # :nodoc:

  # This represents the application being loaded
  # its loaded typically from `application.rb` on the current folder
  # and holds the application configuration
  class Application < Configuration

    # Path component where application targets reside
    TARGETS_DIRECTORY = 'targets'


    # Path where the application's targets reside
    #
    # @return [Pathname] the path
    def targets_path
      self.root.join(TARGETS_DIRECTORY)
    end

    # Loads a target with the given name
    #
    # @param name [String] the target name
    # @return [Loica::Build::Target] the loaded target
    def target(name)
      Target.load_from(self.targets_path.join(name,'target.rake')).tap do |target|
        target.application = self
      end
    end

    # Returns all the application targets
    #
    # @return [Array<Loica::Build::Target>] the targets
    def targets
      @targets ||= targets_path.children.map do |target|
        begin
          self.target(target.basename)
        rescue Target::FileNotFoundError
          nil
        end
      end.compact
    end

  end
end
