import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum City {
  houston,
  chicago,
  denver,
}

typedef WeatherCity = String;

const unknownCity = '🤷';

Future<WeatherCity> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () => {
      City.houston: '🌞',
      City.chicago: '☔',
      City.denver: '🥶',
    }[city]!,
  );
}

final cityProvider = StateProvider<City?>((_) => null);

final weatherProvider = FutureProvider<WeatherCity>(
  (ref) {
    final city = ref.watch(cityProvider);

    if (city != null) {
      return getWeather(city);
    } else {
      return unknownCity;
    }
  },
);

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Screen'),
      ),
      body: Column(
        children: [
          weather.when(
            data: (data) => Text(
              data,
              style: const TextStyle(fontSize: 40),
            ),
            error: (_, __) => const Text('Error'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ListView.builder(
            primary: true,
            shrinkWrap: true,
            itemCount: City.values.length,
            itemBuilder: (context, index) {
              final city = City.values[index];
              final selectedCity = ref.watch(cityProvider);
              final isSelected = city == selectedCity;
              return ListTile(
                title: Text(city.name),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () {
                  ref.read(cityProvider.notifier).state = city;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
