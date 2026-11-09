class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.8.1/statac-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "944d1d369eb93ea9ceddad2b9c907b16b1ece1cc702292b2a8a736627a98a048"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.1/statac-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "d3ec8f2a23443ab8714f930e1236496d87a83759359f0762853be823c82a1f5b"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.8.1/statac-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e11601f92f05587266c0fe51c0d9ca19262842e8be5fe3be432e5966bd0b55e"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.1/statac-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d087d082b882f8cdc2ca92fc201326dbf8e30755ae8c2baae09afc3cabb676be"
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
