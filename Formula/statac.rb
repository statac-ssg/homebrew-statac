class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.0/statac-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "42b17f51825c98137189db1b84476cd0bc0a8b4a66b449f9b6c6eb459a3ba690"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.0/statac-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "decc2e3ea53bc52b7c86424f776346f8931a0d364fec24859a2984c5f47687a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.0/statac-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc6ab193bf878a290cc7fff72c11a9fac9dc75902e1b0f5a1b10c96765747976"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.0/statac-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0969e350797f9928f2dd35f6a72ce942b405bb8c6f0ef45a3f51d985bf94aab6"
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
