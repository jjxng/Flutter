class Unit  // 중요
{
  int? health;    // 초기화가 안 될 수도 았다는 뜻
  int? move;

  // 초기화 리스트를 사용
  Unit.init() : health = 10, move = 1 {   // init말고 다른 것 써도 됨.
    // 생성자의 구현부가 실행하기 전에 인스턴스 변수를 초기화할 수 있다.
  }

  // 생성자 선언. 옵션(들어올 수도 있고 안 들어올 수도 있음(null일 수도 있음))
  Unit({int? health}) : move = 2 {
    // 전달된 값이 null이면 0으로 초기화 된다.
    this.health = health ?? 0;
  }
}

void main()
{
  // 생성자의 초기화 리스트 사용하기
  Unit unit1 = Unit.init();
  print('unit1.health : ${unit1.health}');
  print('unit1.move : ${unit1.move}');
  print("=============================");

  /// Marine unit2 = Marine();  // 인자가 null이므로 0이 나옴
  Marine unit2 = Marine(health: 20);
  print('unit2.health : ${unit2.health}');
  print('unit3.move : ${unit2.move}');
  print('unit3.attack : ${unit2.attack}');

}

class Marine extends Unit
{
  late int attack;      // 자식에서 추가한 멤버변수
  // 초기화 리스트를 통해 1로 초기화하고, 나머지는 부모 생성자를 호출한다.
  Marine({int? health}) : attack = 1, super(health: health) {
  }
}