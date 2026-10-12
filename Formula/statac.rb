class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.3.0/statac-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "09a49504f42d1f61249cf3dd4bf5ff489db7f95cdbbcc3971c8e06dc8ceb13b8"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.3.0/statac-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ac48a118734a07809a5fbf615767ed9b34e60be391b41bfbac9e1601641123dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.3.0/statac-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0e664c8584b9cd4595026f072c44c0a95d2722da8e53986033c94131c11bc3b"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.3.0/statac-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "547ba9adc5e3d12dd8de4af3a61e2139c4ffd64ac896f2f6f20f854acea185a2"
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
