# amzn2-snapd

Tools to install snapd on Amazon Linux 2 for arm64 machines.

## Install

### Instructions

1. Download the snap-confine and snapd packages from [the Release page](https://github.com/albuild/snap/releases/tag/v0.1.0).
    ```
    wget ---
    ```

2. Install the package.

    ```
    sudo yum -y install snap-confine-0.1.0-0.amzn2.aarch64.rpm snapd-0.1.0-0.amzn2.aarch64.rpm
    ```

3. Enable the snapd.socket.

    ```
    sudo systemctl enable --now snapd.socket
    ```

## Build (Amazon WorkSpaces)

### System Requirements

* Docker
sudo yum install docker
sudo systemctl start docker

### Instructions

1. Clone this repository.

    ```
    git clone https://github.com/albuild/snap.git
    cd snap
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
