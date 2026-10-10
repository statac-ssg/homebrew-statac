# Homebrew tap for Statac

Statac is the friendly static site generator. This tap installs its
ready-built binary on macOS (Apple silicon and Intel) and Linux (x86-64 and
arm64).

```sh
brew install statac-ssg/statac/statac
```

Later, `brew upgrade statac` brings the newest version.

The formula is `Formula/statac.rb`. It downloads the package for your
machine from the releases of `https://github.com/statac-ssg/statac` and
checks it against the SHA-256 written in the formula. Statac's source,
documentation and issues are in that repository, not this one.
