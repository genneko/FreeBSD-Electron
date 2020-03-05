--- chrome/common/channel_info.h.orig	2020-03-03 07:02:39 UTC
+++ chrome/common/channel_info.h
@@ -55,7 +55,7 @@ version_info::Channel GetChannelByName(const std::stri
 std::string GetChannelSuffixForDataDir();
 #endif
 
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) && !defined(OS_CHROMEOS)) || defined(OS_BSD)
 // Returns the channel-specific filename of the desktop shortcut used to launch
 // the browser.
 std::string GetDesktopName(base::Environment* env);
