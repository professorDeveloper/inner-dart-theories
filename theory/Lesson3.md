# Decision Making (Shartli Operatorlar) – Dart

Dart tilida qaror qabul qilish (decision making) uchun quyidagi shartli operatorlar ishlatiladi:

---

## CONDITION SXEMASI

Quyidagi diagramma shartli operatorlar (if/else) qanday ishlashini ko‘rsatadi:

![Condition Flowchart](./images/image_2025-10-07_09-28-14.png)

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

```dart
if (shart) {
  // Kod shart to'g'ri bo'lsa bajariladi
}
```

## IF ELSE

```dart
if (shart) {
  // Kod shart to'g'ri bo'lsa bajariladi
} else {
  // Kod shart noto'g'ri bo'lsa bajariladi
}
```

## ELSE IF LADDER

```dart
if (shart1) {
  // Kod
} else if (shart2) {
  // Kod
} else {
  // Kod
}
```

## NESTED IF…ELSE

```dart
if (shart1) {
  if (shart2) {
    // Kod
  } else {
    // Kod
  }
} else {
  // Kod
}
```

## SWITCH

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

---

# TASKS

### Task1
Agar berilgan son 20 ning ko`paytmasidan 1 yoki 2 ga ortiq bo`lsa true qiymatni Console da chiqaring.

```dart
void main() {
  int n = 42;
  if (n > 20 && (n - 20 == 1 || n - 20 == 2)) {
    print(true);
  } else {
    print(false);
  }
}
```

### Task2
Manfiy bo`lmagan “num” raqami berilgan, agar son 10 ga qoldiqsiz bo`linuvchi sonlarga ko`pi bilan 2 tagacha farq qilsa true qiymatni Console da chiqaring.

```dart
void main() {
  int num = 18;
  int qoldiq = num % 10;
  if (num >= 0 && (qoldiq <= 2 || qoldiq >= 8)) {
    print(true);
  } else {
    print(false);
  }
}
```

### Task3
Ikkita a va b butun son berilgan, ularning yig`indisini Console da chiqaring. Agar, ularning yig`indisi 10…19 oraliqda o`zgarsa, yig`indini o`rniga 20 qiymatni chiqaring.

```dart
void main() {
  int a = 7;
  int b = 8;
  int sum = a + b;
  if (sum >= 10 && sum <= 19) {
    print(20);
  } else {
    print(sum);
  }
}
```

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