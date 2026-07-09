class Rumble < Formula
  desc "RumbleDB 2.1.0 'Cedrus Libani' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v2.1.0/rumbledb-2.1.0-brew.zip"
  sha256 "250b9a79e6fed34c595f75bb60d786b366e335c361169d1447538442fd32f29b"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "apache-spark"

  def install
    libexec.install "jars", "bin"

    chmod 0755, libexec/"bin/rumbledb"

    inreplace libexec/"bin/rumbledb", /^export JAVA_HOME=.*$/, ""

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin",
      Language::Java.overridable_java_home_env("17").merge(SPARK_HOME_BIN: Formula["apache-spark"].bin))
  end

  test do
    assert_match "2", shell_output("#{bin}/rumbledb -q '1+1'")
  end
end
