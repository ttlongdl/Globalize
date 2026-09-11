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

## Build

Requires a current Theos installation and an iOS 17 SDK.

```sh
export THEOS=~/theos
make clean package FINALPACKAGE=1