// Masala2

// void main() {
//   var str = "fHello b";
//   if (str.startsWith("f") && str.endsWith("b")) {
//     print("FizzBuzz");
//   } else if (str.startsWith('f')) {
//     print("Fizz");
//   } else if (str.endsWith('b')) {
//     print("Buzz");
//   }else {
//     print(str);
//   }
// }

//Masala3

void main() {
  var son = 5;
  if (son % 3 == 0 && son % 5 == 0) {
    print("FizzBuzz");
  } else if (son % 3 == 0) {
    print("Fizz");
  } else if (son % 5 == 0) {
    print("Buzz");
  } else {
    print('!$son');
  }
}
