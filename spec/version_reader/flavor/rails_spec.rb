require 'spec_helper'
require 'version_reader/flavor/rails'

describe VersionReader::Flavor::Rails do

  subject do
    reader = mock()
    reader.should_receive(:version).and_return('0.4.2')
    reader.extend(VersionReader::Flavor::Rails)
  end

  [:test, :development, :staging, :production].each do |rails_env|
    it "adds #{rails_env} to the end of the version" do
      subject.env = rails_env
      subject.rails_env.should eq("0.4.2-#{rails_env}")
    end
  end

  it "does not add the specfied environment to the version" do
    subject.env = :production
    subject.rails_env_without(:production).should eq("0.4.2")
  end

  it "does not add the specfied environments to the version" do
    subject.env = :production
    subject.rails_env_without(:development, :production, :staging).should eq("0.4.2")
  end

end
