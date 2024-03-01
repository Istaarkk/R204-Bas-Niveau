# 1. Microprocesseur élémentaire

## Caractéristiques du microprocesseur

- **Nombre de bits par instruction:** 24 bits
- **Nombre de bits pour le champ DATA ou adresse:** 16 bits
- **Positions des bits du champ DATA ou adresse:** De 0 à 15
- **Nombre de bits pour le code opératoire:** 8 bits
- **Positions des bits du code opératoire:** 16 à 23

### Rôle des bits du code opératoire

| Position | Nom           | Rôle                                              |
|----------|---------------|---------------------------------------------------|
| Bit 0    | JMP           | Pour faire des instructions de saut               |
| Bit 1    | REGISTRE B     | Activation de l’écriture dans le registre B      |
| Bit 2    | REGISTRE A     | Activation de l’écriture dans le registre A      |
| Bit 3    | MUX            | Sert à choisir entre DATA et registre A          |
| Bits 4-7 | ALU            | Choix de l’opération réalisée par l’ALU           |

## Instructions supportées par le microprocesseur

- `LOAD_A #valeur`: Copie une valeur dans le registre A
- `LOAD_B #valeur`: Copie une valeur dans le registre B
- `LOAD_A_B`: Copie le registre B dans le registre A
- `LOAD_B_A`: Copie le registre A dans le registre B
- `ADD_A_B`: Additionne les registres A et B et stocke le résultat dans le registre A
- `ADD_B_A`: Additionne les registres A et B et stocke le résultat dans le registre B
- `NOT_A`: Inverse (complément à 1) le contenu du registre A
- `NOT_B`: Inverse (complément à 1) le contenu du registre B
- `INC_B`: Incrémente le registre B
- `JMP <label>`: Saut à l’instruction étiquetée par `<label>`

## Programme dans la mémoire (calcul des multiples de 10)

| Adresse | Contenu mémoire (en hexa) | Code binaire                          | Mnémonique assembleur |
|---------|-----------------------------|---------------------------------------|-----------------------|
| 0000    | 140000                      | 0001 0100 0000 0000 0000 0000         | LOAD_A #0             |
| 0001    | 12000a                      | 0001 0010 0000 0000 0000 1010         | LOAD_B #10            |
| 0002    | 5c0000                      | 0101 1100 0000 0000 0000 0000         | Boucle: ADD_A_B       |
| 0003    | 010002                      | 0000 0001 0000 0000 0000 0010         | JMP Boucle            |

## Modification du programme pour stocker le résultat dans B

| Adresse | Contenu mémoire (en hexa) | Code binaire                          | Mnémonique assembleur |
|---------|-----------------------------|---------------------------------------|-----------------------|
| 0000    | 14000a                      | 0001 0100 0000 0000 0000 1010         | LOAD_A #10           |
| 0001    | 120000                      | 0001 0010 0000 0000 0000 0000         | LOAD_B #0            |
| 0002    | 5a0000                      | 0101 1010 0000 0000 0000 0000         | Boucle: ADD_B_A      |
| 0003    | 010002                      | 0000 0001 0000 0000 0000 0010         | JMP Boucle           |

## Programme pour calculer le complément à 2 de 5

| Adresse | Contenu mémoire (en hexa) | Code binaire                          | Mnémonique assembleur |
|---------|-----------------------------|---------------------------------------|-----------------------|
| 0000    | 140005                      | 0001 0100 0000 0000 0000 0101         | LOAD_A #5            |
| 0001    | 1a0000                      | 0001 1010 0000 0000 0000 0000         | LOAD_B_A             |
| 0002    | c20000                      | 1100 0010 0000 0000 0000 0000         | NOT_B                |
| 0003    | 320000                      | 0011 0010 0000 0000 0000 0000         | INC_B                |


# 2. Microprocesseur avec sauts conditionnels

## Caractéristiques du microprocesseur

- **Nombre de bits par instruction:** 32 bits
- **Nombre de bits pour le code opératoire:** 16 bits
- **Nombre de bits pour le champ DATA ou adresse:** 16 bits

## Rôles des bits supplémentaires

- **JMPZ:** Jump If = 0
- **JMPNZ:** Jump If not 0
- **JMPN:** Jump if négatif
- **JMPPZ:** Jump if positif or NULL

## Codes binaires et hexa des instructions

| Instruction | Code Binaire             | Code Héxa       |
|-------------|--------------------------|-----------------|
| NOP         | 0000 0000 X000 XXXX      | 0x0000 0000     |
| LOAD_A #valeur | 0000 0001 0100 VVVV   | 0x0014 VVVV     |
| LOAD_B_A    | 0000 0001 1010 XXXX      | 0x001A 0000     |
| MUL_A_B     | 0000 1000 1100 XXXX      | 0x008C 0000     |
| DEC_B       | 0000 1000 1100 XXXX      | 0x0042 0000     |
| JMP <label> | 0000 0000 0001 AAAA      | 0x0001 AAAA     |
| JMPZ <label>| 1000 0000 0000 AAAA      | 0x0800 AAAA     |
| JMPNZ <label>| 0100 0000 0000 AAAA     | 0x0400 AAAA     |

## Programme pour calculer la factorielle de 5 avec JMPNZ


