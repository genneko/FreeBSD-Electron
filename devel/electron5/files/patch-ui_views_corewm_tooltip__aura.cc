--- ui/views/corewm/tooltip_aura.cc.orig	2019-04-08 08:33:23 UTC
+++ ui/views/corewm/tooltip_aura.cc
@@ -34,7 +34,7 @@ const int kCursorOffsetY = 15;
 
 // TODO(varkha): Update if native widget can be transparent on Linux.
 bool CanUseTranslucentTooltipWidget() {
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
   return false;
 #else
   return true;
