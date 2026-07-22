class Hackfetch < Formula
  desc "Hack Club themed system fetch with Hackatime stats"
  homepage "https://github.com/xerneas3318/hackfetch"
  url "https://github.com/xerneas3318/hackfetch/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "ec4cc44232f806aa680b56c5c87ea6eb1829e047dca20ae0c5b3bcdd9a22b7ca"
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
