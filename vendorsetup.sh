echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/Astridxx/android_device_xiaomi_sm8350-common -b Pixys-13 device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree'
git clone https://github.com/Astridxx/android_kernel_xiaomi_sm8350.git --recursive --depth=1 -b Octavi-13 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning vendor tree'
git clone https://github.com/Astridxx/proprietary_vendor_xiaomi_haydn -b lineage-20 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning common vendor tree'
git clone https://github.com/Astridxx/proprietary_vendor_xiaomi_sm8350-common -b lineage-20 vendor/xiaomi/sm8350-common

# Xiaomi
echo 'Cloning hardware xiaomi'
rm -rf hardware/xiaomi && git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi

# Display
echo 'Cloning display hal'
rm -rf hardware/qcom-caf/sm8350/display && git clone --depth=1 https://github.com/LineageOS/android_hardware_qcom_display -b lineage-20.0-caf-sm8350 hardware/qcom-caf/sm8350/display

echo 'Cloning opensource display'
rm -rf vendor/qcom/opensource/display && git clone --depth=1 https://github.com/LineageOS/android_vendor_qcom_opensource_display -b lineage-20.0 vendor/qcom/opensource/display

echo 'Cloning opensource commonsys display'
rm -rf vendor/qcom/opensource/commonsys/display && git clone --depth=1 https://github.com/LineageOS/android_vendor_qcom_opensource_display-commonsys -b lineage-20.0 vendor/qcom/opensource/commonsys/display

echo 'Cloning opensource commonsys-intf display'
rm -rf vendor/qcom/opensource/commonsys-intf/display && git clone --depth=1 https://github.com/LineageOS/android_vendor_qcom_opensource_display-commonsys-intf -b lineage-20.0 vendor/qcom/opensource/commonsys-intf/display

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b thirteen-leica vendor/xiaomi/haydn-miuicamera

# Faceunlock
echo 'Fixing faceunlock conflict with vendor libs'
cd external/faceunlock
wget https://raw.githubusercontent.com/Astridxx/Patch-Haydn/main/Pixys/0001-Fix-naming-conflict-with-vendor-libs.patch
patch -p1 <0001-Fix-naming-conflict-with-vendor-libs.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
