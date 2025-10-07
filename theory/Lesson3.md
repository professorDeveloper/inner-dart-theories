# Decision Making (Conditional Operators) – Dart

> “Master control flow, master performance.”  
> — Azamov’s Dart Notes  

---

## Language / Til

**Choose your language:**

- [English](#english-version)
- [O‘zbekcha](#uzbek-version)

---

# English Version

<a name="english-version"></a>

## Quick Navigation

- [Condition Diagram](#condition-diagram)
- [If Statement](#if-statement)
- [If-Else Statement](#if-else-statement)
- [Else-If Ladder](#else-if-ladder)
- [Nested If](#nested-if)
- [Switch Statement](#switch-statement)
- [Tasks](#tasks)
- [Extra If Examples](#extra-if-examples)
- [Summary](#summary)

---

## Condition Diagram

The following diagram shows how conditional operators (if/else) work:

```
[Condition checked]
     |
     v
[If true] ----> [Code executes]
     |
     v
[If false] ---> [Other code or nothing]
```

---

## If Statement

The `if` statement checks a condition and executes code if the condition is true.

**Syntax and Example:**
```dart
int age = 18;
if (age >= 18) {
  print('Adult');
}
```
If `age` is 18 or more, "Adult" will be printed.

---

## If-Else Statement

The `if-else` statement executes one block if the condition is true, another if false.

**Syntax and Example:**
```dart
int score = 65;
if (score >= 70) {
  print('Passed');
} else {
  print('Failed');
}
```

---

## Else-If Ladder

Used to check multiple conditions in sequence.

**Syntax and Example:**
```dart
int grade = 4;
if (grade == 5) {
  print('Excellent');
} else if (grade == 4) {
  print('Good');
} else if (grade == 3) {
  print('Satisfactory');
} else {
  print('Unsatisfactory');
}
```

---

## Nested If

You can use `if` inside another `if`.

**Syntax and Example:**
```dart
int age = 20;
bool hasPassport = true;
if (age >= 18) {
  if (hasPassport) {
    print('Can vote');
  } else {
    print('Passport required');
  }
} else {
  print('Too young');
}
```

---

## Switch Statement

The `switch` statement selects one of many code blocks to execute based on a variable’s value.

**Syntax:**
```dart
switch (value) {
  case 1:
    // Code
    break;
  case 2:
    // Code
    break;
  default:
    // Code
}
```

**Explanation:**
- Each `case` checks a value.
- If matched, code in that case runs.
- `break` exits the switch block; if omitted, next case runs ("fall-through").
- `default` runs if no case matches.

**Example:**
```dart
int day = 3;
switch (day) {
  case 1:
    print('Monday');
    break;
  case 2:
    print('Tuesday');
    break;
  case 3:
    print('Wednesday');
    break;
  default:
    print('Other day');
}
```
If `day` is 3, "Wednesday" is printed.

**About break:**
If you omit `break`, the next case will also execute:
```dart
int day = 2;
switch (day) {
  case 2:
    print('Tuesday');
    // no break!
  case 3:
    print('Wednesday');
    break;
}
```
Output:
```
Tuesday
Wednesday
```
So, always use `break` unless you want fall-through.

**Default case:**
- Usually placed last, but not required.
- Runs if no case matches.

**When to use switch?**
- When you have several specific values and need different code for each.
- Examples: menu selection, day names, status codes, etc.

---

## Tasks

These exercises help reinforce theory. Try solving them yourself.

- **Task1:** If a given number is more than 1 or 2 greater than a multiple of 20, print `true` to the console.
- **Task2:** Given a non-negative number, if it differs by at most 2 from a multiple of 10, print `true` to the console.
- **Task3:** Given two integers `a` and `b`, print their sum. If the sum is in the range 10…19, print `20` instead.

*Note: Tasks are for practice. Try to solve them yourself!*

---

## Extra If Examples

### 1. Simple condition
```dart
if (a > b) print('a is greater');
```

### 2. Multiple conditions
```dart
if (a > 0 && b > 0) print('Both are positive');
```

### 3. Ternary operator
```dart
String result = (a % 2 == 0) ? 'Even' : 'Odd';
print(result);
```

### 4. Switch example
```dart
int day = 3;
switch (day) {
  case 1:
    print('Monday');
    break;
  case 2:
    print('Tuesday');
    break;
  default:
    print('Other day');
}
```

---

## Summary

Conditional operators in Dart allow you to control code flow and handle different situations. Each example and task helps you understand real-world problem solving.

---

# Uzbek Version

<a name="uzbek-version"></a>

## Qisqa navigatsiya

- [Shart diagrammasi](#condition-diagram)
- [If operatori](#if-statement)
- [If-Else operatori](#if-else-statement)
- [Else-If ladder](#else-if-ladder)
- [Ichma-ich if](#nested-if)
- [Switch operatori](#switch-statement)
- [Tasklar](#tasks)
- [Qo‘shimcha if misollari](#extra-if-examples)
- [Xulosa](#summary)

---

## CONDITION SXEMASI

Quyidagi diagramma shartli operatorlar (if/else) qanday ishlashini ko‘rsatadi:

```
[Shart tekshiriladi]
     |
     v
[Agar shart to'g'ri bo'lsa] ----> [Kod bajariladi]
     |
     v
[Agar shart noto'g'ri bo'lsa] ---> [Boshqa kod yoki hech narsa]
```

---

## IF

`if` operatori shartni tekshiradi va shart to‘g‘ri bo‘lsa kodni bajaradi.

**Sintaksis va misol:**
```dart
int yosh = 18;
if (yosh >= 18) {
  print('Balog‘atga yetgan');
}
```
Yuqoridagi misolda, agar `yosh` 18 yoki undan katta bo‘lsa, "Balog‘atga yetgan" chiqadi.

---

## IF ELSE

`if else` operatori shart to‘g‘ri bo‘lmasa boshqa kodni bajaradi.

**Sintaksis va misol:**
```dart
int ball = 65;
if (ball >= 70) {
  print('Imtihondan o‘tdi');
} else {
  print('Imtihondan o‘tmadi');
}
```

---

## ELSE IF LADDER

Bir nechta shartlarni ketma-ket tekshirish uchun ishlatiladi.

**Sintaksis va misol:**
```dart
int baho = 4;
if (baho == 5) {
  print('A’lo');
} else if (baho == 4) {
  print('Yaxshi');
} else if (baho == 3) {
  print('Qoniqarli');
} else {
  print('Qoniqarsiz');
}
```

---

## NESTED IF…ELSE

`if` ichida yana `if` ishlatish mumkin.

**Sintaksis va misol:**
```dart
int yosh = 20;
bool passportBor = true;
if (yosh >= 18) {
  if (passportBor) {
    print('Saylovda qatnashishi mumkin');
  } else {
    print('Pasport kerak');
  }
} else {
  print('Yosh yetarli emas');
}
```

---

## SWITCH

`switch` operatori biror o‘zgaruvchining qiymatiga qarab bir nechta variantdan birini bajaradi. Bu operator ko‘p shartlarni ketma-ket if/else bilan yozishdan ko‘ra ancha qulay va o‘qilishi oson.

**Sintaksis:**
```dart
switch (qiymat) {
  case 1:
    // Kod
    break;
  case 2:
    // Kod
    break;
  default:
    // Kod
}
```

**Tushuntirish:**
- `switch` ichida har bir `case` bir qiymatni tekshiradi.
- Agar qiymat mos kelsa, shu case ichidagi kod bajariladi.
- `break` operatori case tugagandan so‘ng switch blokidan chiqib ketadi. Agar break yozilmasa, keyingi case ham bajariladi (bu "fall-through" deb ataladi).
- `default` esa hech bir case mos kelmasa ishlaydi.

**Misol:**
```dart
int day = 3;
switch (day) {
  case 1:
    print('Dushanba');
    break;
  case 2:
    print('Seshanba');
    break;
  case 3:
    print('Chorshanba');
    break;
  default:
    print('Boshqa kun');
}
```
Yuqoridagi misolda, `day` 3 bo‘lsa, "Chorshanba" chiqadi.

**break haqida chuqurroq:**
- Agar break yozilmasa, switch keyingi case’larni ham bajaradi:
```dart
int day = 2;
switch (day) {
  case 2:
    print('Seshanba');
    // break yo‘q!
  case 3:
    print('Chorshanba');
    break;
}
```
Natija:
```
Seshanba
Chorshanba
```
- Shuning uchun har bir case oxirida break yozish tavsiya etiladi.

**default case:**
- default case har doim oxirida bo‘lishi shart emas, lekin odatda oxirida yoziladi.
- default case switch ichida hech bir case mos kelmasa bajariladi.

**Switch operatori qachon ishlatiladi?**
- Biror o‘zgaruvchining bir nechta aniq qiymatlari bo‘lsa va har bir qiymat uchun alohida kod bajarilishi kerak bo‘lsa.
- Masalan, menyu tanlash, kun nomlari, status kodlar va boshqalar.

---

## TASKS

Quyidagi masalalar shartli operatorlarni mustahkamlash uchun berilgan. Ularni yechish – nazariyani amalda ko‘rish uchun foydali.

- **Task1:** Agar berilgan son 20 ning ko`paytmasidan 1 yoki 2 ga ortiq bo`lsa true qiymatni Console da chiqaring.
- **Task2:** Manfiy bo`lmagan “num” raqami berilgan, agar son 10 ga qoldiqsiz bo`linuvchi sonlarga ko`pi bilan 2 tagacha farq qilsa true qiymatni Console da chiqaring.
- **Task3:** Ikkita a va b butun son berilgan, ularning yig`indisini Console da chiqaring. Agar, ularning yig`indisi 10…19 oraliqda o`zgarsa, yig`indini o`rniga 20 qiymatni chiqaring.

**Eslatma:**  
Tasklar yechimi faqat nazariyani mustahkamlash uchun. Har bir taskni o‘zingiz yechib ko‘ring!

---

## Qo‘shimcha: Mukammal IF Misollari

### 1. Oddiy shart
```dart
if (a > b) print('a katta');
```

### 2. Bir nechta shart
```dart
if (a > 0 && b > 0) print('Ikkalasi ham musbat');
```

### 3. Ternary operator
```dart
String natija = (a % 2 == 0) ? 'Juft' : 'Toq';
print(natija);
```

### 4. Switch misoli
```dart
int day = 3;
switch (day) {
  case 1:
    print('Dushanba');
    break;
  case 2:
    print('Seshanba');
    break;
  default:
    print('Boshqa kun');
}
```

---

**Xulosa:**  
Dartda shartli operatorlar yordamida kodni mos ravishda boshqarish, turli vaziyatlarda turli natijalarni olish mumkin. Har bir task va misol real hayotdagi muammolarni yechishda yordam beradi.