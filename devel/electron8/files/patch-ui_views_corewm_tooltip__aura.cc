--- ui/views/corewm/tooltip_aura.cc.orig	2020-03-03 07:04:29 UTC
+++ ui/views/corewm/tooltip_aura.cc
@@ -43,7 +43,7 @@ constexpr int kVerticalPaddingBottom = 5;
 
 // TODO(varkha): Update if native widget can be transparent on Linux.
 bool CanUseTranslucentTooltipWidget() {
-#if (defined(OS_LINUX) && !defined(OS_CHROMEOS)) || defined(OS_WIN)
+#if (defined(OS_LINUX) && !defined(OS_CHROMEOS)) || defined(OS_WIN) || defined(OS_BSD)
   return false;
 #else
   return true;
