# Homebrew tap for Statac

Statac is a friendlier static site generator. This tap installs its
ready-built binary on macOS (Apple silicon and Intel) and Linux (x86-64
and arm64).

```sh
brew tap statac/statac https://git.statac.dev/statac/homebrew-statac
brew install statac
```

Later, `brew upgrade statac` brings the newest version.

The formula is `Formula/statac.rb`. It downloads the package for your
machine from `https://get.statac.dev` and checks it against the SHA-256
written in the formula.

The tap's home is `https://git.statac.dev/statac/homebrew-statac`. The
copy at `https://github.com/statac-ssg/homebrew-statac` is read-only, and
a tap added from it, as `brew install statac-ssg/statac/statac`, keeps
working. Statac's source, documentation and issues are at
`https://git.statac.dev/statac/statac`, not here.
