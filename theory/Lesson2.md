# Dart Operatorlari: To'liq Qo'llanma va Misollar

## 1. Arifmetik Operatorlar

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
  a -= 3;
  print(a); // 4
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

Barcha operatorlar va shartli ifodalar Dart tilida yuqoridagi misollar bilan ishlatiladi. Har bir operatorning vazifasi va natijasi jadvalda ko‘rsatilgan.
