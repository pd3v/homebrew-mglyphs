class Mglyphs < Formula
  desc "Lists a set of scales, modes and their respective MIDI values based on user's scale key/octave input."
  homepage "https://github.com/pd3v/mglyphs"
  url "https://github.com/pd3v/mglyphs.git", #, :using => :git, :branch => :main
  tag: "v0.1",
  #revision: "83808b98ffd224b55c91401984e4200333e39e10"
  #revision: "2feb98a86d66d0d762c58d0b3e106b7b0adfa679"
  #revision: "cdc7a67c4c8c9686e2e238be5b20b26743172f40"
  revision: "969b71a30bdbca2aa217bffaf0e976e86b8f3984"

  #sha256 "4ed19c9ab1911b5d0ad99f524c08078444949e49814bb07a158febacd653f8d1"
  license "MIT"

  depends_on "cmake" => :build
  #depends_on "diatonic" => :build

  def install
    #system "./configure", "--disable-silent-rules", *std_configure_args
    system "mkdir", "build"
    system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/", *std_cmake_args
    system "make", "-C", "build/"
    #system "make", "install"
    lib.install "build/externals/diatonic/libdiatonic*"
    bin.install "build/mglyphs"
    ohai("mglyphs installed. Keep playing in key ... or don't!")
  end
end
