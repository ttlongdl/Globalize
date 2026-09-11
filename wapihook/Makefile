ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:17.0
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WAPIHook17
WAPIHook17_FILES = Tweak.xm
WAPIHook17_CFLAGS = -fobjc-arc
WAPIHook17_FRAMEWORKS = CoreFoundation

include $(THEOS_MAKE_PATH)/tweak.mk
