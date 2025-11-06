@echo off & setlocal EnableDelayedExpansion & (set "ARGS=" & for %%I in (%*) do set ARGS=!ARGS!'%%~I' ) & powershell.exe -ExecutionPolicy Bypass "$script = Get-Content '%~dpnx0'; $script -notmatch 'supercalifragilisticexpialidocious' | Out-File '%TEMP%\%~n0.ps1' -Force; Start-Process powershell.exe -Verb RunAs -ArgumentList ""-ExecutionPolicy Bypass -Command Set-Location '%~dp0'; & '%TEMP%\%~n0.ps1' !ARGS!""" & exit /b

<# Begin PowerShell Script #>
Write-Host "Hello, world!"
foreach ($arg in $args) {
    Write-Host $arg
}

Read-Host "Press Enter to exit"