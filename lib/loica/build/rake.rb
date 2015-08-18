require 'loica/build'

%w{application mruby targets}.each do |tasks|
load File.expand_path("../rake/#{tasks}.rake", __FILE__)
end

