## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := 8675

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/coolpad/8675/device_8675.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := 8675
PRODUCT_NAME := cm_8675
PRODUCT_BRAND := coolpad
PRODUCT_MODEL := 8675
PRODUCT_MANUFACTURER := coolpad
