# Dart va Kotlin: GC, SDK, va Platforma Taqqoslash

## 1. GC (Garbage Collection) nima?

**Garbage Collection (GC)** – bu avtomatik xotira boshqarish mexanizmi. Dastur ishlash jarayonida foydalanilmayotgan obyektlar aniqlanadi va xotiradan o‘chiriladi.

- **Dart:**
  - Dart VM’da GC avtomatik ishlaydi.
  - Hot reload va isolates (multi-threading) uchun optimizatsiyalangan.
  - Minimal VM qismi release buildda faqat GC va memory management uchun qoladi.
- **Kotlin (JVM):**
  - JVM’da GC Java tomonidan boshqariladi.
  - Kotlin ham JVM GC’dan foydalanadi.
  - Android ART VM’da ham GC mavjud.

## 2. SDK, JDK, JRE, JVM tushunchalari

- **SDK (Software Development Kit):**
  - Dastur yaratish uchun kerakli kutubxonalar, compiler, va asboblar to‘plami.
  - Dart SDK: Dart VM, compiler, pub (package manager), va boshqa asboblar.
  - Kotlin SDK: Kotlin compiler, kutubxonalar, va asboblar.

- **JDK (Java Development Kit):**
  - Java dasturlarini yaratish uchun to‘plam (JVM, JRE, compiler, asboblar).

- **JRE (Java Runtime Environment):**
  - Java dasturini ishga tushirish uchun kerakli muhit (JVM + kutubxonalar).

- **JVM (Java Virtual Machine):**
  - Java/Kotlin bytecode’ni CPU uchun machine code’ga aylantiradi.
  - JIT va GC funksiyalari mavjud.

## 3. JIT va JRE mosligi

- **JIT (Just-In-Time Compiler):**
  - JVM va Dart VM’da runtime’da bytecode’ni machine code’ga aylantiradi.
  - JIT hot reload va tez prototiplash uchun qulay.

- **JRE (Java Runtime Environment):**
  - JVM va kutubxonalar to‘plami.
  - JIT faqat JVM’da ishlaydi, JRE esa JVM’ni o‘z ichiga oladi.

## 4. Flowlar va Taqqoslash

### Dart
```
Dart source
   │
   ▼
Dart SDK (VM, compiler)
   │
   ▼
JIT (debug) / AOT (release)
   │
   ▼
Machine code
   │
   ▼
CPU
```

### Kotlin (JVM)
```
Kotlin source
   │
   ▼
Kotlin compiler
   │
   ▼
JVM bytecode (.class)
   │
   ▼
JVM (JIT)
   │
   ▼
Machine code
   │
   ▼
CPU
```

### Android (ART)
```
Kotlin/Java source
   │
   ▼
.dex bytecode
   │
   ▼
ART VM (AOT + JIT)
   │
   ▼
Machine code
   │
   ▼
CPU
```

## 5. Dart va Kotlin JVM/ART Taqqoslash Jadvali

| Feature         | Dart VM/SDK           | Kotlin (JVM/ART)         |
|-----------------|----------------------|--------------------------|
| GC              | Dart VM’da avtomatik  | JVM/ART’da avtomatik     |
| SDK             | Dart SDK              | Kotlin SDK + JDK         |
| Compilation     | JIT (debug), AOT (release) | JIT (JVM), AOT (ART)   |
| Platform        | Cross-platform        | JVM/Android              |
| Hot reload      | Bor                   | Bor (Android Studio)     |
| Memory mgmt     | VM orqali             | JVM/ART orqali           |
| Flow            | VM → Machine code     | JVM/ART → Machine code   |

## 6. Qo‘shimcha

- Dart VM’da isolates (multi-threading) va async/await mavjud.
- Kotlin JVM’da threads va coroutines mavjud.
- Dart SDK va Kotlin SDK o‘ziga xos asboblar va kutubxonalar bilan boy.
- Android ART VM’da ham GC, memory management, va runtime optimizatsiya mavjud.

---

Bu bo‘limda Dart va Kotlin platformalarining GC, SDK, VM, va compilation flowlari batafsil taqqoslandi.Har bir texnologiyaning afzallik va kamchiliklari  ko‘rsatilgan.

