--- components/storage_monitor/removable_device_constants.h.orig	2020-03-03 07:02:57 UTC
+++ components/storage_monitor/removable_device_constants.h
@@ -15,7 +15,7 @@ namespace storage_monitor {
 extern const char kFSUniqueIdPrefix[];
 extern const char kVendorModelSerialPrefix[];
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
 extern const char kVendorModelVolumeStoragePrefix[];
 #endif
 
