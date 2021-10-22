#!/usr/bin/env pwsh
$deinDirectoryName = 'dein'
$deinInstallerURL = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'

$editorConfigGitRepository = 'https://github.com/editorconfig/editorconfig-core-c.git'

function Install-EditorConfig () {
    git clone $editorConfigGitRepository /tmp/editorconfig
    New-Item -Path /tmp/editorconfig/build -Name build -ItemType Directory
    Push-Location /tmp/editorconfig/build
    cmake ..
    make
    sudo make install
    Pop-Location

    # Create library ldconfig
    if ($IsLinux) {
        Write-Output "/usr/local/lib64/" | sudo tee /etc/ld.so.conf.d/editorconfig.conf
        sudo ldconfig
    }
}

# Install dein
curl -o - $deinInstallerURL | bash -s -- $deinDirectoryName

# Install editorconfig
Install-EditorConfig

# Make undo directory
$undoDirectory = $(Join-Path $PSScriptRoot -ChildPath "tmp" | Join-Path -ChildPath "undo")
if (-Not (Test-Path -Path $undoDirectory)) {
    New-Item -Path $undoDirectory -Type Directory
}

exit 0
