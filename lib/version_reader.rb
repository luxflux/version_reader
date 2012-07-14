class VersionReader

  class FileError < RuntimeError; end

  attr_accessor :raise_errors
  attr_accessor :no_version_string

  def initialize(version_file)
    @version_file = version_file
    @raise_errors = true
    @no_version_string = "Versionfile #{@version_file} not found"
  end

  def normal
    version
  end

  private
  def version
    @version ||= read_version.strip
  end

  def read_version
    File.read(@version_file)
  rescue Errno::ENOENT => @error
    handle_error
  end

  def handle_error
    if @raise_errors
      raise VersionReader::FileError, @error.to_s
    else
      @no_version_string
    end
  end

end

require 'version_reader/railtie' if defined?(Rails)

