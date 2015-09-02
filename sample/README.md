# Sample Project.

This is a sample build project with Android, iOS, and Web compile targets.

## Usage

Install dependent toolchains if needed:
```
# Android NDK for android target
brew install android-ndk

# Emscripten for web target
brew install emscripten

# iOS SDK for iOS target
xcode-select --install
```

Install required gems
```
bundle install
```

Build the project
```
bundle exec rake
```
