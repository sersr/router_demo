import 'package:flutter_nop/flutter_nop.dart';
import 'package:nop/nop.dart';

class SingletonProvider with NopLifecycle {
  static final singleton = SingletonProvider();

  @override
  bool get singletonEnabled => true;

  void log() {
    Log.w(label);
  }

  @override
  void nopInit() {
    super.nopInit();
    Log.e('$label init.');
  }

  @override
  void onPop() {
    super.onPop();
    Log.e('$label popped.');
  }

  @override
  void reInitSingleton() {
    super.reInitSingleton();
    Log.e('$label reInitSingleton.');
  }

  @override
  void nopDispose() {
    super.nopDispose();
    Log.e('$label dispose.');
  }
}
