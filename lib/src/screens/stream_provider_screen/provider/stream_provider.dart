import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(const Duration(milliseconds: 500), (count) {
    return count++;
  }).take(101);
});
