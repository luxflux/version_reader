class VersionReader
  class Railtie < Rails::Railtie

    initializer "version_reader.add_app_version_variable" do |app|
      app.class.class_eval do
        attr_accessor :version
      end unless app.respond_to?(:version)
    end

    initializer "version_reader.set_app_version" do |app|
      app.version = VersionReader.new(File.join(::Rails.root, 'VERSION'))
      app.version.raise_errors = false
    end

  end
end
