void main() {
  print('Hello, World!');
  testAsnyc();
  print("After async call");
}

void testAsnyc() async {
  await Future.delayed(Duration(seconds: 2));
  print("Async function executed");
}
