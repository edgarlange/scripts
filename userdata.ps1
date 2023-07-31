write-host "running init script"
if(!(test-path -Path "c:\temp"))
    {    
        New-Item -ItemType directory -Path "C:\temp"
        write-host "created temp directory"
    }

$URL = "https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.30.2/StorageExplorer-windows-x64.exe"
$Path="c:\temp\StorageExplorer-windows-x64.exe"
Invoke-WebRequest -URI $URL -OutFile $Path

$URL2 = "https://aka.ms/ssmsfullsetup"
$Path2="c:\temp\SSMS-Setup-ENU.exe"
Invoke-WebRequest -URI $URL2 -OutFile $Path2

$URL3 = "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe"
$Path3="c:\temp\PBIDesktopSetup_x64.exe"
Invoke-WebRequest -URI $URL3 -OutFile $Path3

$pathvargs = {c:\temp\StorageExplorer-windows-x64.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs
Start-Sleep 120

$pathvargs1 = {c:\temp\SSMS-Setup-ENU.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs1
Start-Sleep 120

$pathvargs2 = {c:\temp\PBIDesktopSetup_x64.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs2
Start-Sleep 120

