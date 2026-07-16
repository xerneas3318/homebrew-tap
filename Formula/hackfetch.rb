class Hackfetch < Formula
  desc "Hack Club themed system fetch with Hackatime stats"
  homepage "https://github.com/xerneas3318/hackfetch"
  url "https://github.com/xerneas3318/hackfetch/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "af2a2311c1ff9793eb92d19d41df896cab841250bf7e33ab7d7390cbd6ed1324"
  license "PolyForm-Noncommercial-1.0.0"
  head "https://github.com/xerneas3318/hackfetch.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/hackfetch -list")
    assert_match "hackclub", output
  end
end
