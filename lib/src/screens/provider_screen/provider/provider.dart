import 'package:flutter_riverpod/flutter_riverpod.dart';

final message1Provider = Provider<String>((ref) => 'Consumer');
final message2Provider = Provider<String>((ref) => 'ConsumerWidget');
final message3Provider = Provider<String>((ref) => 'ConsumerStatefulWidget');
