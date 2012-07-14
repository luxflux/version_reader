class VersionReader

  class FileError < RuntimeError; end

  def initialize(version_file)
    @version_file = version_file
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
  rescue Errno::ENOENT => error
    raise VersionReader::FileError, error.to_s
  end

end

require 'version_reader/railtie' if defined?(Rails)

