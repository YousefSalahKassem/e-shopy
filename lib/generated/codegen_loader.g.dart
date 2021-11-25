// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Application name",
  "greeting": "Hello, Kortobaa!",
  "home_screen": {
    "body": "Home Screen Body Text",
    "toggle_language": "Toggle Language"
  },
  "ar": "العربية",
  "en": "English",
  "start": "Start",
  "alerts": {
    "success_login": "welcome back",
    "success_register": "your account has been created successfully",
    "success_logout": "you are logged out"
  },
  "dio_error": {
    "cancel": "Request cancelled",
    "timeout": "Request took too much time, please try again",
    "default": "Request failed to reach the server, please check your connection",
    "unknown": "Request failed for unknown reason, please try again",
    "forbidden": "You are not authorized to make that request",
    "unauthorized": "Login Failure",
    "bad_request": "Your request is invalid",
    "not_found": "What you requested is not found",
    "server_error": "There is something wrong with our servers, please wait",
    "null": "Request failed for unknown reason"
  }
};
static const Map<String,dynamic> ar = {
  "appName": "اسم التطبيق",
  "greeting": "مرحباً، قرطبة",
  "home_screen": {
    "body": "نص الصفحة الرئيسية",
    "toggle_language": "غيّر اللغة"
  },
  "ar": "العربية",
  "en": "English",
  "start": "ابدأ",
  "alerts": {
    "success_login": "مرحبا بك مرى اخري",
    "success_register": "تم انشاء الحساب بنجاح",
    "success_logout": "تم تسجيل الخروج"
  },
  "dio_error": {
    "cancel": "لقد تم إلغاء طلبك",
    "timeout": "العملية تطلبتالكثير من الوقت، برجاء المحاولة مرة أخرى",
    "default": "لقد فشل طلبك في الوصول للخادم، برجاء التحقق من الإنترنت",
    "unknown": "لقد فشل طلبك لسبب غير معلوم، برجاء المحاولة مرة أخرى",
    "unauthorized": "فشل تسجيل الدخول",
    "forbidden": "ليس لديك صلاحية لتنفيذ هذا الطلب",
    "bad_request": "طلبك غير صالح للتنفيذ",
    "not_found": "تعذّر العثور على ما طلبته",
    "server_error": "هناك مشكلة بالخادم، برجاء المحاولة لاحقاً",
    "null": "لقد فشل طلبك لسبب غير معلوم"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
