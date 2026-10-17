class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.4.0/statac-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "81cc0c28c8e42061f094b417f49b284e1928bb0ad592d7135b12a4cd59cbc730"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.4.0/statac-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f6105db5dca6bc1d15cdd43180c1ddf72a7acf44dbc67bbc3ca695ec1b52dbb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.4.0/statac-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9416f6ad9ced05fbb4ceaee3790c799ac88332e416781ee4a31748d5e509da52"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.4.0/statac-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7feb72a1dad64a88383cea69e74ec2b6ec49ba16605a5b04566c6bdc5cc4c24b"
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
