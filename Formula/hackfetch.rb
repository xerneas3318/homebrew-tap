class Hackfetch < Formula
  desc "Hack Club themed system fetch with Hackatime stats"
  homepage "https://github.com/xerneas3318/hackfetch"
  url "https://github.com/xerneas3318/hackfetch/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "173b3274f4544ab7c9b812f750b3d7dd3bb3cbb8935665038e6da8ce37ed2ea1"
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
