class Xfoil < Formula
  desc "Interactive program for the design and analysis of subsonic isolated airfoils"
  homepage "https://web.mit.edu/drela/Public/web/xfoil/"
  url "https://web.mit.edu/drela/Public/web/xfoil/xfoil6.99.tgz"
  sha256 "5c0250643f52ce0e75d7338ae2504ce7907f2d49a30f921826717b8ac12ebe40"
  license "GPL-2.0-or-later"

  depends_on "gcc" => :build
  depends_on "libx11"

  def install
    bin.mkpath
    doc.mkpath
    cp "plotlib/config.make.gfortranDP", "plotlib/config.make"
    system "make", "-C", "plotlib"
    system "make", "-C", "bin", "-f", "Makefile_gfortran",
           "CHK=-fallow-argument-mismatch",
           "PLTLIB=-L/usr/local/lib -lX11",
           "BINDIR=#{bin}"
    doc.install "README", "sessions.txt", "version_notes.txt", "xfoil_doc.txt"
  end

  test do
    system "false"
  end
end
