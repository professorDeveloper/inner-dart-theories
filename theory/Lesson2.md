
# Dart Operatorlari: To'liq Qo'llanma, Tavsif va Isbot

Dart tilida operatorlar – bu o‘zgaruvchilar va qiymatlar ustida amallar bajarish uchun ishlatiladigan maxsus belgilar yoki ifodalar. Har bir operatorning maqsadi, ishlash mexanizmi va natijasi bor. Quyida har bir operator turi bo‘yicha qisqacha tavsif, misollar va nima uchun shunday ishlashini izoh bilan ko‘rib chiqamiz.


## 1. Arifmetik Operatorlar

**Tavsif:**
Arifmetik operatorlar sonlar ustida matematik amallar bajaradi. Ular dasturda hisob-kitob, o‘sish/kamayish va qoldiqni aniqlash uchun ishlatiladi.

**Nima uchun shunday?**
Bu operatorlar kompyuter arxitekturasida to‘g‘ridan-to‘g‘ri CPU tomonidan qo‘llab-quvvatlanadi. Masalan, `+` operatori ikkita sonni qo‘shadi, chunki bu arifmetik amal matematikada ham, kompyuterda ham bir xil natija beradi.

| Operator | Ma'nosi         | Misol           | Natija |
|----------|-----------------|-----------------|--------|
| +        | Qo'shish        | 2 + 3           | 5      |
| -        | Ayirish         | 5 - 2           | 3      |
| *        | Ko'paytirish    | 4 * 2           | 8      |
| /        | Bo'lish         | 6 / 2           | 3.0    |
| ~/       | Butun bo'lish   | 7 ~/ 2          | 3      |
| %        | Qoldiq          | 7 % 2           | 1      |
| ++       | O'sish          | var a = 5; a++  | 6      |
| --       | Kamayish        | var b = 5; b--  | 4      |

```dart
void main() {
  int a = 7;
  print(a + 2); // 9
  print(a - 3); // 4
  print(a * 2); // 14
  print(a / 2); // 3.5
  print(a ~/ 2); // 3
  print(a % 2); // 1
  a++;
  print(a); // 8
  a--;
  print(a); // 7
}
```

---


## 2. Tenglik va Munosabat Operatorlari

**Tavsif:**
Bu operatorlar qiymatlarni solishtirish uchun ishlatiladi. Shartli ifodalarda, sikllarda va mantiqiy qarorlar qabul qilishda muhim rol o‘ynaydi.

**Nima uchun shunday?**
Kompyuterda har bir qiymat bitlar ko‘rinishida saqlanadi. Solishtirish operatorlari bu bitlarni taqqoslab, natijani `true` yoki `false` ko‘rinishida qaytaradi. Masalan, `==` operatori ikkita qiymat tengligini tekshiradi.

| Operator | Ma'nosi           | Misol         | Natija |
|----------|-------------------|--------------|--------|
| >        | Katta             | 5 > 3        | true   |
| <        | Kichkina          | 2 < 4        | true   |
| >=       | Katta yoki teng   | 5 >= 5       | true   |
| <=       | Kichkina yoki teng| 3 <= 2       | false  |
| ==       | Teng              | 2 == 2       | true   |
| !=       | Teng emas         | 2 != 3       | true   |

```dart
void main() {
  print(5 > 3); // true
  print(2 < 4); // true
  print(5 >= 5); // true
  print(3 <= 2); // false
  print(2 == 2); // true
  print(2 != 3); // true
}
```

---


## 3. Sinov Turi Operatorlari

**Tavsif:**
`is` va `is!` operatorlari o‘zgaruvchining tipini tekshiradi. Bu operatorlar tip xavfsizligi va xatoliklarni oldini olish uchun ishlatiladi.

**Nima uchun shunday?**
Dart strongly typed til bo‘lgani uchun, har bir o‘zgaruvchining tipi muhim. `is` operatori tipni tekshiradi va natijani boolean ko‘rinishida qaytaradi. Bu, runtime’da xatoliklarni oldini olishga yordam beradi.

| Operator | Ma'nosi         | Misol           | Natija |
|----------|-----------------|-----------------|--------|
| is       | Tipni tekshirish| 'salom' is String| true   |
| is!      | Tip emasligini  | 5 is! String     | true   |

```dart
void main() {
  print('salom' is String); // true
  print(5 is! String); // true
}
```

---


## 4. Bitwise Operatorlar

**Tavsif:**
Bitwise operatorlar sonlarni bitlar darajasida boshqaradi. Ular asosan past darajadagi dasturlashda, masalan, flaglar, masklar va optimizatsiya uchun ishlatiladi.

**Nima uchun shunday?**
Kompyuterda har bir son bitlar to‘plami sifatida saqlanadi. Bitwise operatorlar bu bitlar ustida to‘g‘ridan-to‘g‘ri amallar bajaradi. Masalan, `&` operatori ikkala sonning faqat 1 bo‘lgan bitlarini saqlaydi.

| Operator | Ma'nosi | Misol    | Natija |
|----------|---------|----------|--------|
| &        | AND     | 5 & 3    | 1      |
| |        | OR      | 5 | 3    | 7      |
| ^        | XOR     | 5 ^ 3    | 6      |

```dart
void main() {
  print(5 & 3); // 1
  print(5 | 3); // 7
  print(5 ^ 3); // 6
}
```

---


## 5. Belgilash Operatorlari

**Tavsif:**
Belgilash operatorlari o‘zgaruvchiga qiymat berish va uni yangilash uchun ishlatiladi. Ular kodni qisqartirish va o‘qishni osonlashtirish uchun qulay.

**Nima uchun shunday?**
`a += 2` operatori aslida `a = a + 2` ga teng. Bu sintaksis kodni qisqa va aniq yozish uchun yaratilgan. Kompilyator buni avtomatik ravishda to‘g‘ri amalga aylantiradi.

| Operator | Ma'nosi         | Misol         | Natija |
|----------|-----------------|--------------|--------|
| =        | Belgilash       | a = 5        | 5      |
| +=       | Qo'shib belgilash| a += 2      | 7      |
| -=       | Ayirib belgilash | a -= 3      | 4      |
| *=       | Ko'paytirib belgilash| a *= 2  | 8      |
| /=       | Bo'lib belgilash| a /= 2      | 4.0    |
| %=       | Qoldiq belgilash| a %= 3      | 1      |

```dart
void main() {
  int a = 5;
  a += 2;
  print(a); // 7
  print(a); // 4
## 4. Bitwise Operatorlar

**Tavsif:**
Bitwise operatorlar sonlarni bitlar (0 va 1) darajasida boshqaradi. Ular past darajadagi dasturlashda, flaglar, masklar, optimizatsiya va apparat bilan ishlashda keng qo‘llaniladi.

**Nega kerak?**
Kompyuter xotirasi va protsessor faqat 0 va 1 (bitlar) bilan ishlaydi. Bitwise operatorlar yordamida ma’lumotlarni tez va samarali boshqarish, xotirani tejash, apparat resurslarini to‘g‘ri taqsimlash mumkin. Masalan, bir nechta flaglarni bitta butun son ichida saqlash va boshqarish uchun bitwise operatorlar ishlatiladi.

**Nima uchun natija 2 lik sanoq sistemada bo‘ladi?**
Har bir son kompyuterda 2 lik sanoq sistemada (binary) saqlanadi. Masalan, 5 = 101, 3 = 011. Bitwise operatorlar har bir bitni alohida solishtiradi yoki o‘zgartiradi. Natija ham binary ko‘rinishda hosil bo‘ladi, lekin ekranga decimal (10 lik) ko‘rinishda chiqadi.

**Bitwise operatorlar qanday ishlaydi?**
| Operator | Ma'nosi | Misol    | Binary amal | Natija |
|----------|---------|----------|-------------|--------|
| &        | AND     | 5 & 3    | 101 & 011   | 001 (1)|
| |        | OR      | 5 | 3    | 101 | 011   | 111 (7)|
| ^        | XOR     | 5 ^ 3    | 101 ^ 011   | 110 (6)|

**Misollar va izoh:**
```dart
void main() {
  print(5 & 3); // 1, chunki: 101 & 011 = 001
  print(5 | 3); // 7, chunki: 101 | 011 = 111
  print(5 ^ 3); // 6, chunki: 101 ^ 011 = 110
}
```

**Savol-javob:**
- Nega bitwise operatorlar qo‘shilgan?
  - Dasturda xotirani tejash, flaglarni boshqarish, apparat bilan to‘g‘ridan-to‘g‘ri ishlash va tezlik uchun.
- Nega natija binary bo‘ladi?
  - Kompyuterda barcha sonlar binary ko‘rinishda saqlanadi va bitwise operatorlar har bir bitni alohida boshqaradi.
- Qachon ishlatish kerak?
  - Flaglar, masklar, apparat interfeyslari, optimizatsiya va past darajadagi amallarda.

**Qo‘shimcha:**
Bitwise operatorlar dasturda murakkab va tez ishlovchi algoritmlar yaratishda juda foydali. Ular yordamida bir nechta boolean qiymatlarni bitta integerda saqlash, apparat resurslarini boshqarish va xotirani tejash mumkin.

----
  a *= 2;
  print(a); // 8
  a /= 2;
  print(a); // 4.0
  a %= 3;
  print(a); // 1
}
```

---


## 6. Mantiqiy Operatorlar

**Tavsif:**
Mantiqiy operatorlar boolean qiymatlar ustida amallar bajaradi. Ular shartli ifodalarda, sikllarda va mantiqiy qarorlar qabul qilishda ishlatiladi.

**Nima uchun shunday?**
`&&` va `||` operatorlari mantiqiy algebra asosida ishlaydi. Masalan, `true && false` natijasi `false`, chunki AND faqat ikkala operand true bo‘lsa, true qaytaradi.

| Operator | Ma'nosi | Misol           | Natija |
|----------|---------|-----------------|--------|
| &&       | AND     | true && false   | false  |
| ||       | OR      | true || false   | true   |
| !        | NOT     | !true           | false  |

```dart
void main() {
  print(true && false); // false
  print(true || false); // true
  print(!true); // false
}
```

---


## 7. Shartli Ifodalar

**Tavsif:**
Shartli ifodalar biror shartga qarab turli natijalarni qaytaradi. Ular kodni qisqartirish va o‘qishni osonlashtirish uchun ishlatiladi.

**Nima uchun shunday?**
`condition ? expr1 : expr2` – bu ternary operator. U if-else blokini qisqa ko‘rinishda yozish imkonini beradi. `??` operatori esa null qiymatlarni boshqarish uchun ishlatiladi, bu Dart tilida null safety’ni ta’minlaydi.

| Ifoda                  | Ma'nosi                                            | Misol                | Natija |
|------------------------|----------------------------------------------------|----------------------|--------|
| condition ? expr1 : expr2 | Agar shart to'g'ri bo'lsa expr1, aks holda expr2 | 5 > 3 ? 'katta' : 'kichik' | 'katta' |
| expr1 ?? expr2         | Agar expr1 null bo'lmasa, uning qiymati, aks holda expr2 | null ?? 'default' | 'default' |

```dart
void main() {
  print(5 > 3 ? 'katta' : 'kichik'); // 'katta'
  String? name;
  print(name ?? 'default'); // 'default'
}
```

---


---

**Xulosa:**
Dart operatorlari dasturda tez, aniq va xavfsiz amallar bajarish uchun yaratilgan. Har bir operatorning ishlash mexanizmi kompyuter arxitekturasi va tilning sintaksisiga asoslangan. Misollar va tavsiflar orqali operatorlarning vazifasi, natijasi va nima uchun shunday ishlashini to‘liq tushunishingiz mumkin.
