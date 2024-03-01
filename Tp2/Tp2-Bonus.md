# 1. Somme des n premiers entiers

## Instructions

| Instruction     | Code Héxa | Explication          |
|-----------------|-----------|----------------------|
| LOAD_A #10      | 14 000A   | A = 10               |
| LOAD_B_A        | 1A 0000   | B = A                |
| INC_B           | 32 0000   | B = B + 1            |
| MUL_B_A         | 8A 0000   | B = B * A            |
| DIV_B #2        | 92 0002   | B = B / 2            |

## Programme

| Adresse | Instruction (mnémonique assembleur) | Code Hexa       |
|---------|--------------------------------------|-----------------|
| 0000    | LOAD_A #10                           | 0x0014 000A     |
| 0001    | LOAD_B_A                             | 0x001A 0000     |
| 0002    | INC_B                                | 0x0032 0000     |
| 0003    | MUL_B_A                              | 0x008A 0000     |
| 0004    | DIV_B #2                             | 0x0092 0002     |


# 2. Permutation avec seulement 2 registres

## Instructions

| Instruction   | Code Héxa | Explication       |
|---------------|-----------|-------------------|
| LOAD_A #5     | 14 0005   | A = 5             |
| LOAD_B #8     | 12 0008   | B = 8             |
| ADD_A_B       | 5C 0000   | A = A + B         |
| SUB_B_AB      | 6A 0000   | B = A - B         |
| SUB_A_AB      | 6C 0000   | A = A - B         |

## Programme

| Adresse | Instruction (mnémonique assembleur) | Code Hexa       |
|---------|--------------------------------------|-----------------|
| 0000    | LOAD_A #5                            | 0x0014 0005     |
| 0001    | LOAD_B #8                            | 0x0012 0008     |
| 0002    | ADD_A_B                              | 0x005C 0000     |
| 0003    | SUB_B_AB                             | 0x006A 0000     |
| 0004    | SUB_A_AB                             | 0x006C 0000     |


# 3. Puissance

## Instructions

| Instruction     | Code Héxa | Explication             |
|-----------------|-----------|-------------------------|
| NOP             | 0000 0000 | Ne fait rien            |
| LOAD_A #valeur  | 0041 0003 | A ← valeur              |
| LOAD_B #valeur  | 0021 0005 | B ← valeur              |
| LOAD_C #valeur  | 0011 0001 | C ← valeur              |
| DEC_B           | 0426 0000 | B ← B - 1               |
| MUL_C_A         | 0219 0000 | C ← C * A               |
| CMP_B #valeur   | 040B 0000 | Compare B et valeur     |
| JMP <label>     | 8000 0003 | Saut inconditionnel     |
| JMPZ <label>    | 2000 0008 | Saut si Z = 1           |

## Programme

| Adresse | Instruction (mnémonique assembleur) | Code Hexa       |
|---------|--------------------------------------|-----------------|
| 0000    | LOAD_A #3                            | 0x0041 0003     |
| 0001    | LOAD_B #5                            | 0x0021 0005     |
| 0002    | LOAD_C #5                            | 0x0011 0001     |
| 0003    | CMP_B #0                             | 0x040B 0000     |
| 0004    | JMPZ                                 | 0x2000 0008     |
| 0005    | MUL_C_A                              | 0x0219 0000     |
| 0006    | DEC_B                                | 0x0426 0000     |
| 0007    | JMP                                  | 0x8000 0003     |
| 0008    | NOP                                  | 0x0000 0000     |


# 4. Suite de Fibonacci étendue

## Instructions

| Instruction     | Code Héxa | Explication             |
|-----------------|-----------|-------------------------|
| LOAD_A #0       | 0014 0000 | A = 0                   |
| LOAD_B #1       | 0012 0001 | B = 1                   |
| LOAD_C #2       | 2010 0002 | C = 2                   |
| ADD_A_B         | 005C 0000 | A = A + B + C           |
| ADD_A_C         | 105C 0000 | Permutation A et C      |
| ADD_A_C         | 105C 0000 |                         |
| SUB_C_AC        | 3068 0000 |                         |
| SUB_A_AC        | 005C 0000 |                         |
| ADD_A_B         | 005C 0000 |                         |
| SUB_B_AB        | 006A 0000 |                         |
| SUB_A_AB        | 006C 0000 |                         |
| JMP             | 0001 0003 | Saut inconditionnel     |

## Programme

| Adresse | Instruction (mnémonique assembleur) | Code Hexa       |
|---------|--------------------------------------|-----------------|
| 0000    | LOAD_A #0                            | 0x0014 0000     |
| 0001    | LOAD_B #1                            | 0x0012 0001     |
| 0002    | LOAD_C #2                            | 0x2010 0002     |
| 0003    | ADD_A_B                              | 0x005C 0000     |
| 0004    | ADD_A_C                              | 0x105C 0000     |
| 0005    | ADD_A_C                              | 0x105C 0000     |
| 0006    | SUB_C_AC                             | 0x3068 0000     |
| 0007    | SUB_A_AC                             | 0x005C 0000     |
| 0008    | ADD_A_B                              | 0x005C 0000     |
| 0009    | SUB_B_AB                             | 0x006A 0000     |
| 000A    | SUB_A_AB                             | 0x006C 0000     |
| 000B    | JMP                                  | 0x0001 0003     |

