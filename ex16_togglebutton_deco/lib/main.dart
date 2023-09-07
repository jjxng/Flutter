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
      home: const MyHomePage(title: 'ex16_togglebutton_deco'),
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
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
            // 여러개 선택 가능한 토글
            const Text('multi-select', textScaleFactor: 2),
            ToggleButtons(
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected1[index] = !isSelected1[index];
                  print('isSelected1 : $isSelected1');
                });
              },
              isSelected: isSelected1,
            ),
            const SizedBox(height: 20),
            // 한 개만 선택 가능한 토글
            const Text('single select', textScaleFactor: 2),
            ToggleButtons(
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
              onPressed: (int index) {
                setState(() {
                  // 항목 중 하나만 선택할 수 있도록 for문으로 처리
                  for (var i = 0; i < isSelected2.length; i++) {
                    if (i == index) {
                      // 선택한 항목만 활성화
                      isSelected2[i] = true;
                    } else {
                      // 반복에 의해 나머지는 비활성화
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2 : $isSelected2');   // 로그용
                });
              },
              isSelected: isSelected2,
            ),
            const SizedBox(height: 20),
            // fancy
            const Text('fancy', textScaleFactor: 2),
            ToggleButtons(
              borderColor: Colors.blueGrey,
              borderWidth: 10,
              selectedBorderColor: Colors.blue,
              splashColor: Colors.yellow,   // 선택될 때 잠시 보인다.
              color: Colors.red,    // 노멀 상태 그림의 색
              selectedColor: Colors.green,    // 선택된 그림의 색
              fillColor: Colors.yellow, // 선택된 버튼의 배경색
              // disabledColor,
              borderRadius: BorderRadius.circular(10),  // 제대로 적용 안 됨
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Text('cake'),   // 아이콘 대신 텍스트도 설정 가능
              ],
              onPressed: (int index) {
                setState(() {
                  for (var i = 0; i < isSelected3.length; i++) {
                    if (i == index) {
                      isSelected3[i] = true;
                    } else {
                      isSelected3[i] = false;
                    }
                  }
                  print('isSelected3 : $isSelected3');
                });
              },
              isSelected: isSelected3,
            ),

          ],
        ),
      ),
    );
  }
}