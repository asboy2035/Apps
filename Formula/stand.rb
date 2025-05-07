class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # Unzip to the build directory first
    system "unzip", cached_download, "-d", buildpath

    # Define app paths
    app_name = "Stand"
    app_path = buildpath/"Stand.app"
    target_path = "/Applications/Stand.app"

    # Quit old version if running (uses bundle ID for accurate matching)
    app_bundle_id = "ash.Stand"
    if system("pgrep", "-f", app_bundle_id)
      ohai "Quitting the running version of Stand..."
      system "osascript", "-e", %(tell application "#{app_name}" to quit)
    end

    # Replace old version if it exists
    if File.exist?(target_path)
      opoo "An older version of Stand is already installed in /Applications. Replacing it..."
      system "rm", "-rf", target_path
    end

    # Move the new version to /Applications
    system "mv", app_path, target_path
    ohai "Stand has been moved to /Applications."
  end

  test do
    # Verify that the .app was successfully installed to /Applications
    assert_predicate Pathname("/Applications/Stand.app"), :exist?, "Stand.app was not installed to /Applications"
  end
end