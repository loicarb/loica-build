require 'spec_helper'

require 'fixtures/configuration_sample'

describe Loica::Build::Configuration do
  describe '#root' do
    it 'raises an error if the path is unknown' do
      expect{
        ConfigurationSample.new.root
      }.to raise_error(Loica::Build::Configuration::RootPathUnknownError)
    end

    it 'returns a Pathname object' do
      o = ConfigurationSample.new
      o.root = 'some/path/name'

      expect(o.root).to be_kind_of(Pathname)
    end
  end

  describe '#initialize' do
    it 'loads the root path automatically when loaded from a file' do
      o = ConfigurationSample.load_from('spec/fixtures/configuration_sample.rake')

      expect(o.root.to_s).to be_eql('spec/fixtures')
    end

    it 'yields it self when initialized' do
      check = false

      ConfigurationSample.new do |conf|
        check = true
        expect(conf).to be_kind_of(ConfigurationSample)
      end

      expect(check).to be(true)

    end
  end

  describe '#load_from' do
    it 'loads and instance of the class from file' do
      object = ConfigurationSample.load_from('spec/fixtures/configuration_sample.rake')

      expect(object).to be_kind_of(ConfigurationSample)
    end

    it 'raise an error if the file does not exists' do
      expect{
        ConfigurationSample.load_from('some/wrong/path.rake')
      }.to raise_error(Loica::Build::Configuration::FileNotFoundError)
    end

    it 'raises an error if the file does not return an instance of the class' do
      expect{
        ConfigurationSample.load_from('spec/fixtures/string.rake')
      }.to raise_error(Loica::Build::Configuration::TypeError)
    end
  end

  describe '.current_file' do
    it 'stores the file currently being loaded' do
      ConfigurationSample.on_new = lambda do
        expect(ConfigurationSample.current_file).to be_eql('spec/fixtures/configuration_sample.rake')
      end

      ConfigurationSample.load_from('spec/fixtures/configuration_sample.rake')
      ConfigurationSample.on_new = nil
    end
  end

  describe '.loading?' do
    it 'is true while it loads a file' do
      ConfigurationSample.on_new = lambda do
        expect(ConfigurationSample).to be_loading
      end

      ConfigurationSample.load_from('spec/fixtures/configuration_sample.rake')

      ConfigurationSample.on_new = nil
    end

    it 'is false when it is not loading a file' do
      expect(Loica::Build::Configuration).not_to be_loading
    end
  end
end
