# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class LascaCompiler < Formula
  desc "Lasca is Scala shifted towards Haskell."
  homepage "http://lasca-lang.org"
  url "https://github.com/nau/lasca-compiler/releases/download/v0.0.1/lasca-0.0.1.tar.gz"
  sha256 "008f536ca0f31a5ac6be7c0faf7e93c157bf8f50fb43f2f8679a32aa9d9defb1"

  depends_on "boehmgc" => :build
  depends_on "pcre2" => :build
  depends_on "llvm@6" => :build

  def install
    # Remove unrecognized options if warned by configure
    bin.install "lasca"
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
