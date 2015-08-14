require 'spec_helper'

describe Loica::Build::Application do
  subject{ Loica::Build::Application.load_from("sample/application.rake") }

  describe "#target" do
    it "loads a target with the given name" do
      expect(subject.target('ios')).to be_kind_of(Loica::Build::Target)
    end

    it "sets the target's application" do
      expect(subject.target('ios').application).to be_equal(subject)
    end

    it "raises an error if the target config is invalid" do
      expect{subject.target('wrong-target')}.to raise_error(Loica::Build::Target::FileNotFoundError)
    end
  end

  describe "#targets" do
    it "loads all the application targets" do
      expect(subject.targets).not_to be_empty
    end
  end
end
