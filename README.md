"# CI-Build-environment" 
there are 3 servers - 

  
  | IP ADDR     | HOST NAME | APPS | PORTS EXPOSED TO HOST (vm port->host) |
  | ------------- | ------------- | ----- | ----- |
  | 172.16.1.101 | artifactory.cilab | `nexus`, `java` | 8081->38081 |
  | 172.16.1.102 | gitserver.cilab | `gitlabserver` | 80->38000 |
  | 172.16.1.103 | buildserver.cilab| `jenkins`, `SCM tools`, `BUILD tools` | 8080->38080 |
  | 172.16.1.104 | buildnode.cilab | `SCM tools`, `BUILD tools` | N\A |
