# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class LascaCompiler < Formula
  desc "Lasca is Scala shifted towards Haskell."
  homepage "http://lasca-lang.org"
  url "https://github.com/nau/lasca-compiler/releases/download/latest/lasca-0.1.0.tar.gz"
  sha256 "29c5d746d645c957a005ba18d7c3bf8fc9f26eb77d3efe515b2465f6a665836a"

  # depends_on "cmake" => :build

  def install
    # Remove unrecognized options if warned by configure
    bin.install "lasca"
    lib.install "liblascart.a"
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
