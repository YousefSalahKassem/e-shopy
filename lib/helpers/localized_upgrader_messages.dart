import 'package:flutter_translate/flutter_translate.dart';
import 'package:upgrader/upgrader.dart';

class LocalizedMessages extends UpgraderMessages {
  /// Override the message function to provide custom language localization.
  ///
  final String code;

  LocalizedMessages({this.code = 'en'});
  @override
  String message(UpgraderMessage messageKey) {
    if (code == 'en') {
      switch (messageKey) {
        case UpgraderMessage.body:
          return 'A new version of ${translate('app_name')} is available!';
        case UpgraderMessage.buttonTitleIgnore:
          return 'Ignore';
        case UpgraderMessage.buttonTitleLater:
          return 'Later';
        case UpgraderMessage.buttonTitleUpdate:
          return 'Update Now';
        case UpgraderMessage.prompt:
          return 'A new version is out';
        case UpgraderMessage.title:
          return 'App Update';
      }
    } else {
      switch (messageKey) {
        case UpgraderMessage.body:
          return 'نسخة جديدة من ${translate('app_name')} متوفرة!';
        case UpgraderMessage.buttonTitleIgnore:
          return 'تجاهل';
        case UpgraderMessage.buttonTitleLater:
          return 'لاحقاً';
        case UpgraderMessage.buttonTitleUpdate:
          return 'التحديث الآن';
        case UpgraderMessage.prompt:
          return 'نسخة جديدة متوفرة';
        case UpgraderMessage.title:
          return 'تحديث التطبيق';
      }
    }
    // Messages that are not provided above can still use the default values.
    return super.message(messageKey);
  }
}
