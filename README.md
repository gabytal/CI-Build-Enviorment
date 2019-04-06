"# CI-Build-environment" 
there are 3 servers - 

  
  | IP ADDR     | HOST NAME | APPS | PORTS EXPOSED TO HOST (vm port->host) |
  | ------------- | ------------- | ----- | ----- |
  | 172.16.1.101 | artifactorycilab | `nexus`, `java`, `docker` | 8081->38081 |
  | 172.16.1.103 | buildservercilab| `jenkins`, `GIT`, `Maven` | 8080->38080 |
  | 172.16.1.104 | buildnodecilab | `GIT`, `Maven` |

#
port-fowarding auto correct is on, so check the server port with "vagrant port MACHINE_NAME" command.
