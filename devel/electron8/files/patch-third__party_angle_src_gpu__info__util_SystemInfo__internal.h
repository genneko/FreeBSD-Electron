--- third_party/angle/src/gpu_info_util/SystemInfo_internal.h.orig	2020-03-03 07:05:28 UTC
+++ third_party/angle/src/gpu_info_util/SystemInfo_internal.h
@@ -14,8 +14,13 @@
 namespace angle
 {
 
+bool CollectMesaCardInfo(std::vector<GPUDeviceInfo> *devices);
+
 // Defined in SystemInfo_libpci when GPU_INFO_USE_LIBPCI is defined.
 bool GetPCIDevicesWithLibPCI(std::vector<GPUDeviceInfo> *devices);
+#if defined(__FreeBSD__)
+bool GetPCIDevicesFreeBSD(std::vector<GPUDeviceInfo> *devices);
+#endif
 // Defined in SystemInfo_x11 when GPU_INFO_USE_X11 is defined.
 bool GetNvidiaDriverVersionWithXNVCtrl(std::string *version);
 
