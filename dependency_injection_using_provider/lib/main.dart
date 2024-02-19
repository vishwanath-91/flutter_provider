import 'package:dependency_injection_using_provider/provider/dog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme:
            const AppBarTheme().copyWith(color: CupertinoColors.systemBlue),
      ),
      home: ChangeNotifierProvider<Dog>(
        create: (context) => Dog(name: 'dog05', breed: 'breed05'),
        child: const MyHomePage(),
      ),
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
    final name = Provider.of<Dog>(context).name;
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider02'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name:-${context.watch<Dog>().name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const BreedAndAge()
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatefulWidget {
  const BreedAndAge({super.key});

  @override
  State<BreedAndAge> createState() => _BreedAndAgeState();
}

class _BreedAndAgeState extends State<BreedAndAge> {
  @override
  Widget build(BuildContext context) {
    final breed = Provider.of<Dog>(context).breed;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Breed:-${context.select<Dog, String>((Dog dog) => dog.breed)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Age()
      ],
    );
  }
}

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    final age = Provider.of<Dog>(context).age;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Age:-${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<Dog>().grow();
            },
            child: const Text(
              'Grow',
              style: TextStyle(
                fontSize: 20,
              ),
            ))
      ],
    );
  }
}
