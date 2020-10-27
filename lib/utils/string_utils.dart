import 'dart:convert';

import 'dart:math';

final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

extension FormatString on num {
  String toReadableMoney() => '￥${(this / 100).toStringAsFixed(2)}';
  String toReadableDatetime() => DateTime.fromMillisecondsSinceEpoch(this * 1000).toString().split('.')[0];
}

extension SafeEmpty on String {
  bool isSafeNotEmpty() => this != null && this.isNotEmpty;
  bool isSafeEmpty() => (this == null) || (this != null && this.isEmpty);
}

class UrlSafeBase64Helper {
  static final _base64SafeEncoder = const Base64Codec.urlSafe();

  String encodeStringToBase64UrlSafeString(final String url) => _base64SafeEncoder.encode(utf8.encode(url));

  String decodeFromBase64UrlSafeEncodedString(String str) => utf8.decode(_base64SafeEncoder.decode(str));
}