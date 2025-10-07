# 🔁 Dart Loops — Full Deep Dive Documentation

> 🧠 *“Master control flow, master performance.”*  
> — Arber’s Dart Notes  

---

## 🌐 Language / Til
**[🇬🇧 English](#english-version) | [🇺🇿 O‘zbekcha](#o‘zbekcha-versiya)**

---

# 🇬🇧 English Version

## 📘 Overview

Loops are **core control structures** in Dart that allow repeating tasks efficiently.  
They transform logic into **machine-level iteration** controlled by CPU jump and compare instructions.

---

### 🧩 Quick Navigation

- [How Loops Work Internally](#how-loops-work-internally)
- [For Loop](#for-loop)
- [For-In Loop](#for-in-loop)
- [While Loop](#while-loop)
- [Do-While Loop](#do-while-loop)
- [Break Statement](#break-statement)
- [Continue Statement](#continue-statement)
- [Label with Break/Continue](#label-with-breakcontinue)
- [CPU-Level View](#cpu-level-view)
- [Summary Table](#summary-table)
- [Visualization Diagram](#visualization-diagram)

---

## ⚙️ How Loops Work Internally

When Dart code runs, loops are converted by the Dart **VM** or **AOT compiler** into CPU instructions:

1. **Initialization** → Store loop variable (register or stack)
2. **Condition check** → CPU uses `CMP` instruction
3. **Conditional branch** → Jump if false (`JGE`, `JNE`)
4. **Body execution**
5. **Increment and jump back**

🧬 **At machine level**, loops are just smartly arranged **jump (JMP)** and **compare (CMP)** instructions executed repeatedly.

---

## 🔂 For Loop

```dart
for (var i = 0; i < 5; i++) {
  print('Index: $i');
}
```

**Logic:**
- Initialize → i = 0
- Condition → i < 5
- Execute → print
- Increment → i++
- Repeat until condition is false

**CPU Equivalent:**
```
MOV i, 0
loop_start:
CMP i, 5
JGE loop_end
; body executes
INC i
JMP loop_start
loop_end:
```

**Use When:**
- You know the exact number of iterations
- You need full control of counter

---

## 🌀 For-In Loop

```dart
var list = ['A', 'B', 'C'];
for (var item in list) {
  print(item);
}
```

**Logic:**
- Uses Dart’s Iterator API under the hood

**Internals:**
- `Iterator.moveNext()` and `Iterator.current` are method calls.
- Slight overhead, but more expressive.

**Use When:**
- Working with List, Set, Map, or any Iterable.

---

## ♾️ While Loop

```dart
var i = 0;
while (i < 3) {
  print(i);
  i++;
}
```

**Logic:**
- Condition is checked before each iteration.
- May not execute at all if condition false initially.

**Use When:**
- You don’t know how many times to loop (e.g., reading user input).

---

## 🔁 Do-While Loop

```dart
var i = 0;
do {
  print(i);
  i++;
} while (i < 3);
```

**Logic:**
- Executes at least once, because condition is checked after the loop body.

**Use When:**
- You need body to run once before condition check.

---

## ⛔ Break Statement

```dart
for (var i = 0; i < 10; i++) {
  if (i == 5) break;
  print(i);
}
```

**Logic:**
- Immediately exits loop when condition met.

**Use When:**
- Early termination is needed.

---

## ➡️ Continue Statement

```dart
for (var i = 0; i < 10; i++) {
  if (i == 5) continue;
  print(i);
}
```

**Logic:**
- Skips current iteration, moves to next check.

**Use When:**
- You want to skip certain values but continue looping.

---

## 🏷️ Label with Break/Continue

```dart
outer:
for (var i = 0; i < 3; i++) {
  for (var j = 0; j < 3; j++) {
    if (i == 1 && j == 1) break outer;
    print('i=$i, j=$j');
  }
}
```

**Logic:**
- Labels let you control nested loops directly.
- `break outer` exits from the labeled loop.

**Use When:**
- Handling nested loop exits.

---

## 🧮 CPU-Level View

| Dart Operation | CPU Equivalent | Description         |
|:--------------:|:--------------:|:-------------------|
| i++            | INC register   | Increase counter   |
| i < 5          | CMP + JL       | Compare and branch |
| break          | JMP end        | Exit loop          |
| continue       | JMP check      | Skip to next       |
| Nested label   | Named jump     | Scoped branch      |

---

## 📊 Summary Table

| Loop Type   | Condition Position | Runs Once? | Common Use      | Performance |
|-------------|-------------------|------------|-----------------|-------------|
| for         | Before            | ❌         | Known count     | Fastest     |
| for-in      | Hidden            | ❌         | Collections     | Medium      |
| while       | Before            | ❌         | Condition-based | Fast        |
| do-while    | After             | ✅         | At least once   | Fast        |
| break       | —                 | —          | Exit loop       | Immediate   |
| continue    | —                 | —          | Skip iteration  | Controlled  |
| label       | —                 | —          | Nested control  | Scoped      |

---

## 🧭 Visualization Diagram

```
┌───────────────┐
│ Initialization│
└──────┬────────┘
       │
       ▼
┌───────────────┐
│ Condition true│───YES──▶ Execute Body
└──────┬────────┘
       │ NO
       ▼
   Exit Loop
```

💬 *A loop is not just repetition — it’s the heartbeat of the CPU.*

---

# 🇺🇿 O‘zbekcha Versiya

## 📘 Umumiy tushuncha

Loop — bu takroriy bajariladigan kod bo‘lib, shart to‘g‘ri bo‘lganicha kodni qayta-qayta ishlaydi.  
Dart’da bu kodlar VM yoki AOT kompilyator orqali CPU buyruqlariga (JMP, CMP, INC) aylanadi.

---

## ⚙️ Loop ichki ishlashi

1. Boshlanish (i=0)
2. Shart tekshiruvi (i<5)
3. Agar to‘g‘ri bo‘lsa → bajarish
4. O‘zgartirish (i++)
5. Shartni qayta tekshirish

CPU darajasida bu shunchaki:  
`CMP`, `JMP`, `INC` buyruqlar ketma-ketligi.

---

## 🔂 For Loop

```dart
for (var i = 0; i < 5; i++) {
  print('i = $i');
}
```

- i = 0 → boshlanish
- i < 5 → tekshiruv
- print() → bajarish
- i++ → orttirish

CPU kod ko‘rinishi:
```
MOV i, 0
CMP i, 5
JGE END
INC i
JMP START
END:
```

---

## 🌀 For-In Loop

```dart
var list = ['A', 'B', 'C'];
for (var item in list) {
  print(item);
}
```

Ichkarida bu:
```dart
var it = list.iterator;
while (it.moveNext()) {
  var item = it.current;
  print(item);
}
```

---

## ♾️ While Loop

```dart
var i = 0;
while (i < 3) {
  print(i);
  i++;
}
```

- Shart avval tekshiriladi.
- Agar false bo‘lsa — loop bajarilmaydi.

---

## 🔁 Do-While Loop

```dart
var i = 0;
do {
  print(i);
  i++;
} while (i < 3);
```

- Avval bajariladi, keyin tekshiriladi.
- Kamida bir marta ishlaydi.

---

## ⛔ Break

```dart
for (var i = 0; i < 10; i++) {
  if (i == 5) break;
  print(i);
}
```

- break → loopdan chiqadi.
- CPU’da JMP END ko‘rinishida ishlaydi.

---

## ➡️ Continue

```dart
for (var i = 0; i < 10; i++) {
  if (i == 5) continue;
  print(i);
}
```

- Hozirgi iteratsiyani o‘tkazib yuboradi, keyingisiga o‘tadi.

---

## 🏷️ Label bilan Break

```dart
outer:
for (var i = 0; i < 3; i++) {
  for (var j = 0; j < 3; j++) {
    if (i == 1 && j == 1) break outer;
    print('i=$i, j=$j');
  }
}
```

- outer: → bu loop nomi, break outer — to‘g‘ridan-to‘g‘ri tashqaridagi loopdan chiqadi.

---

## ⚙️ CPU darajasida

| Dart amali | CPU buyrug‘i | Tushuntirish         |
|:----------:|:------------:|:--------------------:|
| i++        | INC          | Qo‘shish             |
| i<5        | CMP          | Solishtirish         |
| break      | JMP END      | Chiqish              |
| continue   | JMP CONDITION| Keyingiga o‘tish     |
| label:     | manzil       | Belgilangan sakrash  |

---

## 🖥️ Diagram

```
     ┌───────────────┐
     │ Boshlanish    │
     └──────┬────────┘
            ▼
     ┌───────────────┐
     │ Shart to‘g‘rimi│──YES──▶ Kod bajariladi
     └──────┬────────┘
            │ NO
            ▼
         Loop tugaydi
```

---

💡 *Loop — bu CPUning yurak urishidir: har zarbda mantiq ishlaydi.*