class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.1/statac-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c9a59a217816a909b5e2eca564862c19fda71c75a2802fdd4c581d2957dc0a4"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.1/statac-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "ebc9f8eb55b96e7ae1670bee1a1f44164e23dc541c919497fa374af36a5114ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.1/statac-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d10fa9599f2550c2c760bfecaa7bedc58cb5a43df12d4072f2a3897b3f43fcd"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.1/statac-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e7e2a7c962fb2923dd9c93b048bc819e34c9f5f6edf81c70843a5f6779b7a02"
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
