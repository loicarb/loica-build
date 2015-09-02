# Set some ENV variables for MRuby
require 'mruby/source'

## Build MRuby targets in ./build/mruby
ENV['MRUBY_BUILD_DIR'] = CURRENT_APPLICATION.root.join('build', 'mruby').to_s

## MRuby Targets config
ENV['MRUBY_CONFIG'] = File.expand_path('../mruby_config.rake', __FILE__)

# load MRuby's Rakefile
load MRuby::Source.path.join('Rakefile').to_s
