require 'spec_helper'
require 'version_reader'

describe VersionReader do

  context "version file exists" do
    before do
      File.should_receive(:read).with('VERSION').and_return("0.4.2\n")
    end

    subject do
      VersionReader.new('VERSION')
    end

    its(:normal) { should eq('0.4.2') }

  end

end
