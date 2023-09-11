void main()
{
  // 변수

  int num1 = 0;
  double num2 = 1.0;
  num num3 = 1;
  num num4 = 1.0;

  bool bCheck = true;
  String myStr1 = "홍길동";
  String mrStr2 = '전우치';

  var myVar1 = 1;
  var myVar2 = "홍길동";
  // myVar1 = "손오공";

  dynamic myVar3 = 2;
  myVar3 = "전우치";

  // 상수

  const myConst1 = 20;  // 컴파일시에 결정 : 시작할 때 결정
  final myConst2 = 10;
  final myConst3;
  myConst3 = 30;      // 잘 사용하지 않음
  // myConst2 = 99;      // 상수는 값을 변경할 수 없다.
}