void main()
{
  // *** Positional parameters *** 매개변수의 위치에 따라 값을 부여한다.
  //               따라서 순서를 변경할 수 없다. 자주쓰지 않음.
  //               list[]처럼 위치로 찾아감.

  // 파라미터를 옵션 처리하기
  something1();
  something1('홍길동');

  something2('해리포터');
  something2('멀린', 20);   // 앞에 것을 사용하지 않고 뒤에 것을 사용할 수 없다.

  // 마치 위의 것(something2)과 사용방법이 같은 것처럼 보인다.
  something3('전우치');
  something3('손오공', 20);

  // 필수 + 옵션
  something4('이순신');
  something4('강감찬', 20);
}

// 파라미터 옵션 처리. [] 사용해도 되고 안해도 된다.
// 사용 안하면 null이 올 수 있게 ?를 사용한다.
void something1([String? name]) {   // String? => null값 허용
  print('name : $name');
}

// 여러가지 파라미터를 처리하기 위해 오버로딩할 필요가 없다.
void something2([String? name, int? age]) {
  print('name : $name age : $age');
}

// 필수 + 옵션
void something3(String name, [int? age]) {
  print('name : $name age : $age');
}

// 파라미터의 디폴트 값. ? 빠진다.
void something4(String name, [int age = 10]) {
  print('name : $name age : $age');
}