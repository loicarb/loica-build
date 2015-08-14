require 'spec_helper'

require 'fixtures/load_from_file_sample'

describe Loica::Build::Utils::LoadFromFile do
  describe '#load_from' do
    it 'loads and instance of the class from file' do
      object = LoadFromFileSample.load_from('spec/fixtures/load_from_file_sample.rake')

      expect(object).to be_kind_of(LoadFromFileSample)
    end

    it 'raise an error if the file does not exists' do
      expect{
        LoadFromFileSample.load_from('some/wrong/path.rake')
      }.to raise_error(Loica::Build::Utils::LoadFromFile::FileNotFoundError)
    end

    it 'raises an error if the file does not return an instance of the class' do
      expect{
        LoadFromFileSample.load_from('spec/fixtures/load_from_file_string.rake')
      }.to raise_error(Loica::Build::Utils::LoadFromFile::TypeError)
    end
  end

  describe '.current_file' do
    it 'stores the file currently being loaded' do
      LoadFromFileSample.on_new = lambda do
        expect(Loica::Build::Utils::LoadFromFile.current_file).to be_eql('spec/fixtures/load_from_file_sample.rake')
      end

      LoadFromFileSample.load_from('spec/fixtures/load_from_file_sample.rake')
      LoadFromFileSample.on_new = nil
    end
  end

  describe '.loading?' do
    it 'is true while it loads a file' do
      LoadFromFileSample.on_new = lambda do
        expect(Loica::Build::Utils::LoadFromFile).to be_loading
      end

      LoadFromFileSample.load_from('spec/fixtures/load_from_file_sample.rake')

      LoadFromFileSample.on_new = nil
    end

    it 'is false when it is not loading a file' do
      expect(Loica::Build::Utils::LoadFromFile).not_to be_loading
    end
  end
end
