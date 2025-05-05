$projectDir = "D:\Development\cstrike_leak_original\cstrike15_src"
$search = '#include "../../src/public/vgui_controls/Controls.h"'

Write-Host "Dry run: checking for matches..." -ForegroundColor Cyan

Get-ChildItem -Path $projectDir -Recurse -Include *.cpp, *.h, *.c, *.hpp | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    if ($content -like "*$search*") {
        Write-Host "Match found in:" $_.FullName -ForegroundColor Yellow
    }
}