class VersionReader

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
  end

end
