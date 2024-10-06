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
- Install `nmap` and other dependencies if they are not already available.
