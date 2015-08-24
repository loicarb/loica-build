require 'spec_helper'

describe Loica::Build::Toolchains::AndroidNDK::Architecture do
  describe "#initialize" do
    it "requires a valid architecture" do
      expect{
        described_class.new({arch: 'wrong-arch'})
      }.to raise_error(ArgumentError)

      expect{
        described_class.new({arch: 'armeabi'})
      }.not_to raise_error(ArgumentError)
    end

    it "requires a valid toolchain" do
      expect{
        described_class.new({arch: 'armeabi'})
      }.not_to raise_error(ArgumentError)

      expect{
        described_class.new({arch: 'armeabi', toolchain: :clang})
      }.not_to raise_error(ArgumentError)

      expect{
        described_class.new({arch: 'armeabi',toolchain: :wrong})
      }.to raise_error(ArgumentError)
    end

  end
end
