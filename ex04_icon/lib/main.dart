import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'ex04_icon'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Row(    // 아이콘은 상수이기 때문에 아래 모두 상수 처리하지 말고
                          // 여기서 상수처리하면 됨.
        children: [       // 우리가 만들고 자동으로 완성된 코드에는 앞에 있는 <Widget>이 없다.
                          // 없어도 된다는 뜻.
          Icon(
            Icons.camera_alt,
            color: Colors.red,
            size: 35.0,
          ),
          Icon(
            Icons.camera_alt,
            color: Colors.orange,
            size: 35.0,
          ),
          Icon(
            Icons.zoom_in_sharp,
            color: Color.fromARGB(255, 55, 126, 184),
            size: 35.0,
          ),
          Icon(
            Icons.zoom_in_sharp,
            color: Color.fromARGB(255, 55, 126, 184),
            size: 35.0,
          ),
          Icon(
            Icons.where_to_vote_outlined,
            color: Color.fromARGB(255, 36, 218, 118),
            size: 35.0,
          ),
          Icon(
            Icons.vertical_align_bottom_sharp,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.upgrade_sharp,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.undo_sharp,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.thumb_up_outlined,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.thumb_down_outlined,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.textsms_outlined,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),
          Icon(
            Icons.search_sharp,
            color: Color.fromARGB(255, 52, 255, 103),
            size: 35.0,
          ),

        ],
      ),
    );
  }
}