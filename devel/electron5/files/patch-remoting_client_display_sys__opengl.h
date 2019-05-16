--- remoting/client/display/sys_opengl.h.orig	2019-04-08 08:18:26 UTC
+++ remoting/client/display/sys_opengl.h
@@ -9,7 +9,7 @@
 
 #if defined(OS_IOS)
 #include <OpenGLES/ES3/gl.h>
-#elif defined(OS_LINUX)
+#elif defined(OS_LINUX) || defined(OS_BSD)
 #define GL_GLEXT_PROTOTYPES
 #include <GL/gl.h>
 #include <GL/glext.h>
