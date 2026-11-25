# FakeAppleUpdate

Rootless UI prototype for jailbroken iOS 15 devices.

## What it does

- Adds a separate **«Предпросмотр обновления»** row immediately below the real Software Update row in Settings → General.
- Opens a local screen styled after the iOS Software Update page.
- Shows a fictional iOS 15.8.9 entry.
- Runs a 30-second local progress simulation, then displays one randomly selected sample error.
- The «Повторить» action starts another local 30-second simulation.
- The preview entry remains available after restarting the device.

## Safety boundary

This is a separate preview screen. The real Software Update row remains unchanged and available.

The tweak does not contact Apple update servers and does not call Apple's scan, download, verification, installation, reboot, or update-state APIs. It does not change the installed iOS version, Apple update metadata, system update preferences, or system files. Its only persistent value is stored in its own NSUserDefaults suite (`com.sasha.fakeappleupdate`).

## Build

GitHub Actions builds a rootless Debian package for arm64 using Theos. The resulting `.deb` is uploaded as the `FakeAppleUpdate-rootless` workflow artifact.
