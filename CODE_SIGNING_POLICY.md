# Code signing policy

Omawrite's Windows binaries are currently unsigned. A SHA-256 file lets users check the bytes of a package against the value published for that release.

## Release artifacts

Build the portable ZIP and Setup EXE from the same public tag using this repository's Windows workflow. Publish a SHA-256 file alongside each package and preserve the artifacts produced by that build. Identify the corresponding `omacom/omawrite` version or commit in the release notes.

## Future signing

If signing is introduced, the project maintainers review signing requests after the tagged build completes. Sign the Omawrite executable and Setup EXE and preserve the signatures and attribution of bundled third-party binaries.
