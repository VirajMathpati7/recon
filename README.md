# recon
reconnaissance Bash script for subdomain enumeration and directory brute-forcing

- The script automates the process of subdomain enumeration using tools like subfinder and assetfinder.
- It checks for required tools and installs them if missing.
- Supports directory brute-forcing with user-specified or default wordlists.
- Generates directories for organizing results, including subdomains, screenshots, and scans.
- Includes colored output for improved readability.

## Features

- **Subdomain Enumeration**: Utilizes tools like `subfinder` and `assetfinder` to find subdomains.
- **Directory Brute-Forcing**: Supports directory brute-forcing with customizable wordlists.
- **Tool Checks**: Automatically checks for the required tools and installs them if not found.
- **Organized Output**: Creates directories for subdomain findings, screenshots, and scans to keep results organized.
- **Colored Output**: Enhances terminal output readability with color-coded messages.

## Prerequisites
- Make sure you have [Go](https://golang.org/dl/) installed for installing Go-based tools.

## Tools used
- **subfinder**: A subdomain discovery tool. [GitHub Repository](https://github.com/projectdiscovery/subfinder) - Licensed under MIT License.
- **assetfinder**: A tool for finding domain assets. [GitHub Repository](https://github.com/tomnomnom/assetfinder) - Licensed under MIT License.
- **httprobe**: A tool for probing URLs to see if they are alive. [GitHub Repository](https://github.com/tomnomnom/httprobe) - Licensed under MIT License.
- **gowitness**: A tool for taking screenshots of URLs. [GitHub Repository](https://github.com/sensepost/gowitness) - Licensed under MIT License.
- **nmap**: A network scanning tool. [Official Website](https://nmap.org/) - Licensed under GNU GPL.
- **ffuf**: A fast web fuzzer written in Go. [GitHub Repository](https://github.com/ffuf/ffuf) - Licensed under MIT License.

## License

This script is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


1. Clone the repository:
   git clone <https://github.com/VirajMathpati7/recon>
   cd

## usage 
![2024-10-06 19_16_31-kali-linux-2024 3-vmware-amd64 - VMware Workstation](https://github.com/user-attachments/assets/f9c9e23c-c834-4d5f-a89a-317d6ce71d88)
