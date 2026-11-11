@echo off
setlocal
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows\install.ps1"
if errorlevel 1 (
  echo.
  echo Omawrite installation failed. Review the message above.
  pause
  exit /b 1
)
endlocal
