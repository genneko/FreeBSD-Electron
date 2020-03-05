--- services/network/network_sandbox_hook_linux.cc.orig	2020-03-03 07:03:12 UTC
+++ services/network/network_sandbox_hook_linux.cc
@@ -14,6 +14,7 @@ using sandbox::syscall_broker::MakeBrokerCommandSet;
 namespace network {
 
 bool NetworkPreSandboxHook(service_manager::SandboxLinux::Options options) {
+#if !defined(OS_BSD)
   auto* instance = service_manager::SandboxLinux::GetInstance();
 
   // TODO(tsepez): remove universal permission under filesytem root.
@@ -32,6 +33,7 @@ bool NetworkPreSandboxHook(service_manager::SandboxLin
       service_manager::SandboxLinux::PreSandboxHook(), options);
 
   instance->EngageNamespaceSandboxIfPossible();
+#endif // defined(OS_BSD)
   return true;
 }
 
