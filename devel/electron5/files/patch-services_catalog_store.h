--- services/catalog/store.h.orig	2019-04-08 08:33:02 UTC
+++ services/catalog/store.h
@@ -38,6 +38,7 @@ class Store {
   static const char kRequiredFilesKey_PlatformValue_MacOSX[];
   static const char kRequiredFilesKey_PlatformValue_Android[];
   static const char kRequiredFilesKey_PlatformValue_Fuchsia[];
+  static const char kRequiredFilesKey_PlatformValue_FreeBSD[];
 };
 
 }  // namespace catalog
