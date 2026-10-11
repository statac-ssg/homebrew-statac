class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.2.0/statac-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "87494f2c47c1681ef99c00253f9c674afaaacbe5fe66768390028583a1f22442"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.2.0/statac-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c563cadaeac38713aca50c2491b8b536e37b9f6f0337800f6f35bec10716472b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.2.0/statac-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85430ff77e3326e278f6ef85cd2eb72aac414edba1a4241f62adf59853253b80"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.2.0/statac-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67e749d8bfd25df0aa4e57b97ced289fe5783454fa3c79570539726b49cab60c"
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
