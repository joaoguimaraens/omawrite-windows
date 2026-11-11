# Security

## Report a vulnerability

For a vulnerability in the Windows port or its installer, use the private reporting option in the Windows fork's **Security** tab when it is available. Otherwise, contact the Windows maintainer privately. Include the affected Omawrite version, Windows version, package type, observed impact, and minimal steps to reproduce. Use a synthetic document if the issue needs one. [Windows fork security](https://github.com/joaoguimaraens/omawrite-windows/security)

Use the Windows fork's issue tracker for ordinary bugs and feature requests. For vulnerabilities in the upstream editor, follow the upstream project's reporting instructions. [Windows issues](https://github.com/joaoguimaraens/omawrite-windows/issues) · [Upstream security](https://github.com/omacom/omawrite/security)

## Release integrity

For a published package, compare its SHA-256 hash with the companion checksum from the same release. Use `Get-FileHash -Algorithm SHA256` in PowerShell.
Windows can show a reputation warning for unsigned binaries. [Code signing policy](CODE_SIGNING_POLICY.md)
