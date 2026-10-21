class Statac < Formula
  desc "Friendly static site generator"
  homepage "https://github.com/statac-ssg/statac"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.1/statac-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "a755092eb79b104b2b83475bf9b55dd8b9bdff1aabd6d92614d77ef46414308a"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.1/statac-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "d4e0143dc7ac468b529f0de284564a3db50ba27a79498b6a5b9cc44f96354325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.1/statac-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a755951e2165ab8d0f01f2cf022866c3a0de8a4fa5f5802ada23b7f58df844f"
    end
    on_intel do
      url "https://github.com/statac-ssg/statac/releases/download/v0.6.1/statac-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d46f511ff600e48ddaa6d5bd45a81ba36d3ce32ff0b9768d86d28835a21a2129"
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
