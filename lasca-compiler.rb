class LascaCompiler < Formula
  desc "Lasca is Scala shifted towards Haskell"
  homepage "http://lasca-lang.org"
  url "https://github.com/nau/lasca-compiler/releases/download/v0.0.2/lasca-0.0.2.tar.gz"
  sha256 "85b0be562e94ff28bcb2bc3aa2d3796ae6f02da9e13c44e5b331d2c47efedcd7"

  depends_on "bdw-gc" => :build
  depends_on "pcre2" => :build

  def install
    bin.install "bin/lasca"
    lib.install Dir["lib/*"]
    src = prefix/"src"
    src.install Dir["src/*"]
    bash_completion = prefix/"etc"/"bash_completion.d"
    bash_completion.install Dir["bash_completion/*"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test lasca-compiler`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
