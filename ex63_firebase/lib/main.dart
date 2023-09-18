import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
      home: const MyHomePage(title: 'ex63_firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String name = '';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:438255545719:android:0b76ca9c292cd146190572',
    apiKey: 'AIzaSyCSHn0plIJaB1x80UfeMkXMY9UbNUc7or4',
    projectId: 'flutter-exam-830a8',
    messagingSenderId: '438255545719',
    );

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized deault app $app');
  }

  Future<void> initializeSecodary() async {
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(
      name: name,
      options: firebaseOptions);
    print('Initialized $app');
  }

  // 현재는 하나이지만 여러 개를 사용할 경우 : FCM, Storage, Auth ...
  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp  app = Firebase.app(name);
    final FirebaseOptions? options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    await app.delete();
    print('App $name deleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Initialize default app'),
              onPressed: initializeDefault,
            ),
            ElevatedButton(
              child: const Text('Initialize secondary app'),
              onPressed: initializeSecodary,
            ),
            ElevatedButton(
              child: const Text('Get apps'),
              onPressed: apps,
            ),
            ElevatedButton(
              child: const Text('List options'),
              onPressed: options,
            ),
          ],
        ),
      ),
    );
  }
}
