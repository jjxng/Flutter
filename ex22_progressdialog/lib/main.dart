import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart'; // sn_progress_dialog 1.1.3

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
      home: const MyHomePage(title: 'ex22_progressdialog'),
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
  Future _normalProgress(context) async { // sn_progress_dialog 1.1.3
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);


    /// Set options
    /// Max and msg required
    pd.show(
      max: 100,
      msg: 'File Downloading...',
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));  // 속도
    }
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
              child: const Text('Show ProgressDialog',
              style: TextStyle(fontSize: 24)),
              onPressed: () => _showProgressDialog("loadong..."),
            ),

            MaterialButton( // sn_progress_dialog 1.1.3
              color: const Color(0xfff7f7f7),
              child: const Text('Normal Progress'),
              onPressed: () {
                _normalProgress(context);
            }),

          ],
        ),
      ),
    );
  }

  Future _showProgressDialog(String message) async {
    await showDialog(
      context: context,
      // 화면의 빈 부분을 눌렀을 때의 처리
      barrierDismissible: true, // false : 눌렀을 때 아무런 변화 없음
      builder: (BuildContext context) {
        
        // 테스트할 때 3초 후 창 닫기
        Future.delayed(const Duration(seconds: 3), () {
          // 작업 완료시(로그인 등) 아래 명령을 통해 창을 닫아준다.
          Navigator.pop(context);
        });

        return Theme(
        data: ThemeData(dialogBackgroundColor: Colors.white),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
            // 대화창의 외부 크기
            content: SizedBox(
              height: 200,  // 높이를 지정해보세요.
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 인디케이트의 크기 설정
                    const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      // 인디케이트의 모양 혹은 색깔 설정
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        strokeWidth: 5.0
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 24, height: 1.5)
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
