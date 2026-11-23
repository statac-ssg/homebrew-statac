class Statac < Formula
  desc "Friendlier static site generator"
  homepage "https://statac.dev"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://get.statac.dev/v0.8.2/statac-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "9b493b916df8cf718221753ac5b0ac31055abb1aa53fcb1343e99446ae0c80f3"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.2/statac-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "9d7838b0f44f3bb02851a19745022ad2a91dd73924ef14e478ee4f3377f67972"
    end
  end

  on_linux do
    on_arm do
      url "https://get.statac.dev/v0.8.2/statac-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4cfa468394968cbc9c86c9dfefe42bf40333f09e56123520d2d5599395d228f"
    end
    on_intel do
      url "https://get.statac.dev/v0.8.2/statac-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "977084a7208b1ecb9491217e60c631bef878d2c8dc8f2e93a995d4a3815c42ef"
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
