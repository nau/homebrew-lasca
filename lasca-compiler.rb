# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class LascaCompiler < Formula
  desc "Lasca is Scala shifted towards Haskell."
  homepage "http://lasca-lang.org"
  url "https://github.com/nau/lasca-compiler/releases/download/latest/lasca-0.0.1.tar.gz"
  sha256 "02a73f534f5fe62ac007e8cae4ea47eaa77d4ad40877f34f85bb6f48219312b2"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV.prepend_create_path "LASCA_HOME", prefix
    # Remove unrecognized options if warned by configure
    bin.install "lasca"
    lib.install "liblascart.so"
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
