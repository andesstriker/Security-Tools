## Security Tools and Tips
This a compilation of tools that can be used for security. They are separated by their different uses and fields. 
### OSINT
These tools and tips are for technical open source intelligence.
#### Tools
- Webmii 
    - summarizes public information about the person from the internet
- Google Search by Image
- Whois 
    - lookup for domain
- Google Search Operators
    - intext: looks for appearances in the text
    - site: only searches the domain you list
    - inurl: any website with the term in the url
    - filetype: limits to a certain filetype the search 
    - cache: searches for the cached version of the domain, file, or other artifact you list
    - info: gives info on the domain you list
    - many more
- Foca (only for windows)
- Maltego [download](https://www.maltego.com/downloads/)
    - create graphs of targets
- Social Engineer Tool Kit: [SET](https://github.com/trustedsec/social-engineer-toolkit)
- [IntelTechniques](https://inteltechniques.com/)
    - search engines for everything
#### Tips
- google search ideas 
    - webcam
    - passwords
    - private photos
- always check robots.txt
- file metadata can be useful

### Binary Exploitation
These tools can be helpful for binary exploitation.
#### Tools 
- Ghidra 
  - decompiler
  - open source by NSA
- IDA
  - decompiler 
  - have not personally used the paid version
  - I did like the unpaid version better than ghidra. It definetly has a better ui. 
- pwndbg
  - Debugger made specifically for reverse engineering
- [convert hex to assembly](https://defuse.ca/online-x86-assembler.htm#disassembly)
  - other interesting tools on this website
- http://phrack.org/
  - incredible resource for different binary exploitation technique. 
- pwntools library in python
  - shellcraft 
    - `shellcraft -h`: shellcraft help
    - `shellcraft -fa <file>`: run a premade shellcode
    - `shellcraft -l `: all of the premade shellcodes
    - `shellcraft -d <file>`: run premade shellcode in gdb
    - `shellcraft -r <file>`: run premade shellcode
    - can also be used in python file
- Learn heap overflows here https://github.com/shellphish/how2heap/tree/master 
 
### Web Exploits
- burpsuite 
    - use spider to find pages on a website 
    - automate attacks 
    - intercept payloads
- nikto 
    - `nikto -host google.com`
    - the command above will scan that website and find many potential issues to investigate
- httprecon
    - will get a fingerprint of the website
- [payloadsAllTheThings repo](https://github.com/swisskyrepo/PayloadsAllTheThings?tab=readme-ov-file)
    - has payloads for all types of situations
- dirb
    - explore urls for hidden pages
    - `dirb http://35.227.24.107/b02f939d67/ /usr/share/wordlists/dirb/common.txt`
- hydra
    - password spraying tool
    - post request example `hydra -L rockyou.txt -p idk -t 20 35.227.24.107 http-post-form "/b02f939d67/login:username=^USER^&password=^PASS^:Invalid username"`
- echomirage 
    - can inject into a process and intercept calls to socket APIs.
## Tips
- burpsuite, nikto, and httprecon are great for application mapping
### General Tools 
These tools still need to be categorized. Leaving them here for completeness.
#### Tools 
- CyberChef 
- quipquip
- BurpSuite
- factorDB
- Autopsy (forensics)
- Jack The Ripper 
- Audacity 
- Wireshark 
- Steghide

