//Masala1
/*
Task1: ‘for loopʼ dan foydalanib 1 dan 20 
gacha sonlar orasidan faqat toq sonlilarini 
toping
 */

// void main() {
//   for (int i = 1; i <= 20; i++) {
//     if (i.isOdd) {
//       print(i);
//     }
//   }
// }

//Masala2

/*
Task2: ‘while loopʼ dan foydalanib 1 dan 20 
gacha sonlar orasidan 5 ga 
bo`linmaydiganlarini toping.
 */

// void main() {
//   int i = 1;
//   while (i <= 20) {
//     if (i % 5 != 0) {
//       print(i);
//     }
//     i++;
//   }
// }

// Masala3

/*
1 dan 99 gacha bo`lgan sonning o`rta qiymatini aniqlang.
 */

// void main() {
//   int sum = 0;
//   int count = 0;
//   for (int i=1; i < 100; i++) {
//     sum += i;
//     count++;
//   }
//   print("O`rta qiymat: ${sum / count}");
// }

//Masala4

/* 3 xonali sonlar ichidan 11 ga bo`linadiganlarni  yig`indisini toping. */

// void main() {
//   var sum = 0;
//   for (var i = 100; i < 1000; i++) {
//     if (i % 11 == 0) {
//       sum += i;
//     }
//   }
//   print("Yig`indi: $sum");
// }

// Masala5
/* For loop  dan foydalanib berilgan sonni tub son ekanligini aniqlang */

void main() {
  int son = 7;
  bool isTub = true;
  if (son <= 1) {
    isTub = false;
  } else {
    for (int i = 2; i < son; i++) {
      if (son % i == 0) {
        isTub = false;
        break;
      }
    }
  }
  print(isTub ? "$son tub son" : "$son tub son emas");
}
