module Loica::Build
  module MRuby
    class ApplicationGem < Gem
      def initialize(&block)
        super(nil,&block)
      end

      def fragment(fragment_name)
        path = File.expand_path("fragments/#{fragment_name}", Dir.pwd)
        self.add_dependency("fragment-#{fragment_name}", path: path)
      end

      def name
        raise NotImplementedError
      end

      def dir_name
        File.basename(self.dir)
      end

      def setup
        self.name # Here to raise error if name's not defined

        self.licenses = 'Private'
        self.authors = 'Application developers'

        super
      end
    end # class ApplicationGem
  end # module MRuby
end # module Loica::Build

