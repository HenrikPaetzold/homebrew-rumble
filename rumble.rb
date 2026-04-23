class Rumble < Formula
  desc "RumbleDB 2.1.0 'Cedrus Libani' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v2.1.0/rumbledb-2.1.0-brew.zip"
  sha256 "250b9a79e6fed34c595f75bb60d786b366e335c361169d1447538442fd32f29b"
  license "MIT"

  depends_on "apache-spark"

  def install
    lib.install Dir["*"]
    bin.install Dir[lib/"bin/*"]
    bin.env_script_all_files(lib/"bin", SPARK_HOME_BIN: Formula["apache-spark"].bin)
  end

  test do
    assert_match "2",
      pipe_output(bin/"rumbledb -q '1+1'")
  end
end
