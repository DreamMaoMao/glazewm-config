# 获取所有监视器的信息
$monitors = zebar monitors
# 对每个监视器运行zebar命令
foreach ($monitor in $monitors) {
    Start-Process -WindowStyle Hidden -FilePath "zebar" -ArgumentList "open bar --args $monitor"
}

Start-Process "$env:HOMEPATH\.glzr\scripts\bind.ahk"