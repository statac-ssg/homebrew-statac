class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.1.0/statac-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca36e65b840bb4c88df33af68c8b552dea661fe83917a7983f74af5871f89887"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.1.0/statac-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "463cd8f6d4bb18506a661b87680722e73c8ff0f14fd2ff9e6989e71a0be6c6da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.1.0/statac-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "518183aa227ee2354b5de3dffd307609a04fdc2f72aa75d5fba3c66515828662"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.1.0/statac-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bda81064e4065fef6aea993fe5254c14fe185d78a2e2c79de584440b81a3d0ce"
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
