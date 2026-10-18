class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.0/statac-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "9d6221a5158d36e0646dde7f3f2dd833f27ed7db4a29cdab86244c7f2ae41aa7"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.0/statac-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "94a59163fc2618f1db06362317547fbd6d0d2ba16d85f82ed00a007f4dcdfb92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.0/statac-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6013926981aab36fca116c42ab94b4c620c4c488fdd9f84f3a001a688bf171a3"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.5.0/statac-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f008872c7a597acbde3a978cda755746ba5f6c8916e6000b43a588371e6ff04f"
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
