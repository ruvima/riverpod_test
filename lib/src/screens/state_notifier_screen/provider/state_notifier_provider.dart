import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomNumberProvider = StateNotifierProvider<RandomNumberNotifier, int>(
    (ref) => RandomNumberNotifier());

class RandomNumberNotifier extends StateNotifier<int> {
  RandomNumberNotifier() : super(Random().nextInt(9999));

  void generateRandom() {
    final random = Random();
    state = random.nextInt(9999);
  }
}

// final colorSettingsProvider =
//     StateNotifierProvider<ColorSettingsNotifier, ColorSettings>((ref) {
//   return ColorSettingsNotifier(ColorSettings(false));
// });

// class ColorSettings {
//   final bool useRed;
//   ColorSettings(this.useRed);
// }

// class ColorSettingsNotifier extends StateNotifier<ColorSettings> {
//   ColorSettingsNotifier(ColorSettings state) : super(state);

//   void setRed() {
//     state = ColorSettings(true);
//   }

//   void unRed() {
//     state = ColorSettings(false);
//   }
// }
