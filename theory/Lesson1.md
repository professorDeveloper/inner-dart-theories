
# Android VMlar va Dart/Flutter Compilation

## JIT (Just-In-Time) nima?
JIT – bu compiler turi. Maqsadi: dastur kodini runtime’da, ya’ni ilova ishga tushganda, CPU tushunadigan machine code ga o‘girish. Farqi: build paytida compile qilinmaydi.

**Bytecode** = ilova ishga tushishidan oldin mavjud bo‘ladi, **machine code** esa faqat runtime’da hosil bo‘ladi.

## AOT (Ahead-of-Time) nima?
AOT – build paytida (ilova ishlashidan oldin) kodni compile qilish jarayoni. Maqsad: ilova ishga tushganida tez va barqaror ishlash.

### Qisqacha oqim
```markdown
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

## Dalvik VM (Android 4.x va oldin)

Dalvik = Android’ning JVM-ga o‘xshash virtual machine’i.

**Xususiyatlari:**
- Java bytecode (.class) → .dex (Dalvik EXecutable) formatiga o‘tkaziladi
- Dalvik bu .dex fayllarini interpretatsiya qiladi va runtime’da CPU uchun machine code hosil qiladi
- Asosan JIT qo‘llab-quvvatlanadi (Android 2.2+)
- Kamchiligi: performance va memory usage yuqori bo‘lgan

---

## ART (Android 5.0+ va hozir)

ART = Android Runtime, Dalvik o‘rnini bosdi

**Xususiyatlari:**
- AOT compilation asosida ishlaydi → release APK build vaqtida bytecode → machine code
- JIT ham ishlaydi → debug va runtime optimizatsiya uchun

**Shu sababli:**
- Debug APK → JIT ishlaydi, hot reload imkoniyati mavjud
- Release APK → AOT ishlaydi, tez va lag yo‘q
- ART ham .dex fayllarni ishlatadi, lekin runtime optimizatsiya va memory management yaxshilangan

---

## Qisqacha taqqoslash

| Feature           | Dalvik VM           | ART (Android Runtime) |
|-------------------|---------------------|-----------------------|
| Android versiyasi | 1.0 – 4.x           | 5.0+                  |
| Compilation       | Mostly JIT / interpretatsiya | AOT + JIT         |
| Bytecode format   | .dex                | .dex                  |
| Performance       | Past, memory ko‘p    | Tez, memory optimizatsiyalangan |
| APK release       | Runtime’da compile  | Build vaqtida AOT, runtime tez |

---

## ART nima?

ART (Android Runtime) – Android 5.0+ dan ishlatiladigan virtual machine (VM). Dalvik ning o‘rnini bosdi.

ART aslida VM hisoblanadi, chunki:
- U .dex fayllarni interpretatsiya qiladi
- Runtime’da kodni optimizatsiya qiladi
- Memory management, garbage collection va boshqa runtime funksiyalarni boshqaradi

**JIT va AOT kombinatsiyasi:**
- Debug APK → JIT compiler ishlaydi → bytecode runtime’da machine code’ga aylanadi
- Release APK → AOT compiler ishlaydi → bytecode build vaqtida machine code’ga aylanadi

Shu sababli, ART = VM + JIT + AOT support

---

## Dart / Flutter bilan solishtirish

- Dart VM debug mode → JIT ishlaydi (hot reload)
- Dart AOT → build vaqtida machine code hosil qilinadi
- Release APK / ilova ichida CPU uchun tayyor machine code bo‘ladi
- Dart VM runtime’da ishlamaydi (faqat garbage collection / memory management uchun minimal VM qismi qolishi mumkin)

### Diagramma ko‘rinishi (soddalashtirilgan)

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
