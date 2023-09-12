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
      home: const MyHomePage(title: 'ex34_gridview3'),
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
  late List<Person> persons;

  @override
  void initState() {
    super.initState();
    persons = [];
    for (int i = 0; i < 15; i++) {
      persons.add(Person(i + 21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        // width: double.infinity,
        height: 400.0,    // 컨테이너로 감싸서 크기를 지정하면 스크롤 가능
        // color: Colors.amber,
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,    // 자동으로 크기가 계산된다.
          childAspectRatio: 0.7,    // 가로, 세로 비율
          children: getGridPage(),
        ),
      ),
    );
  }
  List<Widget> getGridPage() {
    List<Widget> grid = [];
    for (int i = 0; i < persons.length; i++) {
      Widget myWiget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        color: Colors.blue[100],
        child: PersonTitle(persons[i], i),
      );
    grid.add(myWiget);
    }
    return grid;
  }
}

// 데이터로 사용할 클래스 ===================================================
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}

// PersonTitle 정의 =========================================================
class PersonTitle extends StatelessWidget {
  final Person _person;
  final int index;

  const PersonTitle(this._person, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[100],
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          print('$index번 타일 클릭됨');
        },
        child: SizedBox(
          width: 140,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Text(
                      _person.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "'${_person.age}세'",
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              // 각 타일별로 존재하는 버튼
              ElevatedButton(
                child: const Text('ElevatedButton',
                  style: TextStyle(fontSize: 14)),
                onPressed: () => _onClick(index),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onClick(int index) {
    print('$index 클릭됨');
  }
}