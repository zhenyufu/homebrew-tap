class Spacelight < Formula
  desc "Spotlight-style workspace and window switcher for AeroSpace"
  homepage "https://github.com/zhenyufu/spacelight"
  url "https://github.com/zhenyufu/spacelight.git",
      tag:      "v0.1.0",
      revision: "90c358f43db2f3d6d1ca611eeccaee68e40892ac"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/Spacelight" => "spacelight"
  end

  def post_install
    system bin/"spacelight", "quit" if (var/"run/spacelight").exist?
  end

  test do
    assert_match "spacelight", shell_output("#{bin}/spacelight --help 2>&1", 1)
  end
end
