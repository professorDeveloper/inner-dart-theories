// Masal1 : listning o`rtadagi itemni 0 bilan alishtiring.
// void main() {
//   var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
//   var midIndex = list.length ~/ 2;
//   list[midIndex] = 0;
//   print(list);
// }

//Masala2 using map
// void main() {
//   var map ={"user_id":1001,"user_password":"herewego123"};
//   var data = map["user_password"];
//   map.remove("user_password");
//   map["user_pwd"] = data??"";
//   print(map);
// }

//Masala3
void main() {
  Map map = {"id": "10001", "password": "admin123", "name": "Admin"};
  String password = map['password'];
  if (password.isNotEmpty) {
    bool isHave = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i] == "@") {
        isHave = true;
        break;
      }
    }
    if(!isHave){
      map["password"] = "$password@";
    }
    print(map);
  }
}
