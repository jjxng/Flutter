import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
      home: const MyHomePage(title: 'ex53_sound1'),
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

  AudioPlayer _audioPlayer = AudioPlayer();

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
            IconButton(
              icon: const Icon(Icons.play_circle_fill_outlined),
              iconSize: 60.0,
              color: Colors.blue,
              tooltip: "play 1",
              onPressed: () async {
                await _audioPlayer.setAsset('assets/sounds/01_1_1.mp3')
                  .then((value) async {
                    await _audioPlayer.stop().then((value) {
                      _audioPlayer.play();
                    });
                  });
              },
            ),
            const SizedBox(width: 20,),
            IconButton(
              icon: const Icon(Icons.play_circle_fill_outlined),
              iconSize: 60.0,
              color: Colors.blue,
              tooltip: "play 2",
              onPressed: () async {
                await _audioPlayer.setAsset('assets/sounds/01_1_2.mp3')
                  .then((value) async {
                    await _audioPlayer.stop().then((value) {
                      _audioPlayer.play();
                    });
                  });
              },
            ),
          ],
        ),
      ),
    );
  }
}
