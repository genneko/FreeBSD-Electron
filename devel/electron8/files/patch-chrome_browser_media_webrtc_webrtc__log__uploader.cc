--- chrome/browser/media/webrtc/webrtc_log_uploader.cc.orig	2020-03-03 07:02:29 UTC
+++ chrome/browser/media/webrtc/webrtc_log_uploader.cc
@@ -358,6 +358,8 @@ void WebRtcLogUploader::SetupMultipart(
   const char product[] = "Chrome_Android";
 #elif defined(OS_CHROMEOS)
   const char product[] = "Chrome_ChromeOS";
+#elif defined(OS_FREEBSD)
+  const char product[] = "Chrome_FreeBSD";
 #else
 #error Platform not supported.
 #endif
