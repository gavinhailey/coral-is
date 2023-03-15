# Coral Independent Study

[![Python](https://img.shields.io/badge/python-3670A0?style=flat&logo=python&logoColor=ffdd54)](https://www.python.org/downloads/release/python-3913/)
[![TensorFlow](https://img.shields.io/badge/tensorflow-FF6F00?style=flat&logo=tensorflow&logoColor=white)](https://www.tensorflow.org/)
[![Platform](https://img.shields.io/badge/platform-mendel-blue)](https://coral.ai/docs/dev-board/get-started/)

This is a repository for my Coral Dev Board Independent Study at DU. I will use this to document my progress and findings throughout Winter Quarter 2023.

- [Coral Independent Study](#coral-independent-study)
  - [Initial Setup](#initial-setup)
    - [Prerequisites](#prerequisites)
    - [Post Install](#post-install)
    - [Documentation](#documentation)
  - [Updating](#updating)
  - [Shutting Down](#shutting-down)
  - [Connecting a Camera](#connecting-a-camera)
  - [Using your Own Model](#using-your-own-model)
  - [Datasheet](#datasheet)

## Initial Setup

Getting started with the Coral Dev Board is fairly straightforward. The documentation Google provides is thorough and easy to follow.

The short version is download the [Mendel Linux image](https://coral.ai/docs/dev-board/get-started/#flash-the-board) and flash it to a microSD card. I used [Balena Etcher](https://www.balena.io/etcher/) to flash the image. Set the boot mode on the coral board to boot and flash the internal stoage from the microSD card and plug it in. The board should boot up and you should be able to SSH into it via the [`mdt`](https://coral.ai/docs/dev-board/mdt/) utility over a USB-C data cable. Then setup internet connection and ssh for convienence.

There is a convience script included at `scripts/host_setup.sh` that will do all of this for you. Just run it on your host machine and it will get all of the dependencies and the mendel iso.

Refer to the documentaton linked below for the full guide

### Prerequisites

- [ ] [Coral Dev Board](https://coral.ai/products/dev-board)
- [ ] [Balena Etcher](https://www.balena.io/etcher/)
- [ ] USB-C data cable
- [ ] USB-C power cable
- [ ] MicroSD card (8GB or larger)
- [ ] `Python 3.x` and `wget` on host machine

### Post Install

Any additional useful packages and tools can be installed via the `scripts/coral_setup.sh` script.
For now this script just upgrades pip and installs pillow (for image processing).

### Documentation

- [Coral Dev Board Getting Started](https://coral.ai/docs/dev-board/get-started/)
- [Mendel Development Tool](https://coral.ai/docs/dev-board/mdt/)

## Updating

Updating the Coral Dev Board is as simple as running the following command:

``` bash
sudo apt-get update && sudo apt-get dist-upgrade
```

## Shutting Down

Although you can just unplug the Coral Dev Board, it is recommended to shut it down properly. To do this, run the following command:

``` bash
sudo shutdown now
```

## Connecting a Camera

`YUYV` also called `YUY2` is the only format supported by the Coral Dev Board. To check if your camera supports this format, run the following command:

``` bash
v4l2-ctl --list-formats-ext --device /dev/video1
```

## Using your Own Model

[Custom Model](custom_model/README.md)

## Datasheet

If you'll be working with the GPIO, serial, or anything else embedded. This datasheet will be helpful.

[Coral Dev Board Datasheet](coral-dev-board-datasheet.pdf)