import 'package:flutter/material.dart';
import 'package:riverpod_test/src/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.providerScreen);
              },
              child: const Text('Provider'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes.changeNotifierProviderScreen);
              },
              child: const Text('Change Notifier'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.stateProviderScreen);
              },
              child: const Text('State Provider'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes.stateNotifierProviderScreen);
              },
              child: const Text('State Notifier Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
