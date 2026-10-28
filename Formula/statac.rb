class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.7.2/statac-0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "10d572e2c649180e4c6e411a1d58ce2d34d2be222a2d8146e99f7073b9cb4027"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.2/statac-0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "05ef92dc19d049cd51198862c040ddfc6eb5a5b9fa9b73808b73b90367af1b7f"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.7.2/statac-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "804f982d405f374bffa161b2952e435f17600bf46077357677a8a4f8ee639f2e"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.2/statac-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76941b9d108099026de7bba09475502f6e7a511865d8106864ac8d4414b43f7a"
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
