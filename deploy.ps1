# 클위너 서바이버 — 최초 1회 배포 스크립트 (커스텀 도메인 game.clewiner.com 포함)
# 실행: powershell -ExecutionPolicy Bypass -File C:\dev\repos\clewiner-survivor\deploy.ps1
Set-Location C:\dev\repos\clewiner-survivor
gh repo create clewiner-survivor --public --source . --push
gh api -X POST repos/workpark224-bit/clewiner-survivor/pages -f "source[branch]=master" -f "source[path]=/"
gh api -X PUT repos/workpark224-bit/clewiner-survivor/pages -f "cname=game.clewiner.com"
Write-Host ""
Write-Host "배포 완료. 임시 주소 (1~2분 뒤):"
Write-Host "  https://workpark224-bit.github.io/clewiner-survivor/"
Write-Host ""
Write-Host "game.clewiner.com 을 살리려면 DNS에 아래 레코드 추가 (카페24 도메인 관리):"
Write-Host "  종류: CNAME / 호스트: game / 값: workpark224-bit.github.io"
Write-Host "추가 후 몇 분~수십 분 내 https://game.clewiner.com 활성화 (HTTPS 인증서 자동)"
