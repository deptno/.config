powershell.exe -ExecutionPolicy Unrestricted -File "$(wslpath -w ~)\\.config\\.windows\\portproxy_wsl.ps1"
sudo service ssh start
