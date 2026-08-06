class Deepswitch < Formula
  desc "Safely switch Codex between OpenAI and DeepSeek"
  homepage "https://github.com/Juberstine/deepswitch"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.1.1/deepswitch-macos-aarch64.tar.gz"
      sha256 "c85137452f71d50f90685fad552f2f28d352a8cc46423872c0fa4e4b85c49979"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.1.1/deepswitch-macos-x86_64.tar.gz"
      sha256 "e40495e45044fdc60c946830ff227fa6efef91758db9388fdba8399b724be6bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.1.1/deepswitch-linux-aarch64.tar.gz"
      sha256 "e9103ae26ca643656536011da3402986c62d96c10a585944afbebf9bb5d51214"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.1.1/deepswitch-linux-x86_64.tar.gz"
      sha256 "cc27b33d574c2866d206f01afafae668ca167c39cdc991b8ac95b458c3ac2488"
    end
  end

  def install
    bin.install "deepswitch"
    bin.install_symlink "deepswitch" => "codex-deepseek-switcher"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deepswitch --version")
  end
end
