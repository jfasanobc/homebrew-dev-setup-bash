class DevSetup < Formula
  desc "BCloud local environment setup script"
  homepage "https://github.com/jfasanobc/dev-setup-bash"
  url "https://github.com/jfasanobc/dev-setup-bash/archive/refs/tags/v2.0.1.tar.gz"
  version "2.0.1"
  head "https://github.com/jfasanobc/dev-setup-bash.git", branch: "main"
  sha256 "275014574d1d08f7acd88897ddd4d74c3d56f0c26fcb4929f5fe1cc7f128c72d"
  license "MIT"

  depends_on "tmux"
  depends_on "gh"

  def install
    bin.install "mac-cdvm-check.zsh" => "dev-setup"

    if build.head?
        (prefix/"VERSION").write Utils.git_short_head
    else
        (prefix/"VERSION").write version
    end

    prefix.install "README.md" if File.exist?("README.md")
  end


  test do
    assert_match(/--install|-i|CHECK|INSTALL/i, shell_output("#{bin}/dev-setup 2>&1", 2))
  end
end
