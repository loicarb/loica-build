# Set some ENV variables for MRuby

## Build MRuby targets in ./build/mruby
ENV['MRUBY_BUILD_DIR'] = CURRENT_APPLICATION.root.join('build', 'mruby').to_s

## MRuby Targets config
ENV['MRUBY_CONFIG'] = File.expand_path('../mruby_config.rake', __FILE__)

# load MRuby's Rakefile
load File.expand_path('../../../../../vendor/mruby/Rakefile', __FILE__)
