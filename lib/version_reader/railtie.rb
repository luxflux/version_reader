class VersionReader
  class Railtie < Rails::Railtie

    def version
      @version ||= VersionReader.new(File.join(Rails.root, 'VERSION'))
    end

  end
end
