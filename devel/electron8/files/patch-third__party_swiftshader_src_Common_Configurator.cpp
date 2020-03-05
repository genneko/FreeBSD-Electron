--- third_party/swiftshader/src/Common/Configurator.cpp.orig	2020-03-03 07:10:20 UTC
+++ third_party/swiftshader/src/Common/Configurator.cpp
@@ -42,6 +42,9 @@ namespace sw
 
 	bool Configurator::readFile()
 	{
+#if defined(__FreeBSD__)
+                return false;
+#endif      
 		#if defined(__unix__)
 			if(access(path.c_str(), R_OK) != 0)
 			{
