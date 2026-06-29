class Neurozip < Formula
  include Language::Python::Virtualenv

  desc "Task-aware neural compression for brain/biomedical signals"
  homepage "https://github.com/xerneas3318/NeuroZip"
  url "https://github.com/xerneas3318/NeuroZip/releases/download/v1.0.0/neurozip-1.0.0.tar.gz"
  sha256 "433cf7cb7dd03da735b0723268cecc08cbe9fbb48b13c95c4342ac970d70f18a"
  license "PolyForm-Noncommercial-1.0.0"
  head "https://github.com/xerneas3318/NeuroZip.git", branch: "model-testing"

  depends_on "python@3.12"

  # Core install is stdlib-only (CLI + UI shell). Real inference needs the `ml` extra
  # (pip install "neurozip[ml]") and the model bundle (`neurozip download`).
  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "neurozip", shell_output("#{bin}/neurozip --version")
  end
end
