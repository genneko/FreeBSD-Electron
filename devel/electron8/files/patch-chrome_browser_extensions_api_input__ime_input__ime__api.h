--- chrome/browser/extensions/api/input_ime/input_ime_api.h.orig	2020-03-03 07:02:28 UTC
+++ chrome/browser/extensions/api/input_ime/input_ime_api.h
@@ -31,7 +31,7 @@
 
 #if defined(OS_CHROMEOS)
 #include "chrome/browser/extensions/api/input_ime/input_ime_api_chromeos.h"
-#elif defined(OS_LINUX) || defined(OS_WIN)
+#elif defined(OS_LINUX) || defined(OS_WIN) || defined(OS_BSD)
 #include "chrome/browser/extensions/api/input_ime/input_ime_api_nonchromeos.h"
 #endif  // defined(OS_CHROMEOS)
 
