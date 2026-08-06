class CodexDeepseekSwitcher < Formula
  desc "Safely switch Codex between OpenAI and DeepSeek"
  homepage "https://github.com/Juberstine/codex-deepseek-switcher"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/codex-deepseek-switcher/releases/download/v0.1.0/codex-deepseek-switcher-macos-aarch64.tar.gz"
      sha256 "370ef7bf0628969925e5e7a7fe19cc3e5de399d0d94ea271ec73ee048fde4104"
    else
      url "https://github.com/Juberstine/codex-deepseek-switcher/releases/download/v0.1.0/codex-deepseek-switcher-macos-x86_64.tar.gz"
      sha256 "32e9da592a83d09f716be35c1b8cbd8cc0063e2f6889813d7720f3d601d1d6ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Juberstine/codex-deepseek-switcher/releases/download/v0.1.0/codex-deepseek-switcher-linux-aarch64.tar.gz"
      sha256 "80f9cff09936057972f4aca6b1e86a7de980be92cb69673ba51b09ae4f5c91e5"
    else
      url "https://github.com/Juberstine/codex-deepseek-switcher/releases/download/v0.1.0/codex-deepseek-switcher-linux-x86_64.tar.gz"
      sha256 "632082976ac5c310a40e89b97238640168e30dd292311fe4cacff4a75d602ff6"
    end
  end

  def install
    bin.install "codex-deepseek-switcher"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex-deepseek-switcher --version")
  end
end
