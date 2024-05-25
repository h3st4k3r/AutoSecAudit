# AutoSecAudit

AutoSecAudit is an automated security auditing script designed to streamline the process of vulnerability assessment on a target system. It integrates multiple security tools to perform a comprehensive scan and analysis, including port scanning, directory detection, vulnerability scanning, brute force attacks, and port analysis.

## Features

- **Port Scanning**: Utilizes Nmap to identify open ports and services.
- **Directory Detection**: Uses Gobuster to find hidden directories.
- **Vulnerability Analysis**: Leverages Nikto for web server vulnerability scanning.
- **Brute Force Attack**: Employs Hydra for SSH brute force attacks.
- **Comprehensive Port Analysis**: Uses Metasploit for detailed port scanning.

## Prerequisites

Ensure you have the following tools installed on your system:
- Python 3.x
- Nmap
- Gobuster
- Nikto
- Hydra
- Metasploit Framework

## Installation

Run the following commands to install the necessary tools:

```sh
sudo apt update
sudo apt install -y nmap gobuster nikto hydra metasploit-framework
sudo msfdb init
