# Dart Variables, Identifiers, and Advanced Internal Concepts 

> “Master control flow, master performance.”  
> — Azamov’s Dart Notes  

## Language Selection
Choose a language to view the content:

- [English](#english-version)
- [Uzbek](#uzbek-version)

---

## English Version

### 1. What is a Variable? (Deeper Internal Explanation)

A **variable** is a named storage location in memory that holds data, allowing programs to store, manipulate, and retrieve values dynamically during execution. In Dart, variables are strongly typed, meaning their type is checked at compile time (for static types) or runtime (for dynamic types), ensuring type safety.

**Internal Memory Allocation and Storage:**
- **Declaration Phase**: When you declare a variable (e.g., `int age;`), Dart's compiler reserves space in the stack or heap based on the type. Primitive types like `int` and `bool` are typically stack-allocated for efficiency, while objects like `String` are heap-allocated.
- **Initialization Phase**: Assigning a value (e.g., `age = 25;`) stores the data in the allocated memory. For heap-allocated variables, a reference (pointer) is stored on the stack, pointing to the actual data on the heap.
- **Memory Size and Management**:
  - `int`: 4 bytes (32-bit) on 32-bit systems, 8 bytes (64-bit) on 64-bit systems; handles signed integers from -2^63 to 2^63-1 on 64-bit.
  - `double`: 8 bytes, following IEEE 754 floating-point standard for precision.
  - `bool`: Internally 1 byte, but Dart optimizes it to use a single bit in some contexts (e.g., bitfields in objects).
  - `String`: Heap-allocated; each character uses 2 bytes (UTF-16). Strings are immutable, so modifications create new strings, triggering garbage collection for old ones.
- **Dart VM Role**: In the Dart Virtual Machine (VM), variables are managed via isolates (lightweight threads). Each isolate has its own heap, preventing shared memory issues. Garbage collection (GC) automatically reclaims unused memory using a generational GC algorithm: young generation for short-lived objects (frequent minor GC) and old generation for long-lived ones (major GC with mark-sweep-compact).

**Flowchart: Variable Lifecycle in Dart Runtime**
```plaintext
[Start: Code Compilation]
   |
   v
[Declaration: Type Check & Memory Reservation]
   | (Stack for primitives, Heap for objects)
   v
[Initialization: Assign Value]
   | (Store data or reference)
   v
[Usage: Read/Modify]
   | (Runtime type checks for dynamic)
   v
[Garbage Collection: If unreferenced]
   | (Minor GC for young gen, Major for old)
   v
[End: Memory Reclaimed]
```

**Syntax Examples with Internal Notes:**
```dart
int age = 25;        // Stack-allocated; fixed size, no GC needed unless part of object.
String name = 'Ali'; // Heap-allocated; immutable, GC-eligible on reassignment.
double price = 12.5; // Stack-allocated; floating-point precision handled by CPU.
bool available = true; // Optimized storage; true/false are singleton instances in Dart VM.
```

---

### 2. What is an Identifier? (Advanced Rules and Internals)

An **identifier** is a user-defined name for variables, functions, classes, or other program elements. Internally, identifiers are hashed and stored in symbol tables during compilation for quick lookup.

**Advanced Rules and Constraints:**
- Unicode support: Dart allows Unicode characters in identifiers (e.g., emojis or non-Latin scripts), but it's discouraged for portability.
- Private identifiers: Prefix with `_` (e.g., `_privateVar`) to indicate library-private scope; enforced at compile time.
- Symbol interning: Dart VM interns (caches) identifiers as symbols for efficiency, reducing memory usage for repeated names.
- Collision avoidance: Case-sensitivity prevents collisions (e.g., `var` vs `Var`), and reserved keywords are blacklisted in the parser.

**Valid Examples (with Notes):**
```dart
int son1;      // Simple alphanumeric.
double _narx;  // Private identifier; scoped to library.
String $nom;   // Allowed but uncommon; $ is for generated code often.

String emojiVar = '😊'; // Unicode allowed, but avoid in production.
```

**Invalid Examples (with Reasons):**
```dart
int 1son;      // Starts with digit; parser error.
double class;  // Reserved keyword; compile-time error.
int invalid-char; // Hyphen not allowed; use underscore instead.
```

**Internal Flow: Identifier Resolution**
```plaintext
[Parse Code]
   |
   v
[Check Rules: Valid chars? No leading digit? Not reserved?]
   | (If fail: Compile Error)
   v
[Hash & Store in Symbol Table]
   |
   v
[Scope Check: Global/Local/Private?]
   |
   v
[Runtime Lookup: Fast hash-based access]
   |
   v
[End]
```

---

### 3. Variable Types in Dart (Deeper Internals)

Dart's type system is sound with null safety (since Dart 2.12), preventing null dereference errors at runtime. Types are categorized as static (compile-time checked) and dynamic (runtime checked).

**Core Data Types and Internal Details:**
- `int`: BigInt support for arbitrary precision if value exceeds 64 bits; automatically switches in VM.
- `double`: Uses CPU's floating-point unit (FPU); susceptible to precision issues (e.g., 0.1 + 0.2 != 0.3).
- `String`: Immutable; string interning in VM caches common strings to save memory.
- `bool`: Singleton instances (`true` and `false`); no custom booleans allowed.
- `var`: Static type inference; equivalent to explicit type but resolved at compile time.
- `dynamic`: Bypasses static type checks; useful for JSON or interop, but increases runtime overhead and error risk.

**Null Safety Internals**: Non-nullable by default (e.g., `int` cannot be null). Use `?` for nullable (e.g., `int?`). Flow analysis tracks nullability to avoid unnecessary checks.

**Examples with Internals:**
```dart
int a = 10;             // Static type; no runtime check.
double b = 3.14;        // FPU-optimized.
String s = 'Hello';     // Interned if common; GC-managed.
bool isTrue = false;    // Singleton reference.
var message = 'Dart';   // Inferred String; compile-time fixed.
dynamic value = 123;    // Runtime type check; can reassign to String.
int? nullable = null;   // Null safety; requires checks before use.
```

**Flowchart: Type Inference and Checking**
```plaintext
[Declare with var/dynamic]
   |
   v
[Compile Time: Infer type for var? Static check.]
   | (Error if mismatch)
   v
[Runtime: For dynamic/nullables, check type/null]
   | (If fail: Runtime Error)
   v
[Execute]
   |
   v
[End]
```

---

### 4. Ways to Declare Variables (Advanced)

#### 4.1. Explicit Type Declaration
Fixed type; compile-time enforcement.
```dart
int age = 20; // Type mismatch error if assigned String.
```

#### 4.2. Using `var`
Inferred but static; cannot change type after inference.
```dart
var name = 'Ali'; // String; cannot reassign to int.
```

#### 4.3. Using `final` and `const`
Immutable; `final` for runtime constants, `const` for compile-time.
- Internals: `const` values are canonicalized (shared instances) in VM to optimize memory.

```dart
final birthYear = 2000; // Runtime immutable.
const PI = 3.1415;      // Compile-time; shared across app.
```

#### 4.4. Difference Between `final` and `const` (Expanded)

| Feature             | `final`                              | `const`                                 |
|--------------------|--------------------------------------|-----------------------------------------|
| Mutability         | Set once (runtime), immutable        | Set once (compile-time), immutable      |
| Syntax             | `final name = value;`               | `const name = value;`                   |
| Assignment Time    | Runtime (e.g., function call)        | Compile-time (static expressions only)  |
| Dynamic Values     | Allowed (e.g., `DateTime.now()`)     | Not allowed; must be constant expr.     |
| Memory Usage       | Instance-specific allocation         | Canonicalized (shared memory)           |
| Use in Classes     | Instance fields; late initialization | Static fields; compile-time constants   |
| GC Impact          | Eligible for GC if unreferenced      | Often not GC'd as compile-time embeds   |

**Advanced Examples:**
```dart
final now = DateTime.now(); // Runtime value; unique per execution.
const daysInWeek = 7;       // Embedded in bytecode; no runtime allocation.
class MyClass {
  final int id = _generateId(); // Runtime init.
  static const String version = '1.0'; // Compile-time.
}
```

**Flowchart: `final` vs `const` Initialization**
```plaintext
[Code with final/const]
   |
   v
[Compile: For const, evaluate expr now?]
   | (If dynamic: Error)
   v
[Runtime: For final, assign once]
   | (Reassign attempt: Error)
   v
[Immutable Access]
   |
   v
[End]
```

---

### 5. Rules for Using Variables (Advanced Scoping and Internals)

- **Scoping**: Block-scoped (e.g., local in functions/loops); no hoisting like in JavaScript – must declare before use.
- **Late Initialization**: Use `late` for variables initialized later (e.g., `late int value;`), but access before init causes runtime error.
- **Type Promotion**: Flow analysis promotes types (e.g., nullable to non-nullable after null check).
- **Reassignment**: Allowed unless `final/const`; for objects, reassign reference, but old object GC'd if unreferenced.

**Incorrect (with Internal Error):**
```dart
int number;
print(number); // Runtime error: Uninitialized variable access.
```

**Correct (with Scope):**
```dart
void main() {
  if (true) {
    int local = 5; // Block-scoped.
  }
  // print(local); // Compile error: Out of scope.
}
```

**Flowchart: Variable Scoping and Access**
```plaintext
[Enter Block/Scope]
   |
   v
[Declare Variable: Allocate in current scope]
   |
   v
[Access: Check scope chain?]
   | (If out of scope: Error)
   v
[Exit Scope: Deallocate locals, GC if needed]
   |
   v
[End]
```

---

### 6. Reserved Keywords (Full List with Categories)

Dart reserves keywords for language constructs. Categories:
- **Control Flow**: `if`, `else`, `for`, `while`, `do`, `switch`, `case`, `break`, `continue`, `return`, `yield`, `await`.
- **Declarations**: `class`, `enum`, `extension`, `mixin`, `typedef`, `var`, `final`, `const`, `late`, `abstract`, `interface`.
- **Types/Operators**: `dynamic`, `void`, `Function`, `operator`, `get`, `set`, `as`, `is`, `in`.
- **Exceptions**: `try`, `catch`, `finally`, `throw`, `rethrow`, `assert`.
- **Modules**: `import`, `export`, `library`, `part`, `deferred`, `hide`, `show`.
- **Concurrency**: `async`, `sync`.
- **Booleans/Null**: `true`, `false`, `null`.
- **Other**: `super`, `this`, `external`, `factory`, `implements`, `extends`, `with`, `covariant`, `new`, `on`.

Avoid these as identifiers to prevent parse errors.

---

### 7. Practical Examples (with Advanced Concepts)

```dart
void main() {
  // Basic
  int age = 18;
  String name = 'Aziz';
  double price = 99.99;
  bool available = true;
  var message = 'Learning Dart!'; // Inferred String.
  dynamic flexible = 123;         // Can change to String.
  flexible = 'Now a string';      // Runtime ok.

  // Immutable
  final birthYear = 2005;
  const PI = 3.14;

  // Nullable and Late
  int? nullableAge;               // Null allowed.
  late String lateName;           // Must initialize before use.
  lateName = 'Initialized';

  // Scope and Flow Analysis
  if (nullableAge != null) {
    int nonNull = nullableAge;    // Promoted to non-null.
    print(nonNull);
  }

  print('$name is $age years old');
  print('Price: $price | Available: $available');
  print(message);
  print('Birth Year: $birthYear | PI: $PI');
  print('Late Name: $lateName');
}
```

**Output (Sample):**
```
Aziz is 18 years old
Price: 99.99 | Available: true
Learning Dart!
Birth Year: 2005 | PI: 3.14
Late Name: Initialized
```

**Internal Notes on Example:**
- `dynamic`: Bypasses static checks; useful for APIs but risky.
- `late`: Defers allocation; runtime check on access.
- Null promotion: VM tracks flow to optimize checks.

---

### 8. Quick Reference List (Quicklist)

- **Variable**: Named memory slot; stack/heap allocated based on type.
- **Identifier**: Hashed name in symbol table; Unicode ok but avoid; private with `_`.
- **Data Types**:
  - Primitives: `int` (4-8 bytes, BigInt auto), `double` (IEEE 754), `bool` (singletons), `String` (immutable, interned).
  - Inference: `var` (static), `dynamic` (runtime).
- **Declaration**:
  - Explicit: Type safety at compile time.
  - Immutable: `final` (runtime), `const` (compile-time, canonicalized).
  - Advanced: `late` (deferred init), `?` (nullable).
- **`final` vs `const`**: Runtime vs compile-time; memory sharing for `const`.
- **Rules**: Block-scoped, no hoisting, type match, meaningful names.
- **Reserved Keywords**: 50+; categorized for control, declarations, etc.
- **Internals**: Isolates for threading, generational GC, flow analysis for null safety.
- **Memory/GC**: Heap for objects, stack for primitives; young/old gen GC.
- **Flows**: Lifecycle: Declare → Allocate → Assign → Use → GC.

---

### 9. Conclusion

Understanding variables and identifiers in Dart, including their internal memory management, type system, scoping, and runtime behaviors in the Dart VM, is crucial for building efficient, safe applications. This knowledge is essential for advanced programming and acing technical interviews, as it reveals how Dart ensures performance and reliability under the hood.

---

## Uzbek Version

### 1. O‘zgaruvchi (Variable) Nima? (Chuqurroq Ichki Tushuntirish)

**O‘zgaruvchi** – dasturda ma’lumotlarni saqlash, o‘zgartirish va olish uchun ishlatiladigan nomlangan xotira joyi. Dartda o‘zgaruvchilar kuchli tipizatsiyalangan, ya’ni tipi kompilyatsiya vaqtida (statik tiplar uchun) yoki runtime’da (dinamik tiplar uchun) tekshiriladi, tip xavfsizligini ta’minlaydi.

**Ichki Xotira Ajratish va Saqlash:**
- **E’lon Qilish Bosqichi**: O‘zgaruvchi e’lon qilinganda (masalan, `int yosh;`), Dart kompilyatori tipiga qarab stack yoki heap’da joy ajratadi. Oddiy tiplar (`int`, `bool`) samaradorlik uchun stack’da, obyektlar (`String`) heap’da saqlanadi.
- **Inicializatsiya Bosqichi**: Qiymat berilganda (masalan, `yosh = 25;`) ma’lumot ajratilgan xotiraga joylanadi. Heap’dagi o‘zgaruvchilar uchun stack’da havola (pointer) saqlanadi, haqiqiy ma’lumot heap’da.
- **Xotira Hajmi va Boshqarish:**
  - `int`: 32-bit tizimlarda 4 bayt, 64-bit’da 8 bayt; -2^63 dan 2^63-1 gacha qiymatlar, katta qiymatlar uchun BigInt avtomatik.
  - `double`: 8 bayt, IEEE 754 standartiga asosan aniqlik ta’minlanadi.
  - `bool`: Ichki 1 bayt, ba’zan obyektlar ichida bitfield sifatida optimizatsiya qilinadi.
  - `String`: Heap’da saqlanadi; har bir belgisi 2 bayt (UTF-16). O‘zgarmas (immutable), o‘zgartirish yangi string hosil qiladi va eskisini GC uchun belgilaydi.
- **Dart VM Roli**: Dart Virtual Machine (VM) da o‘zgaruvchilar isolates (yengil thread’lar) orqali boshqariladi. Har bir isolate o‘z heap’iga ega, umumiy xotira muammolarini oldini oladi. Garbage collection (GC) ishlatilmagan xotirani avtomatik tozalaydi, generational GC algoritmi bilan: young generation (tez minor GC) va old generation (major GC, mark-sweep-compact).

**O‘zgaruvchi Hayot Tsikli Oqimi**
```plaintext
[Start: Kod Kompilyatsiyasi]
   |
   v
[E’lon: Tip Tekshirish & Xotira Rezervatsiyasi]
   | (Oddiy uchun stack, obyektlar uchun heap)
   v
[Inicializatsiya: Qiymat Berish]
   | (Ma’lumot yoki havola saqlash)
   v
[Foydalanish: O‘qish/O‘zgartirish]
   | (Dinamik uchun runtime tip tekshirish)
   v
[Garbage Collection: Agar havolasiz bo‘lsa]
   | (Young gen uchun minor GC, old uchun major)
   v
[End: Xotira Qaytariladi]
```

**Sintaksis Misollari Ichki Izohlar Bilan:**
```dart
int yosh = 25;        // Stack’da saqlanadi; o‘lchami doimiy, obyekt bo‘lmasa GC kerak emas.
String ism = 'Ali';   // Heap’da; o‘zgarmas, qayta belgilash eskisini GC uchun belgilaydi.
double narx = 12.5;   // Stack’da; CPU FPU orqali aniqlik boshqariladi.
bool mavjud = true;   // Singleton instansiyalar; true/false Dart VM’da bitta havola.
```

---

### 2. Identifikator (Identifier) Nima? (Ilg‘or Qoidalar va Ichki Qismlar)

**Identifikator** – o‘zgaruvchi, funksiya, klasslar va boshqa elementlar uchun foydalanuvchi tomonidan berilgan nom. Ichki ravishda, identifikatorlar kompilyatsiya vaqtida symbol jadvalida hash’lanib saqlanadi, tez qidirish uchun.

**Ilg‘or Qoidalar va Cheklovlar:**
- Unicode qo‘llab-quvvatlash: Dart identifikatorlarda Unicode belgilarni (masalan, emoji yoki lotin emas skriptlarni) ruxsat etadi, ammo portativlik uchun tavsiya etilmaydi.
- Maxsus identifikatorlar: `_` bilan boshlanadigan (masalan, `_maxsusVar`) kutubxona ichida maxsus (private) hisoblanadi; kompilyatsiya vaqtida ta’minlanadi.
- Symbol interning: Dart VM identifikatorlarni symbol sifatida intern (kesh) qiladi, takroriy nomlar uchun xotirani tejaydi.
- To‘qnashuvdan qochish: Katta-kichik harf farqi to‘qnashuvlarni oldini oladi (masalan, `var` vs `Var`), ajratilgan so‘zlar parser’da qora ro‘yxatda.

**To‘g‘ri Misollar (Izohlar Bilan):**
```dart
int son1;      // Oddiy alfanumerik.
double _narx;  // Maxsus identifikator; kutubxona ichida cheklangan.
String $nom;   // Ruxsat, ammo odatiy emas; $ generatsiya qilingan kod uchun.

String emojiVar = '😊'; // Unicode ruxsat, ammo ishlab chiqarishda qoching.
```

**Xato Misollar (Sabablari Bilan):**
```dart
int 1son;      // Raqam bilan boshlanadi; parser xatosi.
double class;  // Ajratilgan so‘z; kompilyatsiya xatosi.
int invalid-char; // Tire ruxsat emas; underscore ishlat.
```

**Ichki Oqim: Identifikator Hal Qilish**
```plaintext
[Kodni Parse Qilish]
   |
   v
[Qoidalarni Tekshirish: To‘g‘ri belgilar? Raqam bilan boshlanmaydi? Ajratilgan emas?]
   | (Muvaffaqiyatsiz: Kompilyatsiya Xatosi)
   v
[Hash & Symbol Jadvalida Saqlash]
   |
   v
[Scope Tekshirish: Global/Mahalliy/Maxsus?]
   |
   v
[Runtime Qidirish: Tez hash asosida]
   |
   v
[End]
```

---

### 3. Dartda O‘zgaruvchilar Tiplari (Chuqurroq Ichki Qismlar)

Dart tip tizimi null safety (Dart 2.12 dan) bilan mustahkam, runtime’da null dereference xatolarini oldini oladi. Tiplar statik (kompilyatsiya vaqtida tekshiriladi) va dinamik (runtime’da) ga bo‘linadi.

**Asosiy Ma’lumot Tiplari va Ichki Tafsilotlar:**
- `int`: Qiymat 64 bitdan oshsa BigInt qo‘llab-quvvatlash; VM’da avtomatik o‘tish.
- `double`: CPU FPU ishlatadi; aniqlik muammolari mavjud (masalan, 0.1 + 0.2 != 0.3).
- `String`: O‘zgarmas; VM’da umumiy stringlar intern qilinadi, xotirani tejaydi.
- `bool`: Singleton instansiyalar (`true` va `false`); maxsus bool’lar ruxsat etilmaydi.
- `var`: Statik tip aniqlash; eksplicit tip bilan ekvivalent, kompilyatsiya vaqtida hal qilinadi.
- `dynamic`: Statik tekshirishlarni o‘tkazib yuboradi; JSON yoki interop uchun foydali, ammo runtime yuklamasi va xato xavfini oshiradi.

**Null Safety Ichki**: Standart non-nullable (masalan, `int` null bo‘lolmaydi). Nullable uchun `?` ishlat (masalan, `int?`). Oqim tahlili nullability’ni kuzatib, keraksiz tekshirishlarni oldini oladi.

**Misollar Ichki Bilan:**
```dart
int a = 10;             // Statik tip; runtime tekshirish yo‘q.
double b = 3.14;        // FPU optimizatsiyalangan.
String s = 'Salom';     // Umumiy bo‘lsa intern; GC boshqariladi.
bool isTrue = false;    // Singleton havola.
var xabar = 'Dart';     // String sifatida aniqlanadi; kompilyatsiya vaqtida qattiq.
dynamic qiymat = 123;   // Runtime tip tekshirish; String’ga qayta belgilash mumkin.
int? nullOladi = null;  // Null safety; ishlatishdan oldin tekshirish kerak.
```

**Tip Aniqlash va Tekshirish Oqimi**
```plaintext
[var/dynamic Bilan E’lon]
   |
   v
[Kompilyatsiya: var uchun tip aniqlash? Statik tekshirish.]
   | (Mos kelmasa: Xato)
   v
[Runtime: Dinamik/nullables uchun tip/null tekshirish]
   | (Muvaffaqiyatsiz: Runtime Xatosi)
   v
[Ishga Tushirish]
   |
   v
[End]
```

---

### 4. O‘zgaruvchilarni E’lon Qilish Usullari (Ilg‘or)

#### 4.1. Aniq Tip Bilan E’lon
Qattiq tip; kompilyatsiya vaqtida ta’minlanadi.
```dart
int yosh = 20; // String belgilash tip xatosi.
```

#### 4.2. `var` Bilan
Aniqlangan lekin statik; aniqlangandan keyin tip o‘zgarmaydi.
```dart
var ism = 'Ali'; // String; int’ga qayta belgilab bo‘lmaydi.
```

#### 4.3. `final` va `const` Bilan
O‘zgarmas; `final` runtime doimiylar uchun, `const` kompilyatsiya vaqtida.
- Ichki: `const` qiymatlar VM’da kanonizatsiya qilinadi (umumiy instansiyalar), xotirani optimallashtiradi.

```dart
final tugilganYil = 2000; // Runtime o‘zgarmas.
const PI = 3.1415;        // Kompilyatsiya vaqtida; butun app bo‘ylab umumiy.
```

#### 4.4. `final` va `const` O‘rtasidagi Farq (Kengaytirilgan)

| Xususiyat          | `final`                              | `const`                                 |
|--------------------|--------------------------------------|-----------------------------------------|
| O‘zgartirish       | Bir marta (runtime), o‘zgarmaydi    | Bir marta (kompilyatsiya), o‘zgarmaydi  |
| Sintaksis          | `final ism = qiymat;`               | `const ism = qiymat;`                   |
| Aniqlanish Vaqti   | Runtime (masalan, funksiya chaqiruvi)| Kompilyatsiya vaqtida (statik ifodalar) |
| Dinamik Qiymatlar  | Ruxsat (masalan, `DateTime.now()`)   | Ruxsat emas; doimiy ifoda bo‘lishi kerak|
| Xotira Sarfi       | Instansiya bo‘yicha alohida ajratish| Kanonizatsiya qilinadi (umumiy xotira)   |
| Klasslarda         | Instansiya maydonlari; kech inicializatsiya | Statik maydonlar; kompilyatsiya doimiylari |
| GC Ta’siri         | Havolasiz bo‘lsa GC uchun mos        | Ko‘pincha GC’siz, bytecode’da o‘rnatiladi |

**Ilg‘or Misollar:**
```dart
final hozir = DateTime.now(); // Runtime qiymati; har ishlashda noyob.
const haftadaKunlar = 7;      // Baytkod’da o‘rnatiladi; runtime ajratish yo‘q.
class MeningKlassim {
  final int id = _idGeneratsiya(); // Runtime init.
  static const String versiya = '1.0'; // Kompilyatsiya vaqtida.
}
```

**`final` vs `const` Inicializatsiya Oqimi**
```plaintext
[final/const Bilan Kod]
   |
   v
[Kompilyatsiya: const uchun ifodani hozir baholash?]
   | (Dinamik bo‘lsa: Xato)
   v
[Runtime: final uchun bir marta belgilash]
   | (Qayta belgilash urinishi: Xato)
   v
[O‘zgarmas Kirish]
   |
   v
[End]
```

---

### 5. O‘zgaruvchilarni Ishlatish Qoidalari (Ilg‘or Scope va Ichki)

- **Scope**: Blok-scope (masalan, funksiya/loop ichida mahalliy); JavaScript’dagi hoisting yo‘q – ishlatishdan oldin e’lon kerak.
- **Kech Inicializatsiya**: `late` bilan kech o‘zgaruvchilar (masalan, `late int qiymat;`), ammo init’siz kirish runtime xatosi.
- **Tip Oshirish**: Oqim tahlili tiplarni oshiradi (masalan, nullables null tekshirishdan keyin non-nullable ga).
- **Qayta Belgilash**: `final/const` dan tashqari ruxsat; obyektlar uchun havola qayta belgilash, eski obyekt havolasiz bo‘lsa GC’d.

**Xato (Ichki Xato Bilan):**
```dart
int son;
print(son); // Runtime xatosi: Inicializatsiyasiz kirish.
```

**To‘g‘ri (Scope Bilan):**
```dart
void main() {
  if (true) {
    int mahalliy = 5; // Blok-scope.
  }
  // print(mahalliy); // Kompilyatsiya xatosi: Scope tashqarisida.
}
```

**O‘zgaruvchi Scope va Kirish Oqimi**
```plaintext
[Blok/Scope’ga Kirish]
   |
   v
[O‘zgaruvchi E’lon: Joriy scope’da ajratish]
   |
   v
[Kirish: Scope zanjirini tekshirish?]
   | (Scope tashqarisida: Xato)
   v
[Scope’dan Chiqish: Mahalliy’larni tozalash, kerak bo‘lsa GC]
   |
   v
[End]
```

---

### 6. Ajratilgan So‘zlar (To‘liq Ro‘yxat Kategoriyalar Bilan)

Dart til tuzilmalari uchun ajratilgan so‘zlar. Kategoriyalar:
- **Boshqaruv Oqimi**: `if`, `else`, `for`, `while`, `do`, `switch`, `case`, `break`, `continue`, `return`, `yield`, `await`.
- **E’lonlar**: `class`, `enum`, `extension`, `mixin`, `typedef`, `var`, `final`, `const`, `late`, `abstract`, `interface`.
- **Tiplar/Operatorlar**: `dynamic`, `void`, `Function`, `operator`, `get`, `set`, `as`, `is`, `in`.
- **Istisnolar**: `try`, `catch`, `finally`, `throw`, `rethrow`, `assert`.
- **Modullar**: `import`, `export`, `library`, `part`, `deferred`, `hide`, `show`.
- **Parallellik**: `async`, `sync`.
- **Mantiqiy/Null**: `true`, `false`, `null`.
- **Boshqalar**: `super`, `this`, `external`, `factory`, `implements`, `extends`, `with`, `covariant`, `new`, `on`.

Bu so‘zlarni identifikator sifatida ishlatmang, parse xatolari oldini olish uchun.

---

### 7. Amaliy Misollar (Ilg‘or Konsepsiyalar Bilan)

```dart
void main() {
  // Asosiy
  int yosh = 18;
  String ism = 'Aziz';
  double narx = 99.99;
  bool mavjud = true;
  var xabar = 'Dart o‘rganamiz!'; // String sifatida aniqlanadi.
  dynamic moslashuvchan = 123;     // String’ga o‘tish mumkin.
  moslashuvchan = 'Endi matn';    // Runtime ok.

  // O‘zgarmas
  final tugilganYil = 2005;
  const PI = 3.14;

  // Null va Late
  int? nullOladi;                 // Null ruxsat.
  late String kechIsm;            // Ishlatishdan oldin inicializatsiya kerak.
  kechIsm = 'Inicializatsiya qilingan';

  // Scope va Oqim Tahlili
  if (nullOladi != null) {
    int nonNull = nullOladi;      // Non-null ga oshirilgan.
    print(nonNull);
  }

  print('$ism $yosh yoshda');
  print('Narx: $narx | Mavjud: $mavjud');
  print(xabar);
  print('Tug‘ilgan yil: $tugilganYil | PI: $PI');
  print('Kech Ism: $kechIsm');
}
```

**Chiqish (Namuna):**
```
Aziz 18 yoshda
Narx: 99.99 | Mavjud: true
Dart o‘rganamiz!
Tug‘ilgan yil: 2005 | PI: 3.14
Kech Ism: Inicializatsiya qilingan
```

**Misol Ichki Izohlar:**
- `dynamic`: Statik tekshirishlarni o‘tkazib yuboradi; API’lar uchun foydali lekin xavfli.
- `late`: Ajratishni kechiktiradi; kirishda runtime tekshirish.
- Null oshirish: VM oqimni kuzatib, optimizatsiya qiladi.

---

### 8. Tez Ma’lumot Ro‘yxati (Quicklist)

- **O‘zgaruvchi**: Nomlangan xotira joyi; tipiga qarab stack/heap ajratish.
- **Identifikator**: Symbol jadvalida hash’langan nom; Unicode ok lekin qoching; `_` bilan maxsus.
- **Ma’lumot Tiplari**:
  - Oddiy: `int` (4-8 bayt, BigInt auto), `double` (IEEE 754), `bool` (singleton), `String` (o‘zgarmas, intern).
  - Aniqlash: `var` (statik), `dynamic` (runtime).
- **E’lon Qilish**:
  - Aniq: Kompilyatsiya vaqtida xavfsizlik.
  - O‘zgarmas: `final` (runtime), `const` (kompilyatsiya, kanonizatsiya).
  - Ilg‘or: `late` (kech init), `?` (nullables).
- **`final` vs `const`**: Runtime vs kompilyatsiya; `const` uchun xotira baham.
- **Qoidalar**: Blok-scope, hoisting yo‘q, tip mos, ma’noli nomlar.
- **Ajratilgan So‘zlar**: 50+; boshqaruv, e’lonlar va h.k. bo‘yicha kategoriyalar.
- **Ichki**: Isolates uchun threading, generational GC, null safety uchun oqim tahlili.
- **Xotira/GC**: Obyektlar uchun heap, oddiy uchun stack; young/old gen GC.
- **Oqimlar**: Hayot tsikli: E’lon → Ajratish → Belgilash → Foydalanish → GC.

---

### 9. Xulosa

Dartda o‘zgaruvchilar va identifikatorlarni tushunish, ularning ichki xotira boshqarish, tip tizimi, scope va Dart VM’dagi runtime xatti-harakatlari samarali, xavfsiz ilovalar yaratish uchun muhim. Bu bilim ilg‘or dasturlash va texnik intervyularda muvaffaqiyat uchun asosiy hisoblanadi, chunki Dart unumdorlik va ishonchlilikni qanday ta’minlashini ochib beradi.