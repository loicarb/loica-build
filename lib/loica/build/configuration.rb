module Loica::Build
  # Represent's a configuration base object
  # @abstract
  class Configuration
    # Generic configuration error
    Error = Class.new(RuntimeError)

    # The file provided was not found
    FileNotFoundError = Class.new(Error)

    # The file loaded didn't returned an object form the expected type
    TypeError = Class.new(Error)

    # Raised when the configuration root path is unknown
    RootPathUnknownError = Class.new(Error)

    def initialize(&block)
      if self.class.loading?
        self.root = File.dirname(self.class.current_file)
      end

      instance_exec(self,&block) if block
    end

    # Gets the object root path
    #
    # @return [Pathname] the root path
    def root
      raise RootPathUnknownError unless @root
      @root
    end

    # Sets an object root path
    # @see #root
    #
    # @param path [Pathname,String] the new path
    def root=(path)
      @root = Pathname(path)
    end

    class << self
      # Load an instance of the current class from file
      #
      # @param file [#to_s] the file's path to load
      # @return [self] the instance of the class loaded
      def load_from(file)
        file = String(file)

        unless File.file? file
          raise FileNotFoundError, "file \"#{file}\" not found"
        end

        self.current_file = file
        object = eval File.read(file), binding, file
        self.current_file = nil

        unless object.kind_of? self
          raise TypeError, "expected #{file} to declare a #{self.name} but declared a #{object.class.name}"
        end

        object
      end

      # Tells if a file is currently being loaded
      #
      # @return [Boolean] is a file being loaded?
      def loading?
        !!self.current_file
      end

      # Get's the path of the file being currently loaded
      #
      # @return [String,nil] the file being loaded path or nil if nothing is being loaded
      def current_file
        Thread.current[self.name]
      end

      protected
        # Set's the file being loaded.
        def current_file=(file)
          Thread.current[self.name] = file
        end
    end
  end
end
