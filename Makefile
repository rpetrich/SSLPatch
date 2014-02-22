TWEAK_NAME = SSLPatch
SSLPatch_FILES = Tweak.x
SSLPatch_CFLAGS = -I. -Iexternal
SSLPatch_LIBRARIES = substrate
SSLPatch_FRAMEWORKS = Security

IPHONE_ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk
