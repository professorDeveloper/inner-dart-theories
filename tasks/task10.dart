// Task10.1
/*
* Task1:  Peak Element
* Berilgan List da “Peak Element” ni chiqaradigan funksiya yozing.
* “Peak Element” deyiladi qachonki listdagi biror bir element undan oldin va keyin kelgan
* elementlardan bir vaqtda katta bo`lsa.
* */

void main() {
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  printPeakElement(list);
}

void printPeakElement(List list) {
  for (var i = 1; i < list.length - 1; i++) {
    if (list[i] > list[i - 1] && list[i] > list[i + 1]) {
      print(list[i]);
    }
  }
}

/*
 * Task2: Fixed Point
 * Berilgan List da uchragan birinchi “Fixed Point” ni qaytaradigan funksiya yozing.
 * Fixed Point” deyiladi qachonki listdagi biror bir element  list[i] = i  shartni bajargan bo`lsa.
 */
//
// void main() {
//   var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
//   print(findFixedPoint(list));
// }
//
// int findFixedPoint(List<int> list) {
//   for (var i = 0; i < list.length; i++) {
//     if (list[i] == i) {
//       return list[i];
//     }
//   }
//   return -1;
// }

/*
* Task3: Missing Number
* List da 1 dan N gacha raqamlar mavjud bo`lishi kerak.
* Ammo ulardan bittasi tushib qolgan.
* Shu “Missing Number” ni qaytaradigan funksiya yozing.
* Missing Number” deyiladi qachonki listda u raqamdan boshqa hamma raqam mavjud bo`lsa.
* */
//
// void main() {
//   var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
//   print(findMissingNumber(list));
// }
//
// int findMissingNumber(List<int> list) {
//   int sum = 0;
//   for (var i = 0; i < list.length; i++) {
//     sum += list[i];
//   }
//   return sum;
// }

/*
* Task4: Monotonic List
* List monotonic deyiladi qachonki hamma i<j lar uchun A[i]<A[j] yoki hamma i>j lar uchun A[i]>A[j] shart o`rinli bo`lsa.
* Ya`ni barcha  elementlari o`sish yoki kamayish tartibida joylashgan list monotonic list deyiladi.
* Masalan: [1,3,5,6,7,8] yoki [12,10,6,4,3]
* */
//
// void main() {
//   var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
//   print(isMonotonic(list));
// }
//
// bool isMonotonic(List<int> list) {
//   bool increasing = true;
//   bool decreasing = true;
//   for (var i = 0; i < list.length - 1; i++) {
//     if (list[i] < list[i + 1]) {
//       decreasing = false;
//     } else if (list[i] > list[i + 1]) {
//       increasing = false;
//     }
//   }
//   return increasing || decreasing;
// }

/*
* Task5: Squares of a Sorted Array
* Elementlari kamaymaydigan tartibda List berilgan bo`lsin.
* Bu List ni elementlarini kvadratga oshirib hosil bo’lgan sonlarni
* o’sish tartibida joylashtirilgan
* List hosil qiladigan funksiya yozing.
* */
//
// void main() {
//   var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
//   print(squaresOfSortedArray(list));
// }
//
// List<int> squaresOfSortedArray(List<int> list) {
//   List<int> result = [];
//   for (var i = 0; i < list.length; i++) {
//     result.add(list[i] * list[i]);
//   }
//   return result;
// }

// New Tasks
/*
Task1: Add Strings
Input: “111”, “222”
Output: “333”
*/
// void main() {
//   var str1 = "111";
//   var str2 = "222";
//   var sum = int.parse(str1) + int.parse(str2);
//   print(sum);
// }

/*
Task2: Find Complement
Input: “110001”
Output: “001110*/
