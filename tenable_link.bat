@echo off

cd "c:\Program files\Tenable\Nessus Agent"
nessuscli.exe agent unlink
echo "Nessus Agent Unlinked Successfully"
net stop "Tenable Nessus Agent"
net start "Tenable Nessus Agent"
nessuscli agent link --key=9d4777f71733214d2a35566bd5f4bee3fda2b19462083c5f692dc86a2306d771 --host=cloud.tenable.com --port=443 --groups="Corp_Cloud_AZR_GCH_IVL_EUC"
nessuscli.exe fix --set update_hostname="yes"
nessuscli.exe fix --set disable_core_updates="yes"
nessuscli.exe fix --set track_unique_agents="yes"
nessuscli.exe fix --set process_priority="normal"
timeout /t 5
net stop "Tenable Nessus Agent"
timeout /t 5
net start "Tenable Nessus Agent"
echo " Nessus agent is successfully attempted to relink cloud.tenable.com:443, check nessuscli.exe agent status to check link status " 

nessuscli.exe fix --set disable_core_updates=no
:end 
