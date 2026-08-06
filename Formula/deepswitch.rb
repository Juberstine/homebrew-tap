class Deepswitch < Formula
  desc "Safely switch Codex between OpenAI and DeepSeek"
  homepage "https://github.com/Juberstine/deepswitch"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.1/deepswitch-macos-aarch64.tar.gz"
      sha256 "4b6d44be8c96c52d0764b31ce55cb974b7d40a4845bdb01e915bb7923a997377"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.1/deepswitch-macos-x86_64.tar.gz"
      sha256 "e8800335ee04adf6a02dd7d7fd1f7f1c4efc173dd497565d3242cdc2d80571d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.1/deepswitch-linux-aarch64.tar.gz"
      sha256 "24c910cec2a988f72f505ade374facffa6fe7416d56175709531f460e120c705"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.1/deepswitch-linux-x86_64.tar.gz"
      sha256 "9f3765dd809f8262f3ed03399412eb9c83518890bec20a03e05587484f9d671d"
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
