require 'spec_helper'

describe Loica::Build::Target do
  describe "#platform" do
    it "raises an error when unknown" do
      expect{
        Loica::Build::Target.new.platform
      }.to raise_error(Loica::Build::Target::PlatformUnknownError)
    end
  end

  describe "#application" do
    it "raises an error when unknown" do
      expect{
        Loica::Build::Target.new.application
      }.to raise_error(Loica::Build::Target::ApplicationUnknownError)
    end
  end
end
