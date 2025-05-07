cask "stand" do
  version "3.5"
  sha256 "be8b6537d567502b3f857263bbea170f45f99894aae1a1e5e60a495bc943bbc1"

  url "https://github.com/asboy2035/Stand/releases/download/#{version}/Stand-#{version}-MAS.zip"
  name "Stand"
  desc "Keep track of sitting/standing time (standing desks)!"
  homepage "https://asboy2035.com/apps/stand"

  app "Stand.app"
end