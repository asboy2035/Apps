class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # Unzip the app and move it to the correct location
    system "unzip", "Stand-3.5-MAS.zip"
    prefix.install "Stand.app"
    bin.install_symlink prefix/"Stand.app/Contents/MacOS/Stand"
  end

  test do
    # Test if the app exists by attempting to open it (macOS-specific)
    system "open", "#{prefix}/Stand.app"
  end
end
