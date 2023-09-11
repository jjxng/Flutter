void main()
{
  int x = 12;
  int y = 0;
  int res1;
  double res2;

  // on은 exception 객체가 필요 없을 때
  // UnsupportedError, FormatException
  try {
    res1 = x ~/ y; // 나머지
  }
  on UnsupportedError {   // 지원되지 않은 에러
    print('Cannot divice by zero-0으로 나눌 수 없어요');
  }

  // catch는 exception 객체가 필요할 때
  try {
    res2 = x / y;
  }
  on UnsupportedError catch(e) {
    print(e);
  }

  // 그냥 자바처럼 사용하기
  try {
    res2 = x / y;
  }
  catch(e) {
    print(e);
  }

  // throw
  divide(x, y); // 예외가 처리되지 않으므로 실행이 중지됨
}

// Exception 객체를 throw
divide(int a, int b)
{
  if (b == 0) {
    throw new Exception('Cannot divide by zero');
  }
  return a / b;
}