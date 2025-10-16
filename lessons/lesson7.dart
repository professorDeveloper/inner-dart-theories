import 'dart:collection';
//Task11.1
// void main() {
//   List lst = [12, 3, 34, 56, 11, 32, 45, 11, 43];
//   int max = lst[0];
//   for (int i = 0; i < lst.length; i++) {
//     if (max < lst[i] && lst[i] % 2 == 0) {
//       max = lst[i];
//     }
//   }
//   print(max);
// }

//Task11.2
//Bubble sort
// void main() {
//   List lst = [12, 3, 34, 56, 11, 32, 45, 11, 43];
//   for (int i = 0; i < lst.length; i++) {
//     for (int j = 0; j < lst.length - i - 1; j++) {
//       if (lst[j] > lst[j + 1]) {
//         int temp = lst[j];
//         lst[j] = lst[j + 1];
//         lst[j + 1] = temp;
//       }
//     }
//   }
//   print(lst);
// }

//Task11.3
//Get maxium item from set
// void main() {
//   Set set = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//   int max = set.first;
//   for (int item in set) {
//     if (max < item) {
//       max = item;
//     }
//   }
//   print(max);
// }

//Task11.4
/*
* Task 4: Set Mismatch
* [1,2,3,4] deb yozmoqchi bo`ldik lekin xató yozib [1,2,2,4] deb yozdik.
* Bu yerda xató ketgan raqamni topadigan kod yozing. Va bu masalani SET dan foydalib yeching.
* [1,2,2,4] => 2 chiqishi kerak. (3 bolishi kerak edi 2 deb xató yozdik).
* */
// void main() {
//   List<int> nums = [1, 2, 2, 4];
//   Set<int> seen = {};
//   int duplicate = -1;
//
//   for (int n in nums) {
//     if (seen.contains(n)) {
//       duplicate = n;
//       break;
//     }
//     seen.add(n);
//   }
//
//   print("Xato yozilgan raqam: $duplicate");
// }


//Task11.15
/*
* Q2 ga Q1 ni teskari tartibda joylashtiring. Shart: queue ning standart metodlaridan foydalanib.
Queue q1 = new Queue();
q.addAll([12, 23, 34, 45, 67]);
Queue q2 = new Queue();
* */
void main() {
  Queue q1 = Queue();
  q1.addAll([12, 23, 34, 45, 67]);

  Queue q2 = Queue();

  while (q1.isNotEmpty) {
    var element = q1.removeLast();
    q2.add(element);
  }

  print('Q2: $q2');
}