class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.7.1/statac-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "606121eca5ec1271f8e99576610c72ba99c91e0c295d7ae633cbdb487451f8ab"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.1/statac-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "9a68435a7dfaecc838444851c78d550a22c9b2e1856f00994753c7cd775826ed"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.7.1/statac-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff7c988f53e9ea90ccb1298f6ad151b7de8f800a4ea04f08191582007685ae1a"
    end
    on_intel do
      url "https://get.statac.dev/v0.7.1/statac-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b876986480745c939558da7bb41bf8796ce3b04a91f44d519fd447c1af8039a"
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
