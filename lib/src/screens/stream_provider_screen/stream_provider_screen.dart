import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/src/screens/stream_provider_screen/provider/stream_provider.dart';

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
            final streamValue = ref.watch(streamProvider);
            return Center(
              child: streamValue.when(
                data: (data) {
                  return Text(
                    data.toString(),
                    style: const TextStyle(fontSize: 25),
                  );
                },
                error: (e, st) => Text('Error $e'),
                loading: () => const CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
