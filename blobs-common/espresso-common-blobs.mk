# Copyright (C) 2015 SlimRoms
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

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/bin/gpsd:system/bin/gpsd \
    device/samsung/espressowifi/blobs-common/proprietary/system/bin/smc.ini:system/bin/smc.ini \
    device/samsung/espressowifi/blobs-common/proprietary/system/bin/smc_pa.ift:system/bin/smc_pa.ift

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/bcmdhd_apsta.bin:system/etc/wifi/bcmdhd_apsta.bin \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/bcmdhd_mfg.bin:system/etc/wifi/bcmdhd_mfg.bin \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/bcmdhd_p2p.bin:system/etc/wifi/bcmdhd_p2p.bin \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/bcmdhd_sta.bin:system/etc/wifi/bcmdhd_sta.bin \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/lib/hw/gps.manta.so:system/lib/hw/gps.omap4.so

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/lib/libsecnativefeature.so:system/lib/libsecnativefeature.so

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/firmware/BCM4330.hcd:system/vendor/firmware/BCM4330.hcd \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/firmware/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/lib/libdrmdecrypt.so:system/lib/libdrmdecrypt.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/drm/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libWVStreamControlAPI_L3.so:system/vendor/lib/libWVStreamControlAPI_L3.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libdrmmtkutil.so:system/vendor/lib/libdrmmtkutil.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libstlport.so:system/vendor/lib/libstlport.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libwvdrm_L3.so:system/vendor/lib/libwvdrm_L3.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/mediadrm/libwvdrmengine.so:system/vendor/lib/mediadrm/libwvdrmengine.so

PRODUCT_COPY_FILES += \
    device/samsung/espressowifi/blobs-common/proprietary/system/etc/powervr.ini:system/etc/powervr.ini \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/hw/gralloc.omap4430.so:system/vendor/lib/hw/gralloc.omap4430.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libIMGegl_SGX540_120.so:system/vendor/lib/libIMGegl_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libPVRScopeServices_SGX540_120.so:system/vendor/lib/libPVRScopeServices_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libglslcompiler_SGX540_120.so:system/vendor/lib/libglslcompiler_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libpvr2d_SGX540_120.so:system/vendor/lib/libpvr2d_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libpvrANDROID_WSEGL_SGX540_120.so:system/vendor/lib/libpvrANDROID_WSEGL_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libsrv_init_SGX540_120.so:system/vendor/lib/libsrv_init_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libsrv_um_SGX540_120.so:system/vendor/lib/libsrv_um_SGX540_120.so \
    device/samsung/espressowifi/blobs-common/proprietary/system/vendor/lib/libusc_SGX540_120.so:system/vendor/lib/libusc_SGX540_120.so
