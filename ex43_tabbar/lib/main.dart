import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'page_a1.dart';
import 'page_b1.dart';
import 'page_c1.dart';

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
        primarySwatch: Colors.blue,
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
  // 탭바 사용을 위한 컨트롤러 선언
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // 컨트롤러 객체 생성 및 페이지 설정
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,    // 컨트롤러
      screens: _buildScreens(),   // 탭바를 눌렀을 때 변경될 페이지 설정
      items: _navBarsItems(),     // 네비바 아이템 설정
      confineInSafeArea: true,    // 네비바를 안전 영역에 둔다.
      backgroundColor: Colors.deepPurple.shade100,
      handleAndroidBackButtonPress: true,
      // 키보드가 나타날 때 화면을 위로 이동하는 경우 이 조건이 추족되어야 한다.
      resizeToAvoidBottomInset: true,
      stateManagement: true,    // 각 화면 상태 유지
      // '크기조정'을 설정하는 것이 좋다. 하단을 피하려면 이 인수를 사용할 때
      // inset이 true로 표시 된다.
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      // 내비바의 버튼을 눌렀을 때 전환 효과
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      ),
      // 화면 전환시의 애니메이션 효과
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,   // false이면 비활성화
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
  // 탭바를 클릭했을 때 처리될 페이지 선언
  List<Widget> _buildScreens() {
    return [
      const PageA1(),
      const PageB1(),
      const PageC1(),
    ];
  }
  // 탭메뉴의 버튼 생성 및 설정
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home), // 아이콘 설정
        title: "Home",  // 텍스트 설정
        activeColorPrimary: Colors.blue,  // 기본 색깔
        activeColorSecondary: Colors.yellow,  // 반전 되었을 때 색깔
        inactiveColorPrimary: Colors.grey, // 비활성화 상태의 색깔
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search), // 아이콘 설정
        title: "Search",  // 텍스트 설정
        activeColorPrimary: Colors.blue,  // 기본 색깔
        activeColorSecondary: Colors.red,  // 반전 되었을 때 색깔
        inactiveColorPrimary: Colors.grey // 비활성화 상태의 색깔
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add), // 아이콘 설정
        title: "Add",  // 텍스트 설정
        activeColorPrimary: Colors.blue,  // 기본 색깔
        activeColorSecondary: Colors.white,  // 반전 되었을 때 색깔
        inactiveColorPrimary: Colors.grey // 비활성화 상태의 색깔
      ),
    ];
  }
}
