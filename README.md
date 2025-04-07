# Network-Configuration-Checker
 Network Configuration and Connectivity Checker using PowerShell Developed an automation script that checks IP, Gateway, DNS settings, and internet availability. Generates daily reports and logs for system monitoring.

Task : Description 
🎯 Objective : Check internet connection and network settings (IP, DNS, Gateway) 
🧠 Goal : Help IT support verify system connectivity quickly 
🧰 Output : CSV report + log file (daily results)

Tool : Why It's Used 
PowerShell : To write and run the script 
Built-in Windows cmdlets : Like Test-Connection, Get-NetIPConfiguration 
Notepad : For writing the script

#Step 1: Create Folder Structure
Go to C:\ and manually create the following:
C:\IT-Support-Lab\
├── Scripts\
├── Reports\
├── Logs\

#Step 2: Create the PowerShell Script
Open Notepad or VS Code, copy the script below, and save it as:
📄 C:\IT-Support-Lab\Scripts\Network-Check.ps1

#Step 3: Run the Script
Open PowerShell as Administrator and run:
& "C:\IT-Support-Lab\Scripts\Network-Check.ps1"

Check the results:
📄 Network-Report.csv in Reports folder
📄 Network-Log.txt in Logs folder
