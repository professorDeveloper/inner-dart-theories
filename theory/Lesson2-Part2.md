# Dart Operators: Comprehensive Guide, Description, and Explanation


> — Azamov’s Dart Notes
---


## Language Selection
Choose a language to view the content:

- [English](#english-version)
- [Uzbek](#uzbek-version)


## English Version

<a name="english-version"></a>

## Quick List: Operator Types
- [Arithmetic Operators](#1-arithmetic-operators)
- [Equality and Relational Operators](#2-equality-and-relational-operators)
- [Type Test Operators](#3-type-test-operators)
- [Bitwise Operators](#4-bitwise-operators)
- [Assignment Operators](#5-assignment-operators)
- [Logical Operators](#6-logical-operators)
- [Conditional Expressions](#7-conditional-expressions)
- [Additional Operators](#8-additional-operators)

---

## 1. Arithmetic Operators

**Description:**  
Arithmetic operators perform mathematical operations on numbers. They are used for calculations, increment/decrement, and finding remainders.

**Why it works this way?**  
These operators are directly supported by the CPU in computer architecture. For example, the `+` operator adds two numbers, producing consistent results in both mathematics and computing.

| Operator | Description     | Example         | Result |
|----------|-----------------|-----------------|--------|
| +        | Addition        | 2 + 3           | 5      |
| -        | Subtraction     | 5 - 2           | 3      |
| *        | Multiplication  | 4 * 2           | 8      |
| /        | Division        | 6 / 2           | 3.0    |
| ~/       | Integer Division| 7 ~/ 2          | 3      |
| %        | Modulus         | 7 % 2           | 1      |
| ++       | Increment       | var a = 5; a++  | 6      |
| --       | Decrement       | var b = 5; b--  | 4      |

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

## 2. Equality and Relational Operators

**Description:**  
These operators compare values and are used in conditional statements, loops, and logical decision-making.

**Why it works this way?**  
Values are stored as bits in a computer. Comparison operators evaluate these bits and return `true` or `false`.

| Operator | Description       | Example       | Result |
|----------|-------------------|--------------|--------|
| >        | Greater than      | 5 > 3        | true   |
| <        | Less than         | 2 < 4        | true   |
| >=       | Greater or equal  | 5 >= 5       | true   |
| <=       | Less or equal     | 3 <= 2       | false  |
| ==       | Equal             | 2 == 2       | true   |
| !=       | Not equal         | 2 != 3       | true   |

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

## 3. Type Test Operators

**Description:**  
The `is` and `is!` operators check a variable's type, ensuring type safety and preventing errors.

**Why it works this way?**  
Dart is a strongly typed language, and type checking is critical. The `is` operator verifies the type and returns a boolean result.

| Operator | Description      | Example           | Result |
|----------|------------------|-------------------|--------|
| is       | Type check       | 'hello' is String | true   |
| is!      | Not type check   | 5 is! String      | true   |

```dart
void main() {
  print('hello' is String); // true
  print(5 is! String); // true
}
```

---

## 4. Bitwise Operators

**Description:**  
Bitwise operators manipulate numbers at the bit level (0s and 1s). They are used in low-level programming, flags, masks, and optimization.

**Why it works this way?**  
Computer memory and processors work with bits. Bitwise operators allow efficient data manipulation and memory optimization.

| Operator | Description | Example  | Binary Operation | Result |
|----------|-------------|----------|------------------|--------|
| &        | AND         | 5 & 3    | 101 & 011        | 001 (1)|
| |        | OR          | 5 | 3    | 101 | 011        | 111 (7)|
| ^        | XOR         | 5 ^ 3    | 101 ^ 011        | 110 (6)|

```dart
void main() {
  print(5 & 3); // 1, because: 101 & 011 = 001
  print(5 | 3); // 7, because: 101 | 011 = 111
  print(5 ^ 3); // 6, because: 101 ^ 011 = 110
}
```

**Additional Questions:**  
- **Why use bitwise operators?** For memory efficiency, flag management, and hardware interaction.  
- **When to use them?** In low-level programming, optimization, and hardware interfaces.

---

## 5. Assignment Operators

**Description:**  
Assignment operators assign or update variable values, making code concise and readable.

**Why it works this way?**  
`a += 2` is equivalent to `a = a + 2`. This syntax simplifies code writing and improves clarity.

| Operator | Description         | Example       | Result |
|----------|---------------------|--------------|--------|
| =        | Assignment          | a = 5        | 5      |
| +=       | Add and assign      | a += 2       | 7      |
| -=       | Subtract and assign | a -= 3       | 4      |
| *=       | Multiply and assign | a *= 2       | 8      |
| /=       | Divide and assign   | a /= 2       | 4.0    |
| %=       | Modulus and assign  | a %= 3       | 1      |

```dart
void main() {
  int a = 5;
  a += 2;
  print(a); // 7
  a *= 2;
  print(a); // 14
  a /= 2;
  print(a); // 7.0
  a %= 3;
  print(a); // 1
}
```

---

## 6. Logical Operators

**Description:**  
Logical operators perform operations on boolean values, used in conditional statements and logical decisions.

**Why it works this way?**  
`&&` and `||` follow boolean algebra. For example, `true && false` results in `false` because AND requires both operands to be true.

| Operator | Description | Example           | Result |
|----------|-------------|-------------------|--------|
| &&       | AND         | true && false     | false  |
| ||       | OR          | true || false     | true   |
| !        | NOT         | !true             | false  |

```dart
void main() {
  print(true && false); // false
  print(true || false); // true
  print(!true); // false
}
```

---

## 7. Conditional Expressions

**Description:**  
Conditional expressions return results based on conditions, simplifying code and handling null values.

**Why it works this way?**  
The `condition ? expr1 : expr2` (ternary operator) provides a concise alternative to if-else blocks. The `??` operator supports Dart’s null safety feature.

| Expression             | Description                                        | Example                | Result    |
|------------------------|----------------------------------------------------|-----------------------|-----------|
| condition ? expr1 : expr2 | If condition is true, return expr1, else expr2 | 5 > 3 ? 'big' : 'small' | 'big'     |
| expr1 ?? expr2         | If expr1 is not null, return expr1, else expr2 | null ?? 'default'     | 'default' |

```dart
void main() {
  print(5 > 3 ? 'big' : 'small'); // 'big'
  String? name;
  print(name ?? 'default'); // 'default'
}
```

---

## 8. Additional Operators

**Description:**  
Dart includes special operators like null-aware (`?.`), cascade notation (`..`), and others to make code more flexible and concise.

| Operator | Description              | Example                     | Result         |
|----------|--------------------------|-----------------------------|----------------|
| ?.       | Null-aware              | obj?.method()               | null or result |
| ..       | Cascade notation        | obj..x = 5..y = 10         | obj            |
| []       | Index operator          | list[0]                    | First element  |
| ()       | Function call           | function()                 | Result         |

```dart
void main() {
  // Null-aware operator
  String? name;
  print(name?.length); // null

  // Cascade notation
  var list = []
    ..add(1)
    ..add(2);
  print(list); // [1, 2]

  // Index operator
  print(list[0]); // 1
}
```


---
# Uzbek-version

<a name="uzbek-version"></a>

## Operatorlar ro‘yxati
- [Arifmetik Operatorlar](#1-arifmetik-operatorlar)
- [Tenglik va Munosabat Operatorlari](#2-tenglik-va-munosabat-operatorlari)
- [Sinov Turi Operatorlari](#3-sinov-turi-operatorlari)
- [Bitwise Operatorlar](#4-bitwise-operatorlar)
- [Belgilash Operatorlari](#5-belgilash-operatorlari)
- [Mantiqiy Operatorlar](#6-mantiqiy-operatorlar)
- [Shartli Ifodalar](#7-shartli-ifodalar)
- [Qo‘shimcha Operatorlar](#8-qo‘shimcha-operatorlar)

## 1. Arifmetik Operatorlar

**Tavsif:**  
Arifmetik operatorlar sonlar ustida matematik amallar bajaradi. Ular hisob-kitob, o‘sish/kamayish va qoldiqni aniqlashda ishlatiladi.

**Nima uchun shunday?**  
Bu operatorlar kompyuter arxitekturasida to‘g‘ridan-to‘g‘ri CPU tomonidan qo‘llab-quvvatlanadi. Masalan, `+` operatori ikkita sonni qo‘shadi, bu matematikada ham, kompyuterda ham bir xil natija beradi.

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
Kompyuterda har bir qiymat bitlar ko‘rinishida saqlanadi. Solishtirish operatorlari bu bitlarni taqqoslab, natijani `true` yoki `false` ko‘rinishida qaytaradi.

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
`is` va `is!` operatorlari o‘zgaruvchining tipini tekshiradi. Tip xavfsizligi va xatolarni oldini olishda ishlatiladi.

**Nima uchun shunday?**  
Dart strongly typed til bo‘lib, har bir o‘zgaruvchining tipi muhim. `is` operatori tipni tekshiradi va natijani boolean ko‘rinishida qaytaradi.

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
Bitwise operatorlar sonlarni bitlar (0 va 1) darajasida boshqaradi. Past darajadagi dasturlashda, flaglar, masklar va optimizatsiyada keng qo‘llaniladi.

**Nima uchun shunday?**  
Kompyuter xotirasi va protsessor faqat bitlar bilan ishlaydi. Bitwise operatorlar yordamida ma’lumotlarni tez va samarali boshqarish, xotirani tejash mumkin.

| Operator | Ma'nosi | Misol    | Binary amal | Natija |
|----------|---------|----------|-------------|--------|
| &        | AND     | 5 & 3    | 101 & 011   | 001 (1)|
| |        | OR      | 5 | 3    | 101 | 011   | 111 (7)|
| ^        | XOR     | 5 ^ 3    | 101 ^ 011   | 110 (6)|

```dart
void main() {
  print(5 & 3); // 1, chunki: 101 & 011 = 001
  print(5 | 3); // 7, chunki: 101 | 011 = 111
  print(5 ^ 3); // 6, chunki: 101 ^ 011 = 110
}
```

**Qo‘shimcha Savollar:**  
- **Nega bitwise operatorlar kerak?** Xotirani tejash, flaglarni boshqarish va apparat bilan ishlash uchun.  
- **Qachon ishlatiladi?** Past darajadagi dasturlash, optimizatsiya va apparat interfeyslari.  

---

## 5. Belgilash Operatorlari

**Tavsif:**  
Belgilash operatorlari o‘zgaruvchiga qiymat berish va uni yangilashda ishlatiladi. Kodni qisqartirish va o‘qishni osonlashtirish uchun qulay.

**Nima uchun shunday?**  
`a += 2` operatori `a = a + 2` ga teng. Bu sintaksis kodni aniq va qisqa yozish uchun yaratilgan.

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
  a *= 2;
  print(a); // 14
  a /= 2;
  print(a); // 7.0
  a %= 3;
  print(a); // 1
}
```

---

## 6. Mantiqiy Operatorlar

**Tavsif:**  
Mantiqiy operatorlar boolean qiymatlar ustida amallar bajaradi. Shartli ifodalarda va mantiqiy qarorlarda ishlatiladi.

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
Shartli ifodalar shartga qarab turli natijalarni qaytaradi. Kodni qisqartirish va null qiymatlarni boshqarishda ishlatiladi.

**Nima uchun shunday?**  
`condition ? expr1 : expr2` (ternary operator) if-else blokini qisqa ko‘rinishda yozish imkonini beradi. `??` operatori Dart’ning null safety xususiyatini ta’minlaydi.

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

## 8. Qo‘shimcha Operatorlar

**Tavsif:**  
Dart tilida maxsus operatorlar, masalan, null-aware (`?.`), kaskad notatsiyasi (`..`) va boshqalar mavjud. Ular kodni yanada moslashuvchan va qisqa qiladi.

| Operator | Ma'nosi                  | Misol                       | Natija         |
|----------|--------------------------|-----------------------------|----------------|
| ?.       | Null-aware               | obj?.method()               | null yoki natija |
| ..       | Kaskad notatsiyasi       | obj..x = 5..y = 10         | obj            |
| []       | Indeks operator          | list[0]                    | Birinchi element |
| ()       | Funksiya chaqirish       | function()                 | Natija         |

```dart
void main() {
  // Null-aware operator
  String? name;
  print(name?.length); // null

  // Kaskad notatsiyasi
  var list = []
    ..add(1)
    ..add(2);
  print(list); // [1, 2]

  // Indeks operator
  print(list[0]); // 1
}
```


## Conclusion
Dart operators are designed for fast, precise, and safe operations. Their mechanisms are rooted in computer architecture and Dart’s syntax. Through examples and explanations, you can fully understand their purpose, results, and why they work the way they do.

**Additional Resources:**
- [Official Dart Documentation](https://dart.dev/guides/language/language-tour#operators)
- [DartPad](https://dartpad.dev) – Try Dart code online.
