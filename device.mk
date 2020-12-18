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

GAPPS_VARIANT := nano

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_HARDWARE := heart

# DEVICE_PACKAGE_OVERLAYS for the device should be before
# including common overlays since the one listed first
# takes precedence.
ifdef DEVICE_PACKAGE_OVERLAYS
$(warning Overlays defined in '$(DEVICE_PACKAGE_OVERLAYS)' will override '$(PRODUCT_HARDWARE)' overlays)
endif
DEVICE_PACKAGE_OVERLAYS += device/lenovo/heart/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=560 \

# Vibrator HAL
PRODUCT_PROPERTY_OVERRIDES += \
  ro.vibrator.hal.click.duration=10 \
  ro.vibrator.hal.tick.duration=4 \
  ro.vibrator.hal.heavyclick.duration=12

# Enable Perfetto traced
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.traced.enable=1

# Early phase offset for SurfaceFlinger (b/75985430)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_app_phase_offset_ns=500000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_gl_phase_offset_ns=1500000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_gl_app_phase_offset_ns=15000000

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)