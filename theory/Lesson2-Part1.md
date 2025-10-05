# Dart O‘zgaruvchilar, Identifikatorlar va Bog‘liq Tushunchalar

Bu bo‘limda Dart tilida o‘zgaruvchilar, identifikatorlar va ularning ishlash qoidalari haqida to‘liq ma’lumot beriladi.

---

## 1. O‘zgaruvchi (Variable) Nima?

**O‘zgaruvchi** – bu dasturda ma’lumotni saqlash uchun ajratilgan nomlangan xotira joyi. O‘zgaruvchilar yordamida qiymatlarni saqlash, o‘zgartirish va ulardan foydalanish mumkin.

**Xotirada qanday saqlanadi va qancha joy oladi?**
- O‘zgaruvchi e’lon qilinganda, kompyuter RAM (operativ xotira) dan unga joy ajratadi.
- Har bir tip uchun xotira hajmi turlicha:
  - `int` (butun son): odatda 4 bayt (32 bit)
  - `double` (o‘nlik son): odatda 8 bayt (64 bit)
  - `bool`: 1 bayt (lekin ba’zan optimizatsiya qilinadi)
  - `String`: har bir belgisi 2 bayt (UTF-16), umumiy uzunligiga qarab
- O‘zgaruvchining nomi (identifikator) orqali unga murojaat qilinadi.

**Flow chart: O‘zgaruvchi e’lon qilish va foydalanish**

```
[Start]
   |
   v
[E'lon qilish]
   |
   v
[RAMda joy ajratiladi]
   |
   v
[Qiymat beriladi]
   |
   v
[Foydalanish]
   |
   v
[End]
```

**Sintaksis:**
```dart
int yosh = 25;      // 4 bayt
String ism = 'Ali'; // 6 bayt (3 ta harf * 2 bayt)
double narx = 12.5; // 8 bayt
bool mavjud = true; // 1 bayt
```

---

## 2. Identifikator (Identifier) Nima?

**Identifikator** – bu o‘zgaruvchi, funksiya, klass va boshqa obyektlarga beriladigan nom. Identifikatorlar yordamida koddagi elementlarni aniqlash va ularga murojaat qilish mumkin.

**Qoidalar:**
- Faqat harf, raqam, `_` (underscore) va `$` belgilaridan iborat bo‘lishi mumkin.
- Raqam bilan boshlanmaydi.
- Dart reserved keywords (masalan, `class`, `void`, `if`) identifikator sifatida ishlatilmaydi.
- Katta-kichik harflar farqlanadi (`ism` va `Ism` – bu ikki xil identifikator).

**To‘g‘ri misollar:**
```dart
int son1;
double _narx;
String $nom;
```

**Xato misollar:**
```dart
int 1son;      // raqam bilan boshlanmaydi
double class;  // reserved keyword
```

---

## 3. Dartda O‘zgaruvchilar Tipi

Dart strongly typed til, ya’ni har bir o‘zgaruvchining tipi aniq ko‘rsatiladi.

**Asosiy tiplar va xotira hajmi:**
- `int` – butun sonlar (4 bayt)
- `double` – o‘nlik sonlar (8 bayt)
- `String` – matn (har bir belgisi 2 bayt)
- `bool` – mantiqiy qiymat (1 bayt)
- `var` – avtomatik tip aniqlash
- `dynamic` – istalgan tip, runtime’da aniqlanadi

**Misollar:**
```dart
int a = 10;
double b = 3.14;
String s = 'Salom';
bool isTrue = false;
var x = 'Dart';      // x tipi String bo‘ladi
dynamic y = 123;     // y tipi istalgan bo‘lishi mumkin
```

---

## 4. O‘zgaruvchilarni E’lon Qilish Usullari

### 4.1. Explicit (aniq) tip bilan
```dart
int yosh = 20;
```

### 4.2. `var` bilan
```dart
var ism = 'Ali'; // Dart tipi avtomatik aniqlaydi
```

### 4.3. `final` va `const` bilan
- `final` – qiymat faqat bir marta beriladi, keyin o‘zgartirib bo‘lmaydi.
- `const` – compile-time’da o‘zgarmas qiymat.

```dart
final tugilganYil = 2000;
const PI = 3.1415;
```

---

## 5. O‘zgaruvchilarni Ishlatish Qoidalari

- O‘zgaruvchini e’lon qilmasdan ishlatib bo‘lmaydi.
- Tipga mos qiymat berish kerak.
- Identifikatorlar aniq va ma’noli bo‘lishi tavsiya etiladi.

**Xato:**
```dart
int son;
print(son); // qiymat berilmagan, xato bo‘ladi
```

**To‘g‘ri:**
```dart
int son = 5;
print(son); // 5
```

---

## 6. Reserved Keywords (Ajratilgan So‘zlar)

Dartda quyidagi so‘zlar identifikator sifatida ishlatilmaydi:

`abstract`, `else`, `import`, `super`, `as`, `enum`, `in`, `switch`, `assert`, `export`, `interface`, `sync`, `async`, `extends`, `is`, `this`, `await`, `extension`, `library`, `throw`, `break`, `external`, `mixin`, `true`, `case`, `factory`, `new`, `try`, `catch`, `false`, `null`, `typedef`, `class`, `final`, `on`, `var`, `const`, `finally`, `operator`, `void`, `continue`, `for`, `part`, `while`, `covariant`, `Function`, `rethrow`, `with`, `default`, `get`, `return`, `yield`, `deferred`, `hide`, `set`, `do`, `if`, `show`, `dynamic`, `implements`, `static`

---

## 7. Amaliy Misollar

```dart
void main() {
  int yosh = 18;
  String ism = 'Aziz';
  double narx = 99.99;
  bool mavjud = true;
  var xabar = 'Dart o‘rganamiz!';
  final tugilganYil = 2005;
  const PI = 3.14;

  print('$ism $yosh yoshda');
  print('Narx: $narx');
  print('Mavjud: $mavjud');
  print(xabar);
  print('Tug‘ilgan yil: $tugilganYil');
  print('PI: $PI');
}
```

---

## 8. Xulosa

Dartda o‘zgaruvchilar va identifikatorlar kodni aniq, xavfsiz va o‘qilishi oson qilish uchun muhim. Qoidalarni to‘g‘ri ishlatish – professional dasturchi uchun zarur ko‘nikma.