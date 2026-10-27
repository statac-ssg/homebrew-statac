class Statac < Formula
  desc "Friendlier static site generator for personal websites"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.7.0/statac-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "a4a6297a5279125dfe2d1a62308fd28b06a4a2b90522ff87c083d53f78aa4f38"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.0/statac-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "59fe3400fb0794c15dbd6b238812b57d38e8d752b54cabf8033a1708594548a8"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.7.0/statac-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58c5909e243361e3d0caba99b01cb2925f586c2359c2c1a776d7d8a0d3d11da1"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.0/statac-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caa41f78ce0e19135071684d3cbe37a4fadf35c58fcaf7a76f4c2b7e12f2d540"
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
    (testpath/"site/content/index.md").write "Hello.\n"
    cd "site" do
      system bin/"statac", "build"
    end
    assert_path_exists testpath/"site/_site/index.html"
  end
end
