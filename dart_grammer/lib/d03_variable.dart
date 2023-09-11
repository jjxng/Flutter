void main()
{
  // 변수
  int num1 = 1;
  double num2 = 2.1;
  String name = "홍길동";

  myFunction1(num1);
  // myFunction(num2);

  myFunction2(num1);
  myFunction2(num2);

  myFunction3(num1);
  myFunction3(num2);
  myFunction3(name);
}

myFunction1(int val)
{
  print("func1 : $val");
}

myFunction2(num val)
{
  print("func2 : $val");
}

myFunction3(dynamic val)
{
  print("func3 : $val");
}