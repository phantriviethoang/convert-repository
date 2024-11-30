foreach ($repo in $repos) {
  gh repo edit buddybaddog/$repo --visibility private --accept-visibility-change-consequences
  Write-Host "Đã chuyển repository buddybaddog/$repo thành riêng tư"
}
