# Dart Overview with Language Chooser

## Language Selection

Please choose a language to view the content:

- English
- Uzbek

---

## English Version

### What is Dart?

**Dart** is a programming language developed by Google, announced in 2011. It is primarily designed for web, mobile (Flutter), server, and desktop applications.

#### Key Features of Dart

- Object-oriented, strongly typed, with C-style syntax
- Supports hot reload, rapid prototyping, and AOT/JIT compilation
- The primary language for the Flutter framework

### Dart's Internal Mechanisms and Advanced Features

- **Dart VM**: Interprets and compiles code to machine code at runtime using JIT (for debugging/hot reload). In release builds, AOT compilation is used, with the VM handling only minimal tasks like memory management and garbage collection.
- **Isolates**: Each parallel process (thread) in Dart runs with its own memory and event loop, ensuring safe and efficient concurrency and multi-threading.
- **Async/await**: Dart supports asynchronous programming with async/await syntax, enabling fast and efficient performance in server, mobile, and web applications.
- **Cross-platform**: Dart VM supports CLI, server, desktop, and mobile applications. With Flutter, a single codebase can target Android, iOS, web, and desktop.
- **Null safety**: Dart includes null safety to prevent errors and enhance code safety.
- **Package Ecosystem**: Thousands of packages and libraries are available via Pub.dev, extending Dart's capabilities.
- **Compilation**: Dart supports both JIT (Just-In-Time) and AOT (Ahead-Of-Time) compilation. JIT is used during debugging, while AOT is used for release builds.

---

### Android VMs and Dart/Flutter Compilation

#### What is JIT (Just-In-Time)?

JIT is a compiler that converts code to machine code at runtime, during app execution. The bytecode exists before the app runs, but machine code is generated only at runtime.

#### What is AOT (Ahead-Of-Time)?

AOT compiles code to machine code during the build process, before the app runs, ensuring fast and stable performance.

##### Simplified Flow

```
[Source Code]
      │
      ▼
[AOT Compiler (build time)]
      │
      ▼
[Machine Code] → Embedded in APK / app
      │
      ▼
[Runtime: CPU executes code directly]
```

---

#### Dalvik VM (Android 4.x and earlier)

Dalvik is Android’s virtual machine, similar to JVM.

**Features:**

- Converts Java bytecode (.class) to .dex (Dalvik Executable) format
- Interprets .dex files and generates machine code at runtime
- Primarily uses JIT (Android 2.2+)
- Drawback: Higher performance and memory usage

---

#### ART (Android 5.0+ and later)

ART (Android Runtime) replaced Dalvik.

**Features:**

- Uses AOT compilation to convert bytecode to machine code during the build process
- Supports JIT for debugging and runtime optimizations
- Improved runtime optimization and memory management

**As a result:**

- Debug APK → JIT compiler, supports hot reload
- Release APK → AOT compiler, fast with no lag
- ART processes .dex files with enhanced runtime optimization

---

#### Quick Comparison

| Feature | Dalvik VM | ART (Android Runtime) |
| --- | --- | --- |
| Android Version | 1.0 – 4.x | 5.0+ |
| Compilation | Mostly JIT / interpretation | AOT + JIT |
| Bytecode Format | .dex | .dex |
| Performance | Slower, high memory usage | Fast, optimized memory |
| APK Release | Compiled at runtime | AOT compiled at build time |

---

#### What is ART?

ART (Android Runtime) is the virtual machine used in Android 5.0+.

**Why it’s a VM:**

- Interprets .dex files
- Optimizes code at runtime
- Manages memory, garbage collection, and other runtime functions

**JIT and AOT Combination:**

- Debug APK → JIT compiler converts bytecode to machine code at runtime
- Release APK → AOT compiler converts bytecode to machine code during build

Thus, ART = VM + JIT + AOT support

---

#### Dart/Flutter vs. ART

- **Dart VM Debug Mode**: Uses JIT (supports hot reload)
- **Dart AOT**: Compiles to machine code during build
- **Release APK**: Contains ready-to-execute machine code, with minimal VM for garbage collection/memory management

##### Simplified Diagram

**ART Debug APK:**

```
Kotlin/Java source
       │
       ▼
.dex bytecode
       │
       ▼
ART JIT (runtime)
       │
       ▼
Machine code → CPU
```

**Dart Release APK:**

Dart source\
       │\
       ▼\
AOT Compiler\
       │\
       ▼\
Machine code → Embedded in APK\
       │\
       ▼\
CPU executes directly (minimal VM)

---

#### Dart/Flutter Release (AOT)

In a Dart release APK/app:

- AOT compiler converts source code to machine code
- The final APK/app contains minimal bytecode
- A minimal VM may remain for garbage collection/memory management

**Flow:**

```
Dart source → AOT Compiler → Machine Code → APK → CPU executes directly
```

---

#### Android Native Release (ART)

In an Android release APK:

- AOT compiler (ART) converts source code/bytecode (.dex) to machine code
- ART VM remains active at runtime for:
  - Garbage collection
  - Memory management
  - Some runtime optimizations
- Minimal bytecode mapping may remain

**Flow:**

```
Java/Kotlin source → .dex bytecode → ART AOT Compiler → Machine Code → APK
Runtime: ART VM manages memory & GC, CPU executes machine code
```

---

#### Summary: Dart AOT vs Android ART

| Feature | Dart AOT Release | Android ART Release |
| --- | --- | --- |
| Bytecode | Minimal (only for mapping) | Minimal (VM mapping) |
| Machine Code | Embedded in APK → CPU | Embedded in APK → CPU |
| VM | Minimal (garbage collection) | ART VM always present |
| Performance | Fast, no lag | Fast, no lag |

---

#### Additional Notes on Dart VM

- **Dart VM**: Interprets and compiles code to machine code at runtime using JIT (for debug/hot reload). In release builds, AOT compilation is used, with the VM handling only memory management and garbage collection.
- **Cross-platform**: Dart VM supports CLI, server, desktop, and mobile apps.
- **Isolates**: Supports multi-threading with isolated memory and event loops.
- **Async/await**: Enables efficient asynchronous programming.

**Benefits:**

- Debug mode: Hot reload, rapid prototyping
- Release mode: Maximum performance and stability

---

## Uzbek Version

### Dart nima?

**Dart** – Google tomonidan ishlab chiqilgan, 2011-yilda e’lon qilingan dasturlash tili. Asosan web, mobil (Flutter), server va desktop ilovalar uchun mo‘ljallangan.

#### Dartning asosiy xususiyatlari

- Object-oriented, strongly typed, C-style sintaksis
- Hot reload, tez prototiplash va AOT/JIT kompilyatsiya imkoniyatlari
- Flutter frameworkning asosiy tili

### Dartning ichki mexanizmlari va chuqur xususiyatlari

- **Dart VM**: Dastur kodini runtime’da interpretatsiya va JIT orqali machine code’ga aylantiradi (debug/hot reload uchun). Release build’da AOT kompilyator ishlaydi, VM faqat memory management va garbage collection uchun minimal qismda qoladi.
- **Isolates**: Har bir parallel jarayon (thread) alohida memory va event loop bilan ishlaydi, bu concurrency va multi-threading uchun xavfsiz va samarali.
- **Async/await**: Asinxron kod yozish uchun async/await sintaksisi mavjud, bu server, mobil va web ilovalarda tez ishlash imkonini beradi.
- **Cross-platform**: Dart VM CLI, server, desktop va mobil ilovalar uchun ishlaydi. Flutter orqali Android, iOS, web va desktop uchun bitta koddan foydalanish mumkin.
- **Null safety**: Null safety xatolarni oldini olish va kodni xavfsiz qilish uchun muhim.
- **Package ekotizimi**: Pub.dev orqali minglab paketlar va kutubxonalar mavjud.
- **Kompilyatsiya**: Dart kodini JIT (Just-In-Time) va AOT (Ahead-Of-Time) usullari bilan kompilyatsiya qilish mumkin. Debug’da JIT, release’da AOT ishlaydi.

---

### Android VMlar va Dart/Flutter kompilyatsiyasi

#### JIT (Just-In-Time) nima?

JIT – dastur kodini runtime’da, ya’ni ilova ishga tushganda, CPU tushunadigan machine code’ga o‘giradigan kompilyator. Bytecode ilova ishga tushishidan oldin mavjud, machine code esa faqat runtime’da hosil bo‘ladi.

#### AOT (Ahead-Of-Time) nima?

AOT – build paytida kodni kompilyatsiya qilish jarayoni. Maqsad: ilova ishga tushganida tez va barqaror ishlash.

##### Soddalashtirilgan oqim

```
[Source Code]
      │
      ▼
[AOT Compiler (build time)]
      │
      ▼
[Machine Code] → APK / ilova ichida tayyor
      │
      ▼
[Runtime: CPU executes code directly]
```

---

#### Dalvik VM (Android 4.x va oldin)

Dalvik – Android’ning JVM-ga o‘xshash virtual mashinasi.

**Xususiyatlari:**

- Java bytecode (.class) → .dex (Dalvik Executable) formatiga o‘tkaziladi
- .dex fayllarni interpretatsiya qiladi va runtime’da machine code hosil qiladi
- Asosan JIT qo‘llab-quvvatlanadi (Android 2.2+)
- Kamchilik: yuqori performance va memory sarfi

---

#### ART (Android 5.0+ va hozir)

ART (Android Runtime) Dalvik’ning o‘rnini bosdi.

**Xususiyatlari:**

- AOT kompilyatsiyasi asosida ishlaydi → bytecode build vaqtida machine code’ga aylanadi
- JIT debug va runtime optimizatsiyasi uchun ishlaydi
- .dex fayllarni qayta ishlash, runtime optimizatsiyasi va memory management yaxshilangan

**Shu sababli:**

- Debug APK → JIT ishlaydi, hot reload imkoniyati mavjud
- Release APK → AOT ishlaydi, tez va lag yo‘q

---

#### Qisqacha taqqoslash

| Xususiyat | Dalvik VM | ART (Android Runtime) |
| --- | --- | --- |
| Android versiyasi | 1.0 – 4.x | 5.0+ |
| Kompilyatsiya | Asosan JIT / interpretatsiya | AOT + JIT |
| Bytecode formati | .dex | .dex |
| Ishlash tezligi | Sekin, ko‘p memory sarfi | Tez, optimizatsiyalangan |
| APK release | Runtime’da kompilyatsiya | Build vaqtida AOT |

---

#### ART nima?

ART (Android Runtime) – Android 5.0+ dan ishlatiladigan virtual mashina (VM).

**Nima uchun VM:**

- .dex fayllarni interpretatsiya qiladi
- Runtime’da kodni optimizatsiya qiladi
- Memory management, garbage collection va boshqa runtime funksiyalarni boshqaradi

**JIT va AOT kombinatsiyasi:**

- Debug APK → JIT bytecode’ni runtime’da machine code’ga aylantiradi
- Release APK → AOT bytecode’ni build vaqtida machine code’ga aylantiradi

Shu sababli, ART = VM + JIT + AOT qo‘llab-quvvatlash

---

#### Dart/Flutter bilan solishtirish

- **Dart VM debug rejimi**: JIT ishlaydi (hot reload)
- **Dart AOT**: Build vaqtida machine code hosil qilinadi
- **Release APK**: CPU uchun tayyor machine code, minimal VM faqat garbage collection/memory management uchun

##### Soddalashtirilgan diagramma

**ART debug APK:**

```
Kotlin/Java source
       │
       ▼
.dex bytecode
       │
       ▼
ART JIT (runtime)
       │
       ▼
Machine code → CPU
```

**Dart release APK:**

```
Dart source
       │
       ▼
AOT Compiler
       │
       ▼
Machine code → APK ichida tayyor
       │
       ▼
CPU executes directly (minimal VM)
```

---

#### Dart/Flutter Release (AOT)

Dart release APK/ilovasida:

- AOT kompilyator source code’ni machine code’ga aylantiradi
- Yakuniy APK/ilovada deyarli bytecode bo‘lmaydi
- Minimal VM faqat garbage collection/memory management uchun qoladi

**Oqim:**

```
Dart source → AOT Compiler → Machine Code → APK → CPU executes directly
```

---

#### Android Native Release (ART)

Android release APK’da:

- AOT kompilyator (ART) source code/bytecode (.dex) → machine code
- ART VM runtime’da mavjud:
  - Garbage collection
  - Memory management
  - Ba’zi runtime optimizatsiyalari
- Minimal bytecode mapping qoladi

**Oqim:**

```
Java/Kotlin source → .dex bytecode → ART AOT Compiler → Machine Code → APK
Runtime: ART VM manages memory & GC, CPU executes machine code
```

---

#### Xulosa: Dart AOT vs Android ART

| Xususiyat | Dart AOT release | Android ART release |
| --- | --- | --- |
| Bytecode | De-facto yo‘q (minimal mapping) | De-facto yo‘q (minimal VM mapping) |
| Machine code | APK ichida tayyor → CPU | APK ichida tayyor → CPU |
| VM | Minimal (garbage collection) | ART VM har doim mavjud |
| Ishlash | Tez, lag yo‘q | Tez, lag yo‘q |

---

#### Dart VM haqida qo‘shimcha

- **Dart VM**: Runtime’da kodni interpretatsiya qiladi va JIT orqali machine code’ga aylantiradi (debug/hot reload). Release build’da AOT ishlaydi, VM faqat memory management va garbage collection uchun qoladi.
- **Cross-platform**: CLI, server, desktop, mobil ilovalar uchun ishlaydi.
- **Isolates**: Multi-threading, alohida memory va event loop’lar bilan.
- **Async/await**: Asinxron dasturlash uchun samarali.

**Foydalari:**

- Debug rejimida: Hot reload, tez prototiplash
- Release rejimida: Maksimal tezlik va barqarorlik