
```shell
$ docker tag arch:latest ccss17/arch:latest
$ docker build -t archbase -f .\Dockerfile.archbase .
$ docker build --no-cache -t arch -f .\Dockerfile.arch .
$ docker run -it --privileged -v d:/docker_share:/home/ccsss/share ccss17/arch:latest
```