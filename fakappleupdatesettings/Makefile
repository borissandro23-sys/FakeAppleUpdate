include $(THEOS)/makefiles/common.mk

BUNDLE_NAME := FakeAppleUpdateSettings

FakeAppleUpdateSettings_FILES := FAURootListController.m
FakeAppleUpdateSettings_FRAMEWORKS := UIKit
FakeAppleUpdateSettings_PRIVATE_FRAMEWORKS := Preferences
FakeAppleUpdateSettings_INSTALL_PATH := /Library/PreferenceBundles
FakeAppleUpdateSettings_CFLAGS := -fobjc-arc
FakeAppleUpdateSettings_RESOURCE_DIRS := Resources

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FakeAppleUpdate.plist$(ECHO_END)
