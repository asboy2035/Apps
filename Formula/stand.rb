class Stand < Formula
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"
  url "https://github.com/asboy2035/Stand/releases/download/3.5/Stand-3.5-MAS.zip"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"
  license "Apache-2.0"

  def install
    # Move the .app bundle to the correct place in the Cellar
    app_path = Dir["**/*.app"].first
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