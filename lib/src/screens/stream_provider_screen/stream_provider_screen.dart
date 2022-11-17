import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List names = [
  'Juliet',
  'Lily ',
  'Olive ',
  'Emmett',
  'Miles',
  'Oscar',
  'William ',
  'George',
  'Amelia',
];

final tickerProvider = StreamProvider.autoDispose<int>(
  (_) => Stream.periodic(
    const Duration(seconds: 1),
    (i) => i + 1,
  ),
);

final countProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(tickerProvider.stream).map(
        (count) => names.getRange(0, count),
      ),
);

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stream Provider Screen'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final namesProvider = ref.watch(countProvider);
            return namesProvider.when(
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      data.elementAt(index),
                    ),
                  );
                },
              ),
              error: (_, __) => const Center(child: Text('END')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
