module Loica::Build
  module MRuby
    class Target < Gem
      def initialize(&block)
        super(nil,&block)
      end

      def setup
        self.licenses = 'Private'
        self.authors = ''
        target_name = File.basename(self.dir)
        self.name = "target-#{target_name}"

        super
      end
    end # class Target
  end # module MRuby
end # module Loica::Build
