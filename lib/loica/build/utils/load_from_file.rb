module Loica::Build
  module Utils

    # Utility module to load instances of a class from a given path
    #
    # A class might look like this:
    #
    #   class Loadable
    #     extend Loica::Build::Utils::LoadFromFile
    #   end
    #
    #   # And now you can load an instance from a file with:
    #   Loadable.load_from(some_path)
    #
    module LoadFromFile
      # General error ocurred while loading a file from path
      Error = Class.new(RuntimeError)

      # The file provided was not found
      FileNotFoundError = Class.new(Error)

      # The file loaded didn't returned an object form the expected type
      TypeError = Class.new(Error)


      # Load an instance of the current class from file
      #
      # @param file [#to_s] the file's path to load
      # @return [self] the instance of the class loaded
      def load_from(file)
        file = String(file)

        unless File.file? file
          raise FileNotFoundError, "file \"#{file}\" not found"
        end

        LoadFromFile.current_file = file
        object = eval File.read(file), binding, file
        LoadFromFile.current_file = nil

        unless object.kind_of? self
          raise TypeError, "expected #{file} to declare a #{self.name} but declared a #{object.class.name}"
        end

        object
      end

      # Tells if a file is currently being loaded
      #
      # @return [Boolean] is a file being loaded?
      def self.loading?
        !!self.current_file
      end

      # Get's the path of the file being currently loaded
      #
      # @return [String,nil] the file being loaded path or nil if nothing is being loaded
      def self.current_file
        Thread.current[self.name]
      end

      protected
        # Set's the file being loaded.
        def self.current_file=(file)
          Thread.current[self.name] = file
        end
    end
  end
end
