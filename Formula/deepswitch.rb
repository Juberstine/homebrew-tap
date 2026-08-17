class Deepswitch < Formula
  desc "Safely switch Codex between OpenAI and DeepSeek"
  homepage "https://github.com/Juberstine/deepswitch"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.2/deepswitch-macos-aarch64.tar.gz"
      sha256 "3bee74167a0a7d20319812b7860bb58b09a7190c85e8a8340e0e32c969babef7"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.2/deepswitch-macos-x86_64.tar.gz"
      sha256 "1f48fdfd47979596583fe64136c02e581e7af42c23d74fd155e77a200e13990d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.2/deepswitch-linux-aarch64.tar.gz"
      sha256 "06a87e3e867461c08bd3dfe70e08881496447ccfa1f3b84af3a58d89e8a729cd"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.2/deepswitch-linux-x86_64.tar.gz"
      sha256 "7c204c5ee1c9e419e372ab48942a9c16dff0f435e91fd2a6b341b7867a559c31"
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
