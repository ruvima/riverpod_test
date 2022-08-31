import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/src/screens/state_notifier_screen/provider/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSetting = ref.watch(colorSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State notifier Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                  value: colorSetting.useRed,
                  onChanged: (isChecked) =>
                      onCheckBoxPressed(isChecked, context, ref),
                ),
                Text('Rojo')
              ],
            ),
            Container(
              color: colorSetting.useRed ? Colors.red : Colors.black38,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}

void onCheckBoxPressed(
  bool? isChecked,
  BuildContext context,
  WidgetRef ref,
) {
  var colorSettingsNotifier = ref.read(colorSettingsProvider.notifier);
  if (isChecked!) {
    colorSettingsNotifier.setRed();
  } else {
    colorSettingsNotifier.unRed();
  }
}
