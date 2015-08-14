module Loica::Build
  module Utils
    module LoadFromFile
      Error = Class.new(RuntimeError)
      FileNotFoundError = Class.new(Error)
      TypeError = Class.new(Error)

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

      def self.loading?
        !!self.current_file
      end

      def self.current_file
        Thread.current[self.name]
      end

      def self.current_file=(file)
        Thread.current[self.name] = file
      end
    end
  end
end
