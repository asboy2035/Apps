class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # Look for the app bundle in the correct location after extraction
    app_path = Dir["Stand.app", "*/Stand.app", "**/Stand.app"].first

    if app_path.nil?
      # If the app wasn't found with the expected patterns, list the contents to debug
      ohai "Contents of the extracted archive:"
      system "ls", "-la"
      # Try to find any .app bundle as a fallback
      app_path = Dir["**/*.app"].first
    end

    # Verify we found something before installing
    if app_path.nil?
      raise "Could not find Stand.app in the downloaded archive"
    end

    prefix.install app_path
  end

  def caveats
    <<~EOS
      Stand has been installed to:
        #{opt_prefix}/Stand.app

      To link it to your Applications folder, run:
        ln -s #{opt_prefix}/Stand.app /Applications/Stand.app

      Or use a launcher like Raycast or Alfred for a more integrated experience. 💅
    EOS
  end

  test do
    assert_predicate opt_prefix/"Stand.app", :exist?, "Stand.app was not installed to the expected location"
  end
end