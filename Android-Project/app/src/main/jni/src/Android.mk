LOCAL_PATH := $(call my-dir)
# LOCAL_PATH = src/main/jni/src

include $(CLEAR_VARS)

LOCAL_MODULE := main

rwc = $(foreach d, $(wildcard $1*), $(call rwc,$d/,$2) $(filter $(subst *,%,$2),$d))

HCH_PATH := $(abspath ../..)
HCH_LIBS := $(HCH_PATH)/meta/android/app/src/libs

SDL_PATH := $(abspath ../SDL2)

LOCAL_C_INCLUDES := \
    $(SDL_PATH)/include/ \
    \
    $(HCH_PATH)/source/ \
    $(HCH_PATH)/include/ \
    \
    $(HCH_LIBS)/include/ \
    $(HCH_LIBS)/libogg/ \
    $(HCH_LIBS)/libpng16/ \
    $(HCH_LIBS)/libvorbis/

# Add your application source files here...
LOCAL_SRC_FILES := \
    $(call rwc, $(HCH_PATH)/source/, *.cpp) \
    $(call rwc, $(HCH_PATH)/source/, *.c) \
    $(call rwc, $(SDL_PATH)/src/, *.c) \
    \
    $(call rwc, $(HCH_LIBS)/libogg/, *.c) \
    $(call rwc, $(HCH_LIBS)/libpng16/, *.c) \
    $(call rwc, $(HCH_LIBS)/libvorbis/, *.c)

LOCAL_LDLIBS := -lGLESv2 -lz -llog

include $(BUILD_SHARED_LIBRARY)
