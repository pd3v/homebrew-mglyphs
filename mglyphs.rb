class Mglyphs < Formula
  desc "Lists a set of scales, modes and their respective MIDI values based on user's scale key/octave input."
  homepage "https://github.com/pd3v/mglyphs"
  url "https://github.com/pd3v/mglyphs.git",
  tag: "v0.2",
  revision: "969b71a30bdbca2aa217bffaf0e976e86b8f3984"

  sha256 "4ed19c9ab1911b5d0ad99f524c08078444949e49814bb07a158febacd653f8d1"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "mkdir", "build"
    system "mkdir", "bin"
    system "cmake", "-S", ".", "-B", "build/", *std_cmake_args
    system "make", "-C", "build/"

    on_macos do
      lib.install "build/externals/diatonic/libdiatonic.dylib"
    end
    on_linux do
      lib.install "build/externals/diatonic/libdiatonic.so"
    end
    
    bin.install "build/mglyphs"
    ohai("mglyphs installed. Keep playing in tune ... or not!")
  end
end
