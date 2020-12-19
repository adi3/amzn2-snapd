# amzn2-snapd

Tools to install snapd on Amazon Linux 2 for arm64 machines.

## Install

1. Download the packages
    ```
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/snap-confine-2.48.2-0.amzn2.aarch64.rpm
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/
    ```

2. Install the package

    ```
    sudo yum install -y snap-confine-2.48.2-0.amzn2.aarch64.rpm 
    ```

3. Enable the snapd.socket

    ```
    sudo systemctl enable --now snapd.socket
    ```

## Build

* Docker
sudo yum install docker
sudo systemctl start docker

### Instructions

1. Install Docker
    ```
    sudo yum install docker
    sudo systemctl start docker
    ```

2. Fetch source code

    ```
    git clone https://github.com/adi3/amzn2-snapd
    cd amzn2-snapd
    ```

... here on out should be one bash script...

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
