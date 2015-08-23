module Loica::Build
  class Toolchain
    ToolchainNotAvailableError = Class.new(NotImplementedError)

    def available?
      raise NotImplementedError
    end

    def register!(&block)
      @toolchain ||= begin
        raise NotImplementedError unless block
        raise ToolchainNotAvailableError unless available?

        ::MRuby::Toolchain.new(self.class.name, &block)
      end
    end

    def toolchain
      @toolchain
    end

    def name
      self.toolchain.name
    end

    class << self
      def instance
        @instance ||= self.new
      end

      def method_missing(*args)
        self.instance.send(*args)
      end
    end # class << self
  end # class Toolchain
end # module Loica::Build
