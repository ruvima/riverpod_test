import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/src/routes/routes.dart';
import 'package:riverpod_test/src/screens/change_notifier_screen/change_notifier_screen.dart';
import 'package:riverpod_test/src/screens/home_screen.dart';
import 'package:riverpod_test/src/screens/provider_screen/provider_screen.dart';
import 'package:riverpod_test/src/screens/state_notifier_screen/state_notifier_screen.dart';
import 'package:riverpod_test/src/screens/state_provider_screen/state_provider_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (_) => const HomeScreen(),
        Routes.providerScreen: (_) => const ProviderScreen(),
        Routes.changeNotifierProviderScreen: (_) =>
            const ChangeNotifierProviderScreen(),
        Routes.stateProviderScreen: (_) => const StateProviderScreen(),
        Routes.stateNotifierProviderScreen: (_) =>
            const StateNotifierProviderScreen(),
      },
    );
  }
}
