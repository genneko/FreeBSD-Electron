--- chrome/test/base/testing_browser_process.h.orig	2020-03-03 07:02:42 UTC
+++ chrome/test/base/testing_browser_process.h
@@ -116,8 +116,8 @@ class TestingBrowserProcess : public BrowserProcess {
   DownloadRequestLimiter* download_request_limiter() override;
   StartupData* startup_data() override;
 
-#if (defined(OS_WIN) || defined(OS_LINUX)) && !defined(OS_CHROMEOS)
-  void StartAutoupdateTimer() override {}
+#if (defined(OS_WIN) || defined(OS_LINUX) || defined(OS_FREEBSD)) && !defined(OS_CHROMEOS)
+  void StartAutoupdateTimer() /*override*/ {}
 #endif
 
   component_updater::ComponentUpdateService* component_updater() override;
