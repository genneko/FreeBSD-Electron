--- electron/spec/chromium-spec.js.orig	2020-03-02 19:30:38 UTC
+++ electron/spec/chromium-spec.js
@@ -273,7 +273,7 @@ describe('chromium feature', () => {
     })
 
     it('can be get as context in canvas', () => {
-      if (process.platform === 'linux') {
+      if (process.platform === 'linux' || process.platform === 'freebsd') {
         // FIXME(alexeykuzmin): Skip the test.
         // this.skip()
         return
