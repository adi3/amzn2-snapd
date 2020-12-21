# amzn2-snapd

Tools to install snapd on Amazon Linux 2 for arm64 machines.

## Install

1. Download packages
    ```
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/snap-confine-2.48.2-0.amzn2.aarch64.rpm
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/snapd-2.48.2-0.amzn2.aarch64.rpm
    ```

2. Install packages

    ```
    sudo yum install -y snap-confine-2.48.2-0.amzn2.aarch64.rpm snapd-2.48.2-0.amzn2.aarch64.rpm
    ```

3. Enable socket

    ```
    sudo systemctl enable --now snapd.socket
    ```
    
4. Test snapd

    ```
    snap version
    sudo snap install snapcraft --classic
    ```


## Build

* Docker
sudo yum install docker
sudo systemctl start docker

### Instructions

1. Set up dependencies
    ```
    sudo yum -y install docker git
    sudo systemctl start docker
    ```

2. Fetch source code

    ```
    git clone https://github.com/adi3/amzn2-snapd
    cd amzn2-snapd
    ```

... here on out should be one bash script...
```
get latest version
version=$(curl -s https://api.github.com/repos/snapcore/snapd/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

sudo docker build . --force-rm --build-arg version=$version -t amzn2-snapd:latest

```


1. Build a new image.

    ```
    bin/build
    ```

1. Extract built packages from the built image. The packages will be copied to the ./rpm directory.

    ```
    bin/cp
    ```

1. Delete the built image.

    ```
    bin/rmi
    ```
