class Deepswitch < Formula
  desc "Safely switch Codex between OpenAI and DeepSeek"
  homepage "https://github.com/Juberstine/deepswitch"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.0/deepswitch-macos-aarch64.tar.gz"
      sha256 "5afad672ea44a2690672cd52155635600d31edae09b4878aaeed165a81f6165d"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.0/deepswitch-macos-x86_64.tar.gz"
      sha256 "76b8af2035821cf00c851511af5381262ffccd1ab5ee502d8c6c78fcff4f04c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.0/deepswitch-linux-aarch64.tar.gz"
      sha256 "d9030fad4814c8515795f20b2c4be9ddc9c48e70499b88f922a84e41ab84ec2a"
    else
      url "https://github.com/Juberstine/deepswitch/releases/download/v0.2.0/deepswitch-linux-x86_64.tar.gz"
      sha256 "f4a9d835def3330954ab80ba85c5b23edc759afe1e3046509b4bd6b9277514d3"
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
