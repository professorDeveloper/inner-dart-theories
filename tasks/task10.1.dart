/*
Task2: Find Complement
Input: “110001”
Output: “001110”
*/
// void main(){
//   var str = "110001";
//   var complement = "";
//   for (var i = 0; i < str.length; i++) {
//     if (str[i] == "0") {
//       complement += "1";
//     } else {
//       complement += "0";
//     }
//   }
//   print(complement);
// }

/*Task3: Reverse Words
*  Input: "Let's take PDP contest"
*  Output: "${str.split(" ").map((e) => e.split("").reversed.join()).join(" ")}"
 */

/*

Task4: First Duplicate
*  Input: arr = [2,2,3,4]
*  Output: 2
*  Input: arr = [2,2,2,3,3]
*  Output: -1
*/
// void main() {
//   var arr = [2,2,2,3,3];
//   print(findLucky(arr));
// }
//
// List<int> findLucky(List<int> arr) {
//   List<int> luckyList = [];
//
//   for (int i = 0; i < arr.length; i++) {
//     int num = arr[i];
//     int freq = 0;
//
//     for (int j = 0; j < arr.length; j++) {
//       if (arr[j] == num) {
//         freq++;
//       }
//     }
//
//     if (freq == num && !luckyList.contains(num)) {
//       luckyList.add(num);
//     }
//   }
//
//   return luckyList.isNotEmpty ? luckyList : [-1];
// }


