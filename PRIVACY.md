# Privacy

## Editor

Omawrite reads and saves documents locally. The editor has no telemetry, analytics, advertising, or sign-in. Opening a link hands its URL to the default application in Windows.

Omawrite stores preferences such as the last save directory, font, and zoom in local settings. A recovery copy of unsaved changes is kept in the app's local data directory and removed when the document is saved or discarded normally.

## Installation and build

The Setup EXE and portable ZIP contain the application files. When the install script runs from a source checkout without a local package, it contacts GitHub to download a portable ZIP from the Windows fork and verify its checksum. The build script may download Qt and Inno Setup to compile the app. [Windows release source](https://github.com/joaoguimaraens/omawrite-windows/releases)
