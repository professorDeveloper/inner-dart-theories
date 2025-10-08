//Task1
// void main(){
//   var name ="Saikou Azamov";
//   var unicodeList = name.codeUnits;
//   print(unicodeList);
// }

//Task2
// 97,98,99...121,122 unicodlari berilgan bo`lsa bu ketma-ketlikni aslini toping
// void main(){
//   var name = "";
//   for (var i = 97; i <= 122; i++) {
//     name += String.fromCharCode(i);}
//   print(name);
//   }

//Task3
// textdagi  faqat lotin tilidagi harflarning unicode qiymatlarini chiqaring
void main(){
  var name ="2024 Hello PDP Academy  ݻ";
  var unicodes =[];
  for (var i =0; i < name.length; i++) {
    if (name.codeUnitAt(i) >= 97 && name.codeUnitAt(i) <= 122 || name.codeUnitAt(i) >= 65 && name.codeUnitAt(i) <= 90) {
      unicodes.add(name.codeUnitAt(i));
    }
  }
  print(unicodes);
}

