# Set strict mode
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Ensure DEV_ENV is set
$env:DEV_ENV = "$HOME\dev"
Write-Output "DEV_ENV set to $env:DEV_ENV"

# Ensure required dependencies are installed
$dependencies = @("git", "curl")

foreach ($dep in $dependencies) {
    if (-Not (Get-Command $dep -ErrorAction SilentlyContinue)) {
        Write-Output "$dep not found. Installing..."
        choco install $dep -y
    } else {
        Write-Output "$dep is already installed."
    }
}

# Fetch and execute setup script
Write-Output "Downloading and executing setup script..."
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup')

Write-Output "Setup completed successfully!"

