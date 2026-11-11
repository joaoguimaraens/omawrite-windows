# Repository Guidelines

## Project Structure

Omawrite is a Windows Markdown editor built with C++17 and Qt Quick. `src/main.cpp` starts the application, `src/backend.*` handles documents and settings, and `src/markdownhighlighter.*` handles Markdown formatting. The editor UI lives in `src/Main.qml` and its QML components. Register new bundled files in `src/resources.qrc` and new C++ sources in `omawrite.pro` and, where applicable, `tests/tests.pro`.

`tests/` contains the Qt Test suite. `windows/` holds the build, install, and uninstall scripts, the Inno Setup definition, and Windows icons. Bundled fonts and their license live in `fonts/`. Windows CI is defined in `.github/workflows/windows.yml`.

## Build and Run

Use Windows 11 x64 and Visual Studio Build Tools 2022 with the C++ workload. Run the build from the repository root.

```powershell
.\build-windows.cmd
```

The script provisions Qt 6.8.3 and Inno Setup as needed, builds with qmake and NMAKE, runs the tests offscreen, and writes a portable ZIP and Setup EXE to `dist/`. Extract the ZIP and run `.\omawrite.exe .\document.md` from its folder. Keep generated `.build/`, `.tools/`, and `dist/` files out of commits.

## Coding Style

Match nearby code. Use four spaces for indentation in C++, QML, and PowerShell. Use PascalCase for C++ types and QML component filenames, lowerCamelCase for C++ methods and QML properties, and Verb-Noun names for PowerShell functions. Keep build and installer logic in `windows/`.

## Testing

Add focused regression cases in `tests/tst_omawrite.cpp` for behavior the existing suite misses. Name Qt Test slots after the behavior they check, such as `remembersLastSaveDirectory`. Use temporary files and isolated settings. Run the suite through `build-windows.cmd` and inspect `.build/windows/tests/results.txt` for failures. For packaging changes, open a Markdown file from the extracted ZIP and verify installation and removal on Windows.

## Commits and Pull Requests

Use short imperative subjects, such as `Fix default Qt toolchain detection`. In pull requests, describe the behavior change and Windows verification, link relevant issues, and include screenshots for visible UI changes when helpful. For release changes, follow the [Windows release verification steps](README.md#release-verification).

## Upstream Updates

`joaoguimaraens/omawrite-windows` is the Windows fork. `omacom/omawrite` is the upstream source for editor updates. Record the upstream tag or commit in update commits or pull requests and release notes. Follow the [upstream update procedure](README.md#upstream-updates).
