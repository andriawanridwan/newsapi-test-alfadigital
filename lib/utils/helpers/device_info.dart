import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getOsAndVersion() async {
    String info = '';
    try {
      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.release;
        info = 'Android $release';
      } else if (Platform.isIOS) {
        var iosInfo = await DeviceInfoPlugin().iosInfo;
        var systemName = iosInfo.systemName;
        var version = iosInfo.systemVersion;
        info = '$systemName $version';
      }
    } on PlatformException {
      info = "Failed to get platform version.";
    }
    return info;
  }
}
