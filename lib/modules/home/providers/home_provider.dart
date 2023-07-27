import 'package:flutter_nop/flutter_nop.dart';
import 'package:nop/nop.dart';

class HomeProvider with NopLifecycle {
  @override
  void nopInit() {
    super.nopInit();
    Log.i('init. $groupId');
  }

  @override
  void nopDispose() {
    super.nopDispose();
    Log.i('dispose.');
  }

  void homeLog() {
    Log.e('$label isGlobal: $isGlobal |groupId: $groupId');
  }
}
