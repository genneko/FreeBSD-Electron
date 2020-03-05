--- electron/spec-main/visibility-state-spec.ts.orig	2020-03-02 19:30:38 UTC
+++ electron/spec-main/visibility-state-spec.ts
@@ -9,7 +9,7 @@ import { ifdescribe } from './spec-helpers';
 
 // visibilityState specs pass on linux with a real window manager but on CI
 // the environment does not let these specs pass
-ifdescribe(process.platform !== 'linux' || !isCI)('document.visibilityState', () => {
+ifdescribe((process.platform !== 'linux' && process.platform !== 'freebsd') || !isCI)('document.visibilityState', () => {
   let w: BrowserWindow
 
   afterEach(() => {
