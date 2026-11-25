# FakeAppleUpdate

Rootless Theos project for Dopamine on arm64 devices running iOS 15.

## Current state

This repository currently contains the build scaffold only. The Settings interface and local-only update simulation have not been implemented yet.

## Safety boundary

- No real update scans, downloads, verification, installation, or reboot actions.
- No changes to Apple's update metadata, system version, or system update preferences.
- No hooks into `SUSUISoftwareUpdateController`, `SUManagerClient`, or Apple's update services.
- Simulation state will be stored in the tweak's own preferences.

## Build

GitHub Actions builds a rootless Debian package on macOS. Run the workflow manually from **Actions → Build FakeAppleUpdate**, or push a commit to `main`.

Target device: iPhone 6s (arm64), iOS 15.8.8, Dopamine rootless.
