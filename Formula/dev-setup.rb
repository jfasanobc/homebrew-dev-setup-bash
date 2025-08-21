class DevSetup < Formula
  desc "BCloud local environment setup script"
  homepage "https://github.com/jfasanobc/dev-setup-bash"
  url "https://github.com/jfasanobc/dev-setup-bash/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "6e9dbd95eb5041f03230d613de4b79084903553791201f799bd6c2cb1b23394b"
  license "MIT"

  depends_on "tmux"
  depends_on "gh"

  def install
    bin.install "mac_dev_setup.zsh" => "dev-setup"
    prefix.install "README.md" if File.exist?("README.md")
  end

  test do
    assert_match(/--install|-i|CHECK|INSTALL/i, shell_output("#{bin}/dev-setup 2>&1", 2))
  end
end
