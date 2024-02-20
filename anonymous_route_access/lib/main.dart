// main.dart
import 'package:anonymous_route_access/provider/counter.dart';
import 'package:anonymous_route_access/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (Countercontext) {
                    return ChangeNotifierProvider.value(
                      value: context.read<Counter>(),
                      child: const ShowMeCounter(),
                    );
                  },
                ));
              },
              child: const Text('show me counter'),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<Counter>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () => value.increment(),
                child: const Text('Increment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
