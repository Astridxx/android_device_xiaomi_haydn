echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree [1/6]'
git clone https://github.com/Astridxx/android_device_xiaomi_sm8350-common -b RisingOS-13 device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree [2/6]'
git clone --depth=1 https://github.com/Astridxx/android_kernel_xiaomi_sm8350 -b lineage-20 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning vendor tree [3/6]'
git clone https://github.com/Astridxx/proprietary_vendor_xiaomi_haydn -b lineage-20 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning common vendor tree [4/6]'
git clone https://github.com/Astridxx/proprietary_vendor_xiaomi_sm8350-common -b RisingOS-13 vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning firmware [5/6]'
git clone https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Xiaomi
echo 'Cloning hardware xiaomi [6/6]'
rm -rf hardware/xiaomi && git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi

echo 'delete vendorsetup.sh from device tree once this is done'
