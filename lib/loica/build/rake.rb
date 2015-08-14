require 'loica/build'

application = Loica::Build::Application.load_from(File.join(Dir.pwd,'application.rake'))

raise application.inspect
