require 'spec_helper'
require 'version_reader'

describe VersionReader do

  subject do
    VersionReader.new(version_file)
  end

  context "version file exists" do
    let(:version_file) do
      File.expand_path('../../../VERSION', __FILE__)
    end

    its(:normal) { should =~ /\A\d\.\d\.\d\z/ }
  end

  context "version file does not exist" do
    let(:version_file) do
      'this-should-really-not-exist-' + rand.to_s
    end

    it "railses an VersionReader error" do
      expect { subject.normal }.to raise_error(VersionReader::FileError)
    end
  end

end
