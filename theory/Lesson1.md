## JIT (Just-In-Time) nima?

JIT – bu compiler turi.

Maqsadi: dastur kodini runtime’da, ya’ni ilova ishga tushganda, CPU tushunadigan machine code ga o‘girish. Farqi shuki, build paytida compile qilinmaydi.

Bytecode = ilova ishga tushishidan oldin mavjud bo‘ladi, machine code esa faqat runtime’da hosil bo‘ladi.

## AOT nima?

### AOT (Ahead-of-Time) – bu build paytida (ilova ishlashidan oldin) kodni compile qilish jarayoni. Maqsad: ilova ishga tushganida tez va barqaror ishlash.

### 🔹 3. Qisqacha oqim
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
[Runtime: CPU executes code directly] give me readme style this 
