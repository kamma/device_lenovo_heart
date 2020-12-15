#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64.mk)

$(call inherit-product, device/lenovo/heart/device.mk)

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3QuickStep \
    WallpaperPicker \
    netutils-wrapper-1.0 \
    vndk_package

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_MANUFACTURER := Lenovo
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_heart
PRODUCT_DEVICE := heart
PRODUCT_MODEL := Lenovo Z5 Pro GT

#PRODUCT_MANUFACTURER := Lenovo
#PRODUCT_BRAND := Lenovo
#PRODUCT_NAME := heart
#PRODUCT_DEVICE := heart
#PRODUCT_MODEL := Lenovo Z5 Pro GT