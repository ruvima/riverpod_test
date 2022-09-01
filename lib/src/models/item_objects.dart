import 'package:riverpod_test/src/routes/routes.dart';

class ItemObjects {
  final String title;
  final String routeName;
  final String description;

  ItemObjects(
      {required this.title,
      required this.routeName,
      required this.description});

  static List<ItemObjects> getList() {
    final list = <ItemObjects>[];
    list.add(
      ItemObjects(
          title: 'Provider',
          routeName: Routes.providerScreen,
          description:
              'Messages from Consumer, ConsumerWidget, ConsumerStatefulWidget'),
    );
    list.add(
      ItemObjects(
          title: 'Change Notifier',
          routeName: Routes.changeNotifierProviderScreen,
          description: 'Bulb switch'),
    );
    list.add(
      ItemObjects(
          title: 'State Provider',
          routeName: Routes.stateProviderScreen,
          description: 'Counter increment, reset and show alert message'),
    );
    list.add(
      ItemObjects(
          title: 'State Notifier Provider',
          routeName: Routes.stateNotifierProviderScreen,
          description: 'Random number generator'),
    );
    list.add(
      ItemObjects(
          title: 'Future Provider',
          routeName: Routes.futureProviderScreen,
          description: 'Receive a delayed message'),
    );
    list.add(
      ItemObjects(
          title: 'Stream Provider',
          routeName: Routes.streamProviderScreen,
          description: 'Number that increases until it reaches 100'),
    );

    return list;
  }
}
