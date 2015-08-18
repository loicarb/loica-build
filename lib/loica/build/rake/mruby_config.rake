require 'loica/build/mruby'

# host MRuby build
MRuby::Build.new do |conf|
  toolchain :gcc

  enable_debug

  # include the default GEMs
  conf.gembox 'default'
end

# Setup MRuby crossbuilds for each target
CURRENT_APPLICATION.targets.each(&:crossbuilds)
