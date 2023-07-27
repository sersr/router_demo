import 'package:flutter_nop/flutter_nop.dart';
import 'package:nop/nop.dart';

import '../../home/providers/home_provider.dart';

class DetailOuter with NopLifecycle {
  static final outer = DetailOuter();

  @override
  bool get singletonEnabled => true;

  @override
  void nopInit() {
    super.nopInit();
    Log.w('$label init.');
  }

  @override
  void reInitSingleton() {
    Log.w('$label reInitSingleton.');
    super.reInitSingleton();
  }

  @override
  void onPop() {
    Log.e('$label popped.');
    super.onPop();
  }

  void log() {
    final listener = NopLifecycle.checkIsNopLisenter(this);
    Log.e('${listener?.label} ${listener?.length}');
  }
}

class DetailProvider with NopLifecycle {
  void log() {
    Log.e('$label isGlobal: $isGlobal |groupId: $groupId |popped: $popped.');

    getType<HomeProvider>(group: groupId).homeLog();
  }

  @override
  void onPop() {
    super.onPop();
    Log.w('popped.');
  }

  @override
  void nopInit() {
    super.nopInit();

    getType<HomeProvider>(group: groupId);
  }

  @override
  void nopDispose() {
    Log.w('dispose.');
    super.nopDispose();
  }
}
