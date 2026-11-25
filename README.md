# FakeAppleUpdate

Rootless UI prototype for jailbroken iOS 15 devices.

## What it does

- Adds one **FakeAppleUpdate** entry to the root page of Settings.
- Opens a local menu with **Выбрать версию iOS** and **Предпросмотр обновления**.
- The version picker stores its selection in the tweak's own preferences domain.
- The preview shows a local mock software-update screen and a 30-second simulated check.

## Safety boundary

The real Settings → General → Software Update page is left unchanged. The tweak does not contact Apple update servers and does not call Apple's scan, download, verification, installation, reboot, or update-state APIs. It does not change the installed iOS version, Apple update metadata, system update preferences, or system files.

## Build

GitHub Actions builds a rootless Debian package for arm64 using Theos. The resulting `.deb` is uploaded as the `FakeAppleUpdate-rootless` workflow artifact.
