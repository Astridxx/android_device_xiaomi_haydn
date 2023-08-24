echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/Astridxx/android_device_xiaomi_sm8350-common -b Octavi-13 device/xiaomi/sm8350-common

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

# Sepolicy
echo 'Cloning sepolicy vndr'
rm -rf device/qcom/sepolicy_vndr-legacy-um && git clone https://github.com/Astridxx/android_device_qcom_sepolicy_vndr -b octavi-legacy-um device/qcom/sepolicy_vndr-legacy-um

# Health
echo 'Cloning health ext'
git clone --depth=1 https://github.com/LineageOS/android_vendor_qcom_opensource_healthd-ext -b lineage-20.0 vendor/qcom/opensource/healthd-ext

# Telephony
echo 'Cloning vendor codeaurora telephony'
rm -rf vendor/codeaurora/telephony && git clone --depth=1 https://github.com/LineageOS/android_vendor_codeaurora_telephony -b lineage-20.0 vendor/codeaurora/telephony

# Display
echo 'Cloning display hal'
rm -rf hardware/qcom-caf/sm8350/display && git clone --depth=1 https://github.com/LineageOS/android_hardware_qcom_display -b lineage-20.0-caf-sm8350 hardware/qcom-caf/sm8350/display

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b thirteen-leica vendor/xiaomi/haydn-miuicamera

echo 'Updating kernel flags on vendor octavi'
cd vendor/octavi
wget https://raw.githubusercontent.com/Astridxx/Patch-Haydn/main/Octavi/0001-Update-kernel-flags.patch
patch -p1 <0001-Update-kernel-flags.patch
cd ../..

echo 'Adding lowest possible refresh rate in doze mode'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-Haydn/main/Octavi/0002-Use-lowest-possible-refresh-rate-in-doze-mode.patch
patch -p1 <0002-Use-lowest-possible-refresh-rate-in-doze-mode.patch
cd ../..

echo 'Adding Slowmo fix for Leica camera'
cd hardware/interfaces
wget https://raw.githubusercontent.com/Astridxx/Patch-Haydn/main/Octavi/0003-Update-HIDL-overrideFormat-from-HAL.patch
patch -p1 <0003-Update-HIDL-overrideFormat-from-HAL.patch
cd ../..

# Faceunlock
echo 'Fixing faceunlock conflict with vendor libs'
cd external/faceunlock
wget https://raw.githubusercontent.com/Astridxx/Patch-Haydn/main/Octavi/0004-Fix-naming-conflict-with-vendor-libs.patch
patch -p1 <0004-Fix-naming-conflict-with-vendor-libs.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
