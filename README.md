# Globalize17 (rootless source)

Unofficial rootless iOS 17 port of
[Globalize](https://github.com/parrotgeek1/Globalize) by parrotgeek1.

This port updates the original project for modern rootless jailbreak environments.

## Features

- Changes `region-info` to `X/A`
- Overrides `software-behavior`
- Disables `WAPIEnabled`
- Rootless packaging support

The original PrideWatchFaceHook was not included because it is unrelated to
the region/WAPI functionality targeted by this port.

## Compatibility

Tested on:

- iPhone 12 Pro
- iOS 17.0
- Dopamine rootless

Other devices and iOS versions may work, but have not been verified.

## Installation

Globalize17 is available from the TTLongDL Repo:

**https://ttlongdl.github.io/repo/**

Add the repository to your package manager and install **Globalize17**.

## Build

Requires a current Theos installation and an iOS 17 SDK.

```sh
export THEOS=~/theos
make clean package FINALPACKAGE=1

## Disclaimer

This is an unofficial community port and is not supported by the original
developer.

This project is maintained as a personal hobby project and shared as-is.
Compatibility, future updates, and continued support are not guaranteed.