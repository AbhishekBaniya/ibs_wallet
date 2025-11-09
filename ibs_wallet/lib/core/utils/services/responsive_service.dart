import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveService extends GetxService {
  static ResponsiveService get to => Get.find<ResponsiveService>();

  late double width;
  late double height;
  bool _initialized = false;

  Future<ResponsiveService> init() async {
    /// Wait until Get.context has a valid MediaQuery
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setScreenSize();
    });

    return this;
  }

  /// ✅ Safe initialization without null crash
  void _setScreenSize() {
    final ctx = Get.context;

    if (ctx == null) {
      Future.delayed(const Duration(milliseconds: 50), _setScreenSize);
      return;
    }

    final mq = MediaQuery.of(ctx);
    width = mq.size.width;
    height = mq.size.height;
    _initialized = true;

    debugPrint("✅ Responsive initialized: $width x $height");
  }

  /// ✅ Check if initialized
  bool get ready => _initialized;

  /// ✅ Breakpoints
  bool get xs => width < 360;
  bool get ms => width >= 360 && width < 420;
  bool get sm => width >= 420 && width < 600;
  bool get md => width >= 600 && width < 900;
  bool get lg => width >= 900 && width < 1200;
  bool get ml => width >= 1200 && width < 1600;
  bool get xl => width >= 1600;

  /// ✅ Dynamic font scaling
  double font(double size) {
    if (!ready) return size; // failsafe if accessed too early

    if (xs) return size * .80;
    if (ms) return size * .90;
    if (sm) return size;
    if (md) return size * 1.15;
    if (lg) return size * 1.25;
    if (ml) return size * 1.35;
    if (xl) return size * 1.45;
    return size;
  }

  /// ✅ Percent-based width & height
  double wp(double p) => ready ? width * (p / 100) : 0;
  double hp(double p) => ready ? height * (p / 100) : 0;

  /// ✅ Image / icon scaling
  double img(double value) => font(value);
}
