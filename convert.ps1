# Liệt kê tất cả các repo công khai và chuyển thành riêng tư
$repos = gh repo list buddybaddog --visibility public --limit 100 | ForEach-Object { $_.Split(" ")[0] }

foreach ($repo in $repos) {
    gh repo edit $repo --visibility private
    Write-Host "Đã chuyển repository $repo thành riêng tư."
}