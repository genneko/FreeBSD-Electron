--- electron/shell/common/crash_reporter/crash_reporter.cc.orig	2020-03-02 19:30:38 UTC
+++ electron/shell/common/crash_reporter/crash_reporter.cc
@@ -127,7 +127,11 @@ CrashReporter* CrashReporter::GetInstance() {
 #endif
 
 void CrashReporter::StartInstance(const gin_helper::Dictionary& options) {
+#if !defined(OS_BSD)
   auto* reporter = GetInstance();
+#else
+  CrashReporter *reporter = NULL;
+#endif
   if (!reporter)
     return;
 
