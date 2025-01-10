# auto-convert-repo
# Cài GitHub CLI
gh auth login
# Hiển thị repo
gh repo list fairlywell --visibility public --limit 100
# Convert
$repos = gh repo list fairlywell --visibility public --json name -q ".[].name"
# Convert
foreach ($repo in $repos) {
    $fullRepo = "fairlywell/$repo" # Nối tên owner với repo
    gh repo edit $fullRepo --visibility private --accept-visibility-change-consequences
    Write-Host "Đã chuyển repository $fullRepo thành riêng tư"
}
