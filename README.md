# Coral Independent Study

[![Python](https://img.shields.io/badge/python-3670A0?style=flat&logo=python&logoColor=ffdd54)](https://www.python.org/downloads/release/python-3913/)
[![TensorFlow](https://img.shields.io/badge/tensorflow-FF6F00?style=flat&logo=tensorflow&logoColor=white)](https://www.tensorflow.org/)
[![Platform](https://img.shields.io/badge/platform-mendel-blue)](https://coral.ai/docs/dev-board/get-started/)

This is a repository for my Coral Dev Board Independent Study at DU. I will use this to document my progress and findings throughout Winter Quarter 2023. 

- [Coral Independent Study](#coral-independent-study)
  - [Initial Setup](#initial-setup)

## Initial Setup

Getting started with the Coral Dev Board is fairly straightforward. The documentation Google provides is thorough and easy to follow.

The short version is download the [Mendel Linux image](https://coral.ai/docs/dev-board/get-started/#flash-the-board) and flash it to a microSD card. I used [Balena Etcher](https://www.balena.io/etcher/) to flash the image. Set the boot mode on the coral board to boot and flash the internal stoage from the microSD card, plug it in, and turn it on. The board should boot up and you should be able to SSH into it via the [`mdt`](https://coral.ai/docs/dev-board/mdt/) utility over a USB-C data cable. Then setup internet connection and ssh for convienence.

### Prerequisites

- [ ] [Coral Dev Board](https://coral.ai/products/dev-board)
- [ ] [Balena Etcher](https://www.balena.io/etcher/)
- [ ] USB-C data cable
- [ ] USB-C power cable
- [ ] MicroSD card (8GB or larger)
- [ ] Python 3.x on host machine


### Documentation
- [Coral Dev Board Getting Started](https://coral.ai/docs/dev-board/get-started/)
- [Mendel Development Tool](https://coral.ai/docs/dev-board/mdt/)
