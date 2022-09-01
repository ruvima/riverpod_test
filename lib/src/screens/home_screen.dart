import 'package:flutter/material.dart';
import 'package:riverpod_test/src/models/item_objects.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ItemObjects.getList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final itemList = list[index];
            return Card(
              elevation: 1,
              child: ListTile(
                title: Text(itemList.title),
                subtitle: Text(itemList.description),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.pushNamed(context, itemList.routeName),
              ),
            );
          },
          itemCount: list.length),
    );
  }
}
