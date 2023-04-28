$ymirFolderPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath "ymir"
if (!(Test-Path -Path $ymirFolderPath)) {
    New-Item -ItemType Directory -Path $ymirFolderPath
}

$ymirExeUrl = "https://github.com/ymirscript/ymir/releases/latest/download/ymir.exe"
$ymirExePath = Join-Path -Path $ymirFolderPath -ChildPath "ymir.exe"
Invoke-WebRequest -Uri $ymirExeUrl -OutFile $ymirExePath

$envPath = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::User)
if (!($envPath -split ";" -contains $ymirFolderPath)) {
    $newEnvPath = $envPath + ";" + $ymirFolderPath
    [Environment]::SetEnvironmentVariable("PATH", $newEnvPath, [EnvironmentVariableTarget]::User)
}