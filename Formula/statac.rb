class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.2/statac-0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "71392f9bbb61fb2fd396d8fc44051299afc6ba240314f443362d775cbc9e56e9"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.2/statac-0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "8304648644195287cba2703e410f6b26829452428eb895b2569d98fe0158fc6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.2/statac-0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cda2defd7f78f92b065786290d5d8798a91da2a3be223baa0761628eb452777"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.2/statac-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b094a22c33a888f49617062aab407ea228f44c442d3857325102d4405110d7a"
    end
  end

  def install
    bin.install "statac"
    # Homebrew keeps the two licences itself; these are the other files
    # that have to travel with the binary.
    prefix.install "THIRD-PARTY.md", "THIRD-PARTY-GRAMMARS.md"
  end

  test do
    system bin/"statac", "new", "site", "--yes"
    cd "site" do
      system bin/"statac", "build"
    end
    assert_path_exists testpath/"site/_site/index.html"
  end
end
