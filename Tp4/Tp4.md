# Registres des processeurs x64

| 64 bits | 32 bits | 16 bits | 8 bits |
|---------|---------|---------|--------|
| RAX     | EAX     | AX      | AH, AL |
| RBX     | EBX     | BX      | BH, BL |
| RCX     | ECX     | CX      | CH, CL |
| RDX     | EDX     | DX      | DH, DL |
| RSI     | ESI     | SI      | SIL    |
| RDI     | EDI     | DI      | DIL    |
| RBP     | EBP     | BP      | BPL    |
| RSP     | ESP     | SP      | SPL    |
| R8      | R8D     | R8W     | R8B    |
| R9      | R9D     | R9W     | R9B    |
| R10     | R10D    | R10W    | R10B   |
| R11     | R11D    | R11W    | R11B   |
| R12     | R12D    | R12W    | R12B   |
| R13     | R13D    | R13W    | R13B   |
| R14     | R14D    | R14W    | R14B   |
| R15     | R15D    | R15W    | R15B   |
| RIP     | EIP     | IP      |        |
|         | EFL     | Flags   |        |

Le tableau ci-dessus indique les différents registres des processeurs x64. Dans ces processeurs, la lettre finale B (Byte) indique un registre 8 bits, W (Word=mot) indique un registre 16 bits et D (Double word = mot double) un registre 32 bits.

- **Quelle est le lien entre le registre RAX et le registre EAX ?**
  - *Rep :* EAX représente les 32 bits de poids faible de RAX

- **Quelle est le lien entre le registre EAX et le registre AX ?**
  - *Rep :* AX représente les 16 bits de poids faible de EAX

- **Quelle est le lien entre le registre AX et les registres AH et AL ?**
  - *Rep :* AH sont les 8 bits de poids fort de AX et AL sont les 8 bits de poids faible de AH

- **Sachant qu’une case mémoire peut contenir 8 bits, quelle est en octets, la taille de l'espace mémoire qu'on peut adresser avec une adresse codée sur 16 bits ?**
  - *Rep :* 2^16, soit 64 kibioctets

- **Même question pour une adresse codée sur 20 bits ?**
  - *Rep :* 2^20, soit 1 Mébioctet

- **Même question pour une adresse codée sur 32 bits ?**
  - *Rep :* 2^32, soit 4 Gibioctets

- **Même question pour une adresse codée sur 64 bits ?**
  - *Rep :* 2^64, soit environ 16 Exbioctets (18 milliards d’octets)

- **Si le registre 64 bits RAX contient (ABCDEF0123456789)16, quel est le contenu en hexa des registres suivants :**
  - o AH = 67 ?
  - o AL = 89 ?
  - o AX = 6789 ?
  - o EAX = 23456789 ?

- **Le registre RSP (Stack Pointer) sert à pointer vers la prochaine case libre de la pile. Quelle est le rôle de la pile ?**
  - *Rep :* La pile permet de stocker les variables locales des fonctions, de gérer les adresses de retour des fonctions, et sert au passage de paramètres.

- **Que contient le registre des indicateurs EFL ? Quand est-il modifié ?**
  - *Rep :* Le registre EFL contient des informations sur certaines propriétés du dernier résultat de l'UAL (Unité Arithmétique et Logique). Il est modifié en fonction du résultat obtenu (ex : résultat nul, présence de retenue, contrôle de parité, etc.)
  - *•	Le registre des indicateurs est mis à jour après chaque instruction logique ou cmp 

#2
```cpp
// main.cpp
#include <iostream>
using namespace std;

extern "C" int somme(int a, int b);

int main()
{
    int a, b;
    cout << "Entrez un premier entier : ";
    cin >> a;
    cout << "Entrez un deuxieme entier : ";
    cin >> b;
    cout << a << " + " << b << " = " << somme(a, b) << endl;
    return 0;
}

; prog.asm
.CODE
    somme PROC
        MOV EAX, ECX
        ADD EAX, EDX
        RET
    somme ENDP
END


### Expliquer le rôle de la ligne `extern "C" int somme(int a, int b);`

La ligne `extern "C" int somme(int a, int b);` indique au compilateur C++ que cette fonction doit être traitée avec le protocole d'appel C et ne doit pas être compilée par le compilateur C++. Cela garantit que le compilateur utilise les conventions de nommage et d'appel compatibles avec le langage C.

### Définition des lignes `.CODE` et `END`

- La directive `.CODE` informe le compilateur qu'il entre dans une section de code où se trouvent les instructions du programme.
- `END` marque la fin du programme.

### Définition des lignes `somme PROC` et `somme ENDP`

- `somme PROC` indique le début de la définition de la procédure `somme`.
- `somme ENDP` marque la fin de la procédure `somme`.

### Taille en bits des paramètres a et b et registres utilisés pour transmettre leurs valeurs

Les paramètres a et b sont de taille 32 bits (int). Les valeurs des paramètres sont transmises via les registres ECX (pour a) et EDX (pour b) conformément à la convention FastCall.

### Taille en bits de la valeur retournée par la fonction somme et registre utilisé

La valeur retournée par la fonction somme est de 32 bits, car elle retourne un int. Cette valeur est stockée dans le registre EAX, conformément à la convention FastCall.

### Fonction des instructions `MOV EAX,ECX` et `ADD EAX,EDX`

- `MOV EAX, ECX` copie la valeur du registre ECX (contenant la valeur de a) dans le registre EAX.
- `ADD EAX, EDX` ajoute la valeur du registre EDX (contenant la valeur de b) à la valeur précédemment stockée dans le registre EAX.

3. Programme avec section de données

```assembly
.DATA
    var1    BYTE    5
    var2    WORD    8
    var3    DWORD   7
    var4    QWORD   9
    var5    TBYTE   3
    var6    REAL4   6.25
    var7    REAL8   2.5
    var8    DB      2
    var9    DB      '2'
    var10   DB      -2, 128, -128, 12
    var11   DB      'abc',0
    var12   DB      ?
.CODE
    fct PROC
        MOV AL, var1
        MOV BL, var8
        ADD AL, BL
        MOV var12, AL
        RET
    fct ENDP
END

##Si ... alors ... sinon
.CODE
    majorite PROC
        si_supegal18 : CMP ECX,18
        JAE alors_majeur
        sinon_mineur : MOV AL,0
        JMP fin_si
        alors_majeur : MOV AL,1

        fin_si : RET
    majorite ENDP
END

##Boucle et Tableau
.DATA AA
    tab_src DWORD 15 , 80 , 99 , 45 , 8 , 51 , 3 , 19 , 75 , 10
    tab_dest DWORD 10 DUP (?)
.CODE
    multiple3 PROC
        MOV RSI,0
        MOV RDI,0
        MOV EBX,3
        boucle :
            MOV EDX,0
            MOV EAX,tab_src[RSI*4]
            DIV EBX
            CMP EDX,0
            JNE suivant
        multiple :
            MOV ECX,tab_src[RSI*4]
            MOV tab_dest[RDI*4],ECX
            INC RDI
        suivant :
            INC RSI
            CMP RSI,9
            JBE boucle
        RET
    multiple3 ENDP
END

##A vous de jouer  
