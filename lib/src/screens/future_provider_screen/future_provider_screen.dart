import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/src/screens/future_provider_screen/provider/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureValue = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Screen'),
      ),
      body: Center(
        child: futureValue.when(
          data: (data) => Text(
            data,
            style: const TextStyle(fontSize: 25),
          ),
          error: (e, st) => Text('ERROR: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
