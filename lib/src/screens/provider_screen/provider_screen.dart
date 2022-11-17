// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final message1Provider = Provider<String>((ref) => 'Consumer');
final message2Provider = Provider<String>((ref) => 'ConsumerWidget');
final message3Provider = Provider<String>((ref) => 'ConsumerStatefulWidget');

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _WithConsumer(),
          _WithConsumerWidget(),
          _WithConsumerStatefulWidget(),
        ],
      ),
    );
  }
}

class _WithConsumer extends StatelessWidget {
  const _WithConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final message1 = ref.read(message1Provider);
        return Center(
          child: Text(
            message1,
            style: const TextStyle(fontSize: 25),
          ),
        );
      },
    );
  }
}

class _WithConsumerWidget extends ConsumerWidget {
  const _WithConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message2 = ref.read(message2Provider);
    return Center(
      child: Text(
        message2,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}

class _WithConsumerStatefulWidget extends ConsumerStatefulWidget {
  const _WithConsumerStatefulWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __WithConsumerStatefulWidgetState();
}

class __WithConsumerStatefulWidgetState
    extends ConsumerState<_WithConsumerStatefulWidget> {
  late String message3;
  @override
  void initState() {
    message3 = ref.read(message3Provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message3,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
