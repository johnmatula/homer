TWEAK_NAME = Homer
Homer_FILES = Tweak.xm
Homer_FRAMEWORKS = UIKit
TARGET=iphone:clang:7.1
ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
