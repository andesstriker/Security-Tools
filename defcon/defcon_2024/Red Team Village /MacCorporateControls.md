# Bypassing Corporate Controls On Mac Devices
- look for slides in red team website
- MDM 
  - software used to monitor corporate devices
- Command Sequence 
1. Enrollment
2. Configuration Profiles
   - can be used to set setting for other applications
-  
## Potential Avenues Exploits
- one avenue is pushing update if they have auto updates
  - how do they push updates?
  - either way could make a realistic one
- configuration profiles can be injected with shell commands
- managed browser
  - browser policies have a policy precedence 
    - machine policy is the main policy
  - `chrome://policy`
  - can see the chrome policies
- macOS Sandboxing 
  - restricting access ot file system, network connections, etc
  - block chromes ability to learn policies 
    - block reading policy from `/library/managed.preferences` for example 
  - use the sandboxing against itself
- Endpoint Security 
  - can watch Scott Night video 
  - Frida is a dynamic instrumentation tool kit that allows you to inject code into running applications to monitor and manipulate them in real time
    - can be used for the endpoint security apis
  - muting vs Invert muting 
- Analyzing TTPs 
  - their are demos on creating own on slide
  - mac monitor can be used but is closed source
- Google Endpoint Verification
  - collects client metrics
  - it is effectively self-reporting its state 
    - possible to make it lie with fake responses using `DVLD_INSERT_LIBRARIES`
    - can gain trust 
    - Don't need to disable sip for this
  - 