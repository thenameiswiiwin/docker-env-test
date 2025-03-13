Write-Host "Downloading and running setup script..."
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup" -OutFile "$HOME\setup.ps1"
powershell.exe -ExecutionPolicy Bypass -File "$HOME\setup.ps1"
Write-Host "Setup script completed!"
cmd.exe
