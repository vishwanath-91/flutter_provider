import 'package:flutter/material.dart';
import 'package:generated_route_access/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Counter _counter = Counter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme().copyWith(color: Colors.deepOrange),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const Home(),
            ),
          );
        } else if (settings.name == '/counter') {
          return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const ShowMeCounter(),
            ),
          );
        } else {
          return null;
        }
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/counter'),
              child: const Text('Show Me Router'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.read<Counter>().incrementFunction(),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

//xxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxx

class ShowMeCounter extends StatefulWidget {
  const ShowMeCounter({super.key});

  @override
  State<ShowMeCounter> createState() => _ShowMeCounterState();
}

class _ShowMeCounterState extends State<ShowMeCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<Counter>().counter.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
