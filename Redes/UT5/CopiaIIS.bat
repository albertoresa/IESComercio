echo off
cls
Set fecha=%Date:~0,2%_%Date:~3,2%_%Date:~6,4%
C:\Windows\System32\inetsrv\appcmd add backup Copia_IIS_%fecha%
robocopy e: c:\Copias /e