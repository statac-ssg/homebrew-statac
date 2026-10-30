class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.7.3/statac-0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "063ce6a8c96e6c08e4fb8d3dffa1034f2dd97b467d7db785d94c1674b72ac975"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.3/statac-0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "b55c1d513d4af08d4f8cb3f94bd657f5b63ef593a04bc7fb7953efc3800dab79"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.7.3/statac-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe4b345978f94cb87a62e73a613bdaa1b39c5a42f003fb5b0f10908481283cf2"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.3/statac-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63c0ca6df9249d3561badc482910e5c5aae74498e6b2b6c55754f7f5c65f8644"
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
