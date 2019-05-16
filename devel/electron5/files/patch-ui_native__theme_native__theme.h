--- ui/native_theme/native_theme.h.orig	2019-04-08 08:33:23 UTC
+++ ui/native_theme/native_theme.h
@@ -48,7 +48,7 @@ class NATIVE_THEME_EXPORT NativeTheme {
   // The part to be painted / sized.
   enum Part {
     kCheckbox,
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
     kFrameTopArea,
 #endif
     kInnerSpinButton,
