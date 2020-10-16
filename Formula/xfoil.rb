# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Xfoil < Formula
  desc "XFOIL is an interactive program for the design and analysis of subsonic isolated airfoils."
  homepage "https://web.mit.edu/drela/Public/web/xfoil/"
  url "https://web.mit.edu/drela/Public/web/xfoil/xfoil6.99.tgz"
  sha256 "5c0250643f52ce0e75d7338ae2504ce7907f2d49a30f921826717b8ac12ebe40"
  license "GPL"

  depends_on "gcc" => :build
  depends_on "libx11"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "cp", "plotlib/config.make.gfortranDP", "plotlib/config.make"
    system "make", "-C", "plotlib"
    system "make", "-C", "bin", "-f", "Makefile_gfortran",
           "CHK=-fallow-argument-mismatch",
           "PLTLIB=-L/usr/local/lib -lX11",
           "BINDIR=#{prefix}/bin"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xfoil`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
