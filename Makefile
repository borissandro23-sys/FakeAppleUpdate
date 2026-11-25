TARGET := iphone:clang:latest:15.0
ARCHS := arm64
THEOS_PACKAGE_SCHEME := rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := FakeAppleUpdate
FakeAppleUpdate_FILES := Tweak.xm
FakeAppleUpdate_CFLAGS := -fobjc-arc
FakeAppleUpdate_FRAMEWORKS := UIKit Foundation
FakeAppleUpdate_PRIVATE_FRAMEWORKS := Preferences
FakeAppleUpdate_INSTALL_TARGET_PROCESSES := Preferences

include $(THEOS_MAKE_PATH)/tweak.mk
