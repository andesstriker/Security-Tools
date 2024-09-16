# Attacking Kubernetes

## Application Compartmentalization
- traditional architecture
  - everything in different hardware separated
- VM Architecture
  - use a hypervisor to emulate an os and hardware on one machine
- container architecture
  - uses a container engine 
  - there is no container just another process
## what containers really are
- namespaces
- Cgroups
- capabilities
  - used to give specific permissions
## Kubernetes 
- can be used to deploy several environments
  - testing, production, development
- kubernetes manages these environments
### Kubernetes Primitives
- used to reference different resources in kubernetes
- control plane components
  - kube-apiserver
  - etcd
    - distributed database that keeps track of state 
  - kube-scheduler
  - kube-controller
- Node Components 
  - kube-proxy
  - kubelet
  - container runtime
    - like docker
## Kubernetes Threat Model
- Pod/Container: attacker controls application and may be able to escape and attack the node
- Kubelet: attacker controls running pods
- OWASP Kubernetes Risks TOP 10 
  - look into these to see how to exploit kubernetes
## Kubernetes Most Common Attack Techniques
- Initial Access 
  - using cloud credentials
  - compromised images 
    - supply chain attacks 
      - backdoors 
    - vulnerable dependencies
  - kubeconfig file hunting for .kube/config Files
    - look on git hub for leaked credentials
  - application vulnerabilities 
  - exsposed sensitive interfaces
    - third party interfaces sometimes don't have execution by default
- Execution
  - exec into container
  - deploying new container
    - like busy box 
    - cryptominer
  - sidecar injection
- Persistence
  - writable hostpath mount
    - kubernetes gets data from machine
    - can add a folder
  - malicious admission controller
    - admission controller
      - used to validate requests
    - hacker can use this to do man in the middle attacks
- Privilege Escalation 
  - priveleged container
    - container that passes out terminal and take input
    - pid 1 
    - can be blocked with policies
      - aren't on by default 
    - cluster admin building 
      - priveleged clusters already can exist in the cluster 
- Defense Evasion
  - clear container logs
  - delete kuberentes events
  - credential access 
    - service principal
    - list kubernetes secrets
- Discovery
  - access the kubernetes api server 
  - access kubelet api
  - network mapping
  - access kubernetes dashboard
  - instance metadata api
- lateral movement
  - access cloud resources
  - container service account
  - cluster internal networking 
- collection
  - images from private registry 
    - should be in the cluster
- Impact
  - denial of service 
    - deleting pods, deployments
  - resource hijacking
  - data destruction
## Kubernetes Evolution
- edge/ hybrid cloud
  - iot devices
  - kubeedge
  - superedge
  - akri 
  - openyurt
  - k3s
- more impact in these devices
## Workshop
- link in phone browser

