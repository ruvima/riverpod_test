import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bulbProvider = ChangeNotifierProvider<BulbState>(
  (ref) => BulbState(),
);

class BulbState extends ChangeNotifier {
  bool _isOn;
  BulbState([this._isOn = false]);

  bool get isOn => _isOn;

  void bulbSwitch() {
    _isOn = !_isOn;
    notifyListeners();
  }
}

class ChangeNotifierProviderScreen extends ConsumerWidget {
  const ChangeNotifierProviderScreen({Key? key}) : super(key: key);

  void _switch({required WidgetRef ref}) {
    ref.read(bulbProvider).bulbSwitch();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bulbState = ref.watch(bulbProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bulbState.isOn
                ? const Icon(
                    Icons.lightbulb,
                    size: 150,
                    color: Colors.amber,
                  )
                : const Icon(
                    Icons.lightbulb_outline,
                    size: 150,
                    color: Colors.amber,
                  ),
            Switch(
              value: bulbState.isOn,
              onChanged: (value) => _switch(ref: ref),
            ),
          ],
        ),
      ),
    );
  }
}
