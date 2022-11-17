import 'dart:math';

import 'package:flutter/material.dart';
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

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNumber = ref.watch(randomNumberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$randomNumber',
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
                onPressed: () {
                  ref.read(randomNumberProvider.notifier).generateRandom();
                },
                child: const Text('Generate Number'))
          ],
        ),
      ),
    );
  }
}

// class StateNotifierProviderScreen extends ConsumerWidget {
//   const StateNotifierProviderScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final colorSetting = ref.watch(colorSettingsProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('State notifier Provider'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 Checkbox(
//                   value: colorSetting.useRed,
//                   onChanged: (isChecked) =>
//                       onCheckBoxPressed(isChecked, context, ref),
//                 ),
//                 Text('Rojo')
//               ],
//             ),
//             Container(
//               color: colorSetting.useRed ? Colors.red : Colors.black38,
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.all(10),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void onCheckBoxPressed(
//   bool? isChecked,
//   BuildContext context,
//   WidgetRef ref,
// ) {
//   var colorSettingsNotifier = ref.read(colorSettingsProvider.notifier);
//   if (isChecked!) {
//     colorSettingsNotifier.setRed();
//   } else {
//     colorSettingsNotifier.unRed();
//   }
// }
