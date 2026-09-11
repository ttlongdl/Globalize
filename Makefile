ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:17.0
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Globalize17
Globalize17_FILES = Tweak.xm
Globalize17_CFLAGS = -fobjc-arc
Globalize17_FRAMEWORKS = CoreFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += wapihook
include $(THEOS_MAKE_PATH)/aggregate.mk
