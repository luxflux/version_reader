require 'spec_helper'
require 'version_reader'

describe VersionReader do

  subject do
    VersionReader.new('VERSION')
  end

  context "version file exists" do
    before do
      File.should_receive(:read).with('VERSION').and_return("0.4.2\n")
    end

    its(:normal) { should eq('0.4.2') }

  end

  context "version file does not exist" do
    before do
      File.should_receive(:read).with('VERSION').and_raise(Errno::ENOENT)
    end

    it "raises an VersionReader error" do
      expect { subject.normal }.to raise_error(VersionReader::FileError)
    end

    it "returns an empty string if error raising has been disabled" do
      subject.raise_errors = false
      subject.normal.should eq('Versionfile VERSION not found')
    end

  end

end
