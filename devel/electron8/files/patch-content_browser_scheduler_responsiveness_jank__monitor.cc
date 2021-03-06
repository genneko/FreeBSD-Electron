--- content/browser/scheduler/responsiveness/jank_monitor.cc.orig	2020-03-03 07:02:59 UTC
+++ content/browser/scheduler/responsiveness/jank_monitor.cc
@@ -321,7 +321,7 @@ void JankMonitor::ThreadExecutionState::DidRunTaskOrEv
     // in context menus, among others). Simply ignore the mismatches for now.
     // See https://crbug.com/929813 for the details of why the mismatch
     // happens.
-#if !defined(OS_CHROMEOS) && defined(OS_LINUX) && defined(USE_OZONE)
+#if !defined(OS_CHROMEOS) && (defined(OS_LINUX) || defined(OS_BSD)) && defined(USE_OZONE)
     task_execution_metadata_.clear();
 #endif
     return;
