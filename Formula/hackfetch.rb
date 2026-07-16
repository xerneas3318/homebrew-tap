class Hackfetch < Formula
  desc "Hack Club themed system fetch with Hackatime stats"
  homepage "https://github.com/xerneas3318/hackfetch"
  url "https://github.com/xerneas3318/hackfetch/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "79b3a89bcdd05bf80de4aafb0536d079879cd687b7dfe5bd0bf3528120fa9d37"
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
