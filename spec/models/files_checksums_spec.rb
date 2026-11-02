require "spec_helper"

describe "FilesChecksums" do
  def assert_checksum(expected, filename)
    filepath = Rails.root.join(filename)
    checksum = Digest::MD5.hexdigest(File.read(filepath))
    assert checksum.in?(Array(expected)), "Bad checksum for file: #{filename}, local version should be reviewed: checksum=#{checksum}, expected=#{Array(expected).join(" or ")}"
  end

  it "ensures the project patch file is up to date" do
    # 6.1.6, 7.0.3 and trunk checksums (the self.allowed_to_condition method is completely overridden and should be reviewed if this test breaks)
    assert_checksum %w(2eaaee29da4d7f107041eb980d5e2758 fed61ab1b799547ed620f7eab1383f0a), "app/models/project.rb"
  end

end
