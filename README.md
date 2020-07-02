# Travis CI Build Metricbeat
Test Travis CI：Success
1. Use Docker Multi-Stage Builds  
2. Use binfmt_misc / qemu-user-static (Docker Images Setup)  
3. Use Docker Buildx  
4. Use Travis CI  
5. Build Multi Architecture Docker Image (amd64 / arm64)  
6. Auto Push DockerHub  

# Build Server Info (Check OS / Kernel Version)
Travis CI Hosted Runners
# Cloud Instance
    Google Cloud Platform (GCP)

# Custom Operating System and Version：Yes
  dist: focal

# lsb_release -a
    Distributor ID:	Ubuntu
    Description:	Ubuntu 20.04 LTS
    Release:	20.04
    Codename:	focal

# uname -r
    5.4.0-1018-gcp

# docker version
    Client: Docker Engine - Community
     Version:           19.03.12
     API version:       1.40
     Go version:        go1.13.10
     Git commit:        48a66213fe
     Built:             Mon Jun 22 15:45:44 2020
     OS/Arch:           linux/amd64
     Experimental:      true

    Server: Docker Engine - Community
     Engine:
      Version:          19.03.12
      API version:      1.40 (minimum version 1.12)
      Go version:       go1.13.10
      Git commit:       48a66213fe
      Built:            Mon Jun 22 15:44:15 2020
      OS/Arch:          linux/amd64
      Experimental:     false
     containerd:
      Version:          1.2.13
      GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
     runc:
      Version:          1.0.0-rc10
      GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
     docker-init:
      Version:          0.18.0
      GitCommit:        fec368
  
  # docker buildx version
      github.com/docker/buildx v0.4.1 bda4882a65349ca359216b135896bddc1d92461c
