require 'spec_helper'

class Loica::Build::Platforms::Test < Loica::Build::Platform
end

describe Loica::Build::Platform do
  describe '.build' do
    it 'accepts a symbol reference to the platform name' do
      platform = Loica::Build::Platform.build(:Test)

      expect(platform).to be_kind_of(Loica::Build::Platforms::Test)
    end

    it 'can receive a platform object' do
      platform = Loica::Build::Platforms::Test.new
      platform2 = Loica::Build::Platform.build(platform)

      expect(platform2).to be_equal(platform)
    end
  end
end
