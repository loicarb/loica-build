# Loica framework build toolchain

[![Gem Version][gem-badge]][gem-url]
[![Build Status][ci-badge]][ci-url]
[![Dependency Status][dependencies-badge]][dependencies-url]
[![Code Quality][codequality-badge]][codequality-url]
[![Test Coverage][testcoverage-badge]][testcoverage-url]
[![Inline docs][docscoverage-badge]][docscoverage-url]

Crossbuild MRuby apps to multiple targets.

## Status: Experimental
Right now this is an experimental work so it's API is very likely to change.

The end goal is to eventually be able to develop multiplatform applications in MRuby with a simple build toolchain and a consistent API fostering code reuse.

## Concepts:
These are some basic concepts behind this build tool:

 * **Application**: The global project composed of at least one *target*
 * **Target**: MRuby crossbuild targeting a specific *platform*
 * **Fragment**: MRuby gem grouping a *fragment* of the *application* shared by one or more *targets*
 * **Platform**: MRuby toolchain setup for a specific *application platform* (like the iOS, Android or Web application platforms)

## Inspirations:

This project builds upon the work of these other projects:

 * **[MRuby](https://github.com/mruby/mruby/)**: Portable Ruby that can be cross-compiled!
 * **[WebRuby](https://github.com/xxuejie/webruby)**: Proved that MRuby can be compiled to asm.js.
 * **[MobiRuby](https://github.com/mobiruby/mobiruby-ios)**: Proved that MRuby can be compiled to iOS.
 * **[MRuby androideabi toolchain](https://github.com/mruby/mruby/blob/master/tasks/toolchains/androideabi.rake)**: Proved that MRuby can be compiled to Android.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loicarb/loica-build/issues.

[gem-url]: https://rubygems.org/gems/loica-build
[gem-badge]: https://badge.fury.io/rb/rom-repository.svg
[ci-url]: https://travis-ci.org/loicarb/loica-build
[ci-badge]: https://travis-ci.org/loicarb/loica-build.svg?branch=master
[codequality-url]: https://codeclimate.com/github/loicarb/loica-build
[codequality-badge]: https://codeclimate.com/github/loicarb/loica-build/badges/gpa.svg
[testcoverage-url]: https://codeclimate.com/github/loicarb/loica-build/coverage
[testcoverage-badge]: https://codeclimate.com/github/loicarb/loica-build/badges/coverage.svg
[docscoverage-url]: http://inch-ci.org/github/loicarb/loica-build
[docscoverage-badge]: http://inch-ci.org/github/loicarb/loica-build.svg?branch=master
[dependencies-url]: https://gemnasium.com/loicarb/loica-build
[dependencies-badge]: https://gemnasium.com/loicarb/loica-build.svg
