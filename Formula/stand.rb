class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # List all files to see what's in the archive
    ohai "Contents of the extracted archive:"
    system "ls", "-la"

    # The MAS version might have a different structure
    # Try to find the app regardless of its exact location
    app_paths = Dir["**/*.app"]

    if app_paths.empty?
      # If no .app bundle is found, check for a Stand directory
      stand_dirs = Dir["**/Stand*"]
      ohai "Found potential Stand directories: #{stand_dirs.join(', ')}" unless stand_dirs.empty?

      if stand_dirs.empty?
        raise "Could not find Stand.app or any Stand directory in the downloaded archive"
      else
        # Create a simple app wrapper if necessary
        stand_dir = stand_dirs.first
        ohai "Using Stand directory: #{stand_dir}"

        # Move the directory to a .app bundle if it's not already one
        unless stand_dir.end_with?(".app")
          app_name = "Stand.app"
          mkdir_p app_name
          cp_r "#{stand_dir}/.", app_name
          app_paths = [app_name]
        end
      end
    else
      ohai "Found app paths: #{app_paths.join(', ')}"
    end

    if app_paths.empty?
      # Still no app found after our attempts
      raise "Could not find or create Stand.app in the downloaded archive"
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
        #{opt_prefix}/#{File.basename(Dir["#{opt_prefix}/*.app"].first || "Stand.app")}

      To link it to your Applications folder, run:
        ln -s "#{opt_prefix}/#{File.basename(Dir["#{opt_prefix}/*.app"].first || "Stand.app")}" "/Applications/Stand.app"
    EOS
  end

  test do
    app_path = Dir["#{opt_prefix}/*.app"].first || "#{opt_prefix}/Stand.app"
    assert_predicate Pathname.new(app_path), :exist?, "Stand.app was not installed to the expected location"
  end
end