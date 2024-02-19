import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 09'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => Foo(),
        child: const Xyz(),
      ),
    );
  }
}

class Xyz extends StatefulWidget {
  const Xyz({super.key});

  @override
  State<Xyz> createState() => _XYzState();
}

class _XYzState extends State<Xyz> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Foo>(
            builder: (context, value, child) => Text(value.value),
          ),
          Consumer<Foo>(
            builder: (context, value, child) => ElevatedButton(
              onPressed: () => value.changeValue(),
              child: const Text('change value'),
            ),
          )
        ],
      ),
    );
  }
}
