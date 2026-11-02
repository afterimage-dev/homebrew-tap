cask "scootch" do
  version "1.4.0"
  sha256 "e4c08f0be80474656ac50bfef1e73c52138b7f4198ccfe7b04bd3b6557f9e3ad"

  url "https://getscootch.com/download/mac/#{version}"
  name "Scootch"
  desc "One keyboard and mouse for every computer on your desk"
  homepage "https://getscootch.com/"

  # What the download page shows as the latest version.
  livecheck do
    url "https://getscootch.com/api/release"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "Scootch.app"

  uninstall quit: "app.scootch.desktop"

  # Its settings and pairings, and start at login (here, not under uninstall: an upgrade runs those).
  zap trash: [
    "~/Library/Application Support/scootch",
    "~/Library/Caches/app.scootch.desktop",
    "~/Library/HTTPStorages/app.scootch.desktop",
    "~/Library/LaunchAgents/Scootch.plist",
    "~/Library/Preferences/app.scootch.desktop.plist",
    "~/Library/Saved Application State/app.scootch.desktop.savedState",
    "~/Library/WebKit/app.scootch.desktop",
  ]
end
