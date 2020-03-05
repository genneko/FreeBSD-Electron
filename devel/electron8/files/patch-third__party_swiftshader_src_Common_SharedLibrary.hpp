--- third_party/swiftshader/src/Common/SharedLibrary.hpp.orig	2020-03-03 07:10:20 UTC
+++ third_party/swiftshader/src/Common/SharedLibrary.hpp
@@ -97,7 +97,7 @@ void *loadLibrary(const std::string &libraryDirectory,
 
 	inline void *getLibraryHandle(const char *path)
 	{
-		#ifdef __ANDROID__
+		#if defined( __ANDROID__) || defined(__FreeBSD__)
 			// bionic doesn't support RTLD_NOLOAD before L
 			return dlopen(path, RTLD_NOW | RTLD_LOCAL);
 		#else
