cask "mai-second-brain" do
  version "1.12"
  sha256 "c7633267f92fc8e06c478098534aa409ab11805f3a960daf4eb38199f5063bbc"

  url "https://fierlsebrtzlfmspduaq.supabase.co/storage/v1/object/public/downloads/mac/MAI-Mac-#{version}.dmg",
      verified: "fierlsebrtzlfmspduaq.supabase.co/storage/v1/object/public/downloads/"
  name "MAI Second Brain"
  desc "AI second brain: voice notes, meeting capture, system-wide dictation, and tasks"
  homepage "https://maicontext.com/mac"

  # The same Sparkle feed the app itself polls — `brew livecheck` reads the
  # newest version straight from it.
  livecheck do
    url "https://fierlsebrtzlfmspduaq.supabase.co/storage/v1/object/public/downloads/mac/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Sparkle updates the app in place, so brew shouldn't try to out-update it.
  auto_updates true
  depends_on macos: :sonoma

  app "MAI Second Brain.app"

  zap trash: [
    "~/Library/Application Support/SomaFlow",
    "~/Library/Caches/com.somaFlow.SomaFlowMac",
    "~/Library/HTTPStorages/com.somaFlow.SomaFlowMac",
    "~/Library/Preferences/com.somaFlow.SomaFlowMac.plist",
  ]
end
