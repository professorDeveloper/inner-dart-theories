## JIT (Just-In-Time) nima?

JIT – bu compiler turi.

Maqsadi: dastur kodini runtime’da, ya’ni ilova ishga tushganda, CPU tushunadigan machine code ga o‘girish.

Farqi shuki, build paytida compile qilinmaydi.

Jit working flowchart: 
```markdown
JIT working flowchart:
        ▲
        │
        ▼ [Bytecode]
        │        ← Compile paytida hosil bo'ladi
        │
        ▼ [Runtime: User runs app / calls function]
        │
        ▼ [JIT Compiler converts Bytecode → Machine Code]
        │
        ▼ [CPU executes Machine Code]
```
