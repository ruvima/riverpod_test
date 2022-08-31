import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSettingsProvider =
    StateNotifierProvider<ColorSettingsNotifier, ColorSettings>((ref) {
  return ColorSettingsNotifier(ColorSettings(false));
});

class ColorSettings {
  final bool useRed;
  ColorSettings(this.useRed);
}

class ColorSettingsNotifier extends StateNotifier<ColorSettings> {
  ColorSettingsNotifier(ColorSettings state) : super(state);

  void setRed() {
    state = ColorSettings(true);
  }

  void unRed() {
    state = ColorSettings(false);
  }
}
