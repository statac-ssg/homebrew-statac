class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.8.0/statac-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "d39cda9e9c1abd4145c90b0aed8afbb0cf0f9c14982d9b1dfa4832d50067a671"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.0/statac-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "1c943906504d614391761d2cff05353cd1c9d7d465f8d63db604e8d0a2affa8e"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.8.0/statac-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0d133e6e8320ae750011816f4f19360938e7c7d2dbb3cc0db33ebafa841f03c"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.0/statac-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f1fb2638bcd3ab220a8e521a309885a7d8a4c3d0d77b34051548570afa30612"
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
