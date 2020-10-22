import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  /// 获取多个权限结果
  static Future request(List permissionName) async {
    List<Permission> _list = [];
    for (var item1 in permissionName) {
      for (var item2 in Permission.values) {
        if (item2.toString() == item1) {
          _list.add(item2);
        }
      }
    }

    Map<Permission, PermissionStatus> statuses = await _list.request();

    Map<String, int> status = {};
    statuses.forEach((key, value) {
      int state = 0;
      if (value.toString() == 'PermissionStatus.granted') {
        state = 1;
      }
      if (value.toString() == 'PermissionStatus.permanentlyDenied') {
        state = -1;
      }
      status[key.toString()] = state;
    });

    return status;
  }

  /// 获取单个权限结果
  static Future check(String permissionName) async {
    Map<String, int> _status = await request([permissionName]);
    return _status[permissionName];
  }

  /// 打开设置页
  static Future openSetting() {
    return openAppSettings();
  }
}