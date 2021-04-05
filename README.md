# Jetson containers [WIP]

A `kas` build configuration for creating yocto based jetson [nvidia-docker] enabled images.
It is based on [tegra-demo-distro] and [meta-embedded-containers].

Goals:
- [x] kas build for jetson machines
- [ ] mender integration
- [ ] integrate meta-embedded-containers
- [ ] building dockerfiles using `podman buildx` 
- [ ] optional `nvidia-container-runtime` with rootless podman integration


| Layer Repo               | Version               | Description                                         |
| ------------------------ | --------------------- | --------------------------------------------------- |
| poky                     | refs/tags/yocto-3.1.6 | OE-Core from poky repo at yoctoproject.org          |
| meta-tegra               | dunfell-l4t-32.5.0    | L4T BSP layer                                       |
| meta-openembedded        | master                | OpenEmbedded layers                                 |
| meta-virtualization      | master                | Virtualization layer for docker support             |
| meta-mender              | dunfell               | For meta-mender-core layer used in tegrademo-mender |
| meta-mender-community    | dunfell               | For meta-mender-tegra integration layer             |
| meta-embedded-containers | dunfell               | Embedding container images in rootfs                |

## Usage

### Prerequisites

- [kas]
- Yocto build host

See the [Yocto Project Quick Build]
documentation for information on setting up your build host.

In addition to the packages mentioned in that documentation, you
will need gcc and g++ 8 (on Ubuntu, packages `gcc-8` and `g++-8`).

For burning SDcards (for the Jetson Nano or Jetson Xavier NX developer
kits), the `bmap-tools` package is recommended.

For building CUDA applications, you must download the CUDA host-side
tools using the NVIDIA SDK Manager (NVIDIA Developer Network login
required). You should set the environment variable NVIDIA_DEVNET_MIRROR
to the path of the directory where the `.deb` file for the tools
package is located.


### Setup and build

1. Clone this repository:

        $ git clone https://github.com/ashwoods/jetson-containers.git

2. Build (currently builds a minimal jetson tx2 image by default)

        $ kas build kas.yml

[kas]: https://github.com/siemens/kas
[Yocto Project Quick Build]: https://www.yoctoproject.org/docs/3.1.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html
[tegra-demo-distro]: https://github.com/OE4T/tegra-demo-distro
[meta-embedded-containers]: https://github.com/savoirfairelinux/meta-embedded-containers
[nvidia-docker]: https://github.com/NVIDIA/nvidia-docker
