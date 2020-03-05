--- components/autofill/core/browser/autofill_external_delegate.cc.orig	2020-03-03 07:02:49 UTC
+++ components/autofill/core/browser/autofill_external_delegate.cc
@@ -117,7 +117,7 @@ void AutofillExternalDelegate::OnSuggestionsReturned(
 
     // Append the "Hide Suggestions" menu item for only Autofill Address and
     // Autocomplete popups.
-#if defined(OS_WIN) || defined(OS_LINUX) || defined(OS_MACOSX) || \
+#if defined(OS_WIN) || defined(OS_LINUX) || defined(OS_MACOSX) || defined(OS_BSD) || \
     defined(OS_CHROMEOS)
   if (base::FeatureList::IsEnabled(
           features::kAutofillEnableHideSuggestionsUI)) {
