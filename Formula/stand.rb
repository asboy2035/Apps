class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # List all files to see what's in the archive
    ohai "Contents of the extracted archive:"
    system "find", ".", "-type", "f", "-o", "-type", "d"

    # Try different patterns to find the app bundle
    app_paths = Dir["./*.app", "**/*.app", "*/Stand.app", "**/Stand.app"]

    ohai "Found app paths: #{app_paths.join(', ')}" unless app_paths.empty?

    if app_paths.empty?
      # No recognized app format found
      raise "Could not find Stand.app or any recognizable app format in the downloaded archive"
    else
      # Install the first app found
      app_path = app_paths.first
      ohai "Installing app: #{app_path}"
      prefix.install app_path
    end
  end

  def caveats
    <<~EOS
      Stand has been installed to:
        #{opt_prefix}/Stand.app

      To link it to your Applications folder, run:
        ln -s #{opt_prefix}/Stand.app /Applications/Stand.app
    EOS
  end

  test do
    assert_predicate opt_prefix/"Stand.app", :exist?, "Stand.app was not installed to the expected location"
  end
end
