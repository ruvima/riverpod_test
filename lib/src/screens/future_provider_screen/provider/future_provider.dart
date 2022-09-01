import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider.autoDispose<String>((ref) async {
  return Future.value(
    Future.delayed(
      const Duration(seconds: 5),
    ).then((value) => 'HOLA DESPUES DE 5 SEGUNDOS'),
  );
});
