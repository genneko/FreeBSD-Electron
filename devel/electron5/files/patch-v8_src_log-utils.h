--- v8/src/log-utils.h.orig	2019-04-08 08:34:40 UTC
+++ v8/src/log-utils.h
@@ -16,6 +16,8 @@
 #include "src/flags.h"
 #include "src/ostreams.h"
 
+#include <stdarg.h>
+
 namespace v8 {
 namespace internal {
 
