# auto-convert-repo
# Cài GitHub CLI
gh auth login
# Hiển thị repo
gh repo list buddybaddog --visibility public --limit 100
# Convert
foreach ($repo in $repos) {
  gh repo edit buddybaddog/$repo --visibility private --accept-visibility-change-consequences
  Write-Host "Đã chuyển repository buddybaddog/$repo thành riêng tư"
}
