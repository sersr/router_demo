import 'package:flutter_test/flutter_test.dart';

void main() {
  test('reg', () {
    final reg = RegExp('Page\$');

    final s = 'detail02Page'.replaceAll(reg, '');
    // ignore: avoid_print
    print(s);
  });
}
