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

2\. Premier programme

Le programme C++ ci-dessous écrit dans le fichier main.cpp fait appel à une fonction en ASM x64 écrite dans le fichier prog.asm.

main.cpp:

#include <iostream>

using namespace std;

extern "C" int somme(int a, int b);

int main()

{

`	`int a, b;

`	`cout << "Entrez un premier entier : "; cin >> a;

`	`cout << "Entrez un deuxieme entier : "; cin >> b;

`	`cout << a << " + " << b << " = " << somme(a,b) << endl;

`	`return 0;

}


prog.asm:

.CODE

`	`somme PROC

`		`MOV EAX,ECX

`		`ADD EAX,EDX

`		`RET

`	`somme ENDP

END




Expliquez le rôle de la ligne extern "C" int somme(int a, int b);

Le terme extern sert à dire au compilateur C++ que cette fonction ne doit pas être compilé par lui, et ne plantera pas au moment où il ne trouvera pas sa définition.

Le "C" sert à dire au compilateur quel protocole d'appel utiliser, ici, celui du langage de programmation C.


Que définissent les lignes .CODE et END ?

Le .CODE est une directive pour s'adresser au compilateur, et lui dire qu'ici commence la section où commence les intruction du programme.

Le END signifie la fin du programme.


Que définissent les lignes somme PROC et somme ENDP ?

Elles définissent le début et la fin de la fonction somme. PROC comme procédure, et ENDP comme end procédure.


Quelle est la taille en bits des paramètres a et b et quels registres sont utilisés pour transmettre leurs valeurs à la fonction somme ?

32 bits, car le type int est compilé en tant que 32 bits par défaut sur la majorité des compilateurs.

Les registres utilisés pour transmettre les valeurs, fixés par la convention FastCall, sont EAX pour a, et EDX pour b.


Quelle est la taille en bits de la valeur retournée par la fonction somme et quel registre est utilisé pour cela ?

La taille en bits de la valeur retournée est de 32 bits puisqu'il s'agit d'un int


Que fait l’instruction MOV EAX,ECX ?

Ça copie ECX dans EAX.


Que fait l’instruction ADD EAX,EDX ?

Elle ajoute la valeur de b (dans EDX) à celle de a (directement dans le registre de retour, ici EAX), et l'écrit dans ce même registre de retour.



3\. Programme avec section de données

.DATA

`	`var1	BYTE	5

`	`var2	WORD	8

`	`var3	DWORD	7

`	`var4	QWORD	9

`	`var5	TBYTE	3

`	`var6	REAL4	6.25

`	`var7	REAL8	2.5

`	`var8	DB		2

`	`var9	DB		'2'

`	`var10	DB		-2, 128, -128, 12

`	`var11	DB		'abc',0

`	`var12	DB		?

.CODE

`	`fct PROC

`		`MOV AL,var1

`		`MOV BL,var8

`		`ADD AL,BL

`		`MOV var12,AL

`		`RET

`	`fct ENDP

END


Types:



Type

Signification

Taille (octets)

Taille (bits)




BYTE

Octet

1

8


WORD

Mot

2

16


DWORD

Double mot

4

32


QWORD

Quadruple mot

64



TBYTE

Entier 80bits

10

80


REAL4

Réel

4

64


REAL8

Réel

8

128


DB

Définir Byte (octet)

\-

\-


DW

Définir mot

\-

\-


DQ

Définir Quadruple mot

\-

\-


DD

Définir Double mot

\-

\-


DR

Définir Réel

\-

\-





Quel est le rôle de la ligne .DATA ?

À déclarer les variables du programme.

La section DATA commence à l’adresse mémoire 0x00007FF75E93E080. Le contenu de la mémoire à partir de cette adresse est indiqué ci-dessous.



En vous aidant de cette copie d’écran, remplissez le tableau ci-dessous.



Variable

Adresse de début

Nombre d’octets

Contenu des octets en hexa

Explication




var1

0x00007FF75E93E080

1

05

Codage de l'entier 5 sur 8 bits.


var2

0x00007FF75E93E081

2

08 00

Codage de l'entier 8 sur 16 bits.


var3

0x00007FF75E93E083

4

07 00 00 00

Codage de l'entier 7 sur 32 bits.


var4

0x00007FF75E93E087

8

09 00 00 00 00 00 00 00

Codage de l'entier 9 sur 64 bits.


var5

0x00007FF75E93E08F

10

03 (00 x 9)

Codage de l'entier 3 sur 80 bits.


var6

0x00007FF75E93E099

4

00 00 C8 40

Codage du réel 6.25 en simple précision sur 32 bits.


var7

0x00007FF75E93E09D

8

00 00 00 00 00 00 04 40

Codage du réel 2.5 en double précision 64 bits.


var8

0x00007FF75E93E0A5

1

02

Codage de l'entier 2 sur 8 bits.


var9

0x00007FF75E93E0A6

1

32

Codage du caractère '2' en ASCII.


var10

0x00007FF75E93E0A7

4

FE 80 80 0C

Codage d'un tableau d'entiers -2; 128; -128; 12 sur 8 bits


var11

0x00007FF75E93E0AB

4

61 62 63 00

Codage de la chaine "abc" avec le caractère de fin de chaîne '\0'


var12

0x00007FF75E93E0AF

1

00

? signifie variable non initialisée


Attention: Le contenu des octets en hexa est inversé (poids faible avant poids fort sur Intel).








Que remarquez-vous en général pour toutes les variables ?

C'est codé en Little Endian (poids faible avant poids fort, sauf chaines).

Que remarquez-vous en particulier pour la variable var10 ?

On remarque que le compilateur a décidé de coder 128 en binaire naturel sur 8 bits et -128 en complément à 2 sur 8 bits.

Ce qui donne finalement le même code 0x80. La question est alors : comment le processeur sait s'il doit interpréter une valeur en binaire naturel ou en complément à 2?

Il est important de comprendre qu'en assembleur, la gestion du typage des données est à la charge du programmeur. C'est à lui de choisir les bonnes instructions pour que le processeuur interprète les valeurs dans le bon codage. Flemme d'écrire la suite dsl.

Quel autre type peut-on utiliser à la place respectivement de BYTE, WORD, DWORD, QWORD, TWORD ?

On peut utiliser DB, DW, DD, DQ, et DT.

Le tableau ci-dessous indique le code machine généré pour les instructions du programme




Adresse mémoire

Code Machine

Instruction




0x00007FF75E931CD0

8A 05 AA C3 00 00

MOV AL , var1


0x00007FF75E931CD6

8A 1D C9 C3 00 00

MOV BL , var8


0x00007FF75E931CDC

02 C3

ADD AL , BL


0x00007FF75E931CDE

88 05 CB C3 00 00

MOV var12 , AL



Sachant que :

L’adresse de l’instruction MOV AL , var1 est 0x00007FF75E931CD0

L’adresse de la variable var1 est 0x00007FF75E93E080

Le code opératoire de l’instruction MOV AL ,  est 8A 05

Comment pouvez-vous expliquer que le champ DATA ou Adresse de cette instruction est égal à AA C3 00 00 ?


Pour cette instruction, ce qui est codé dans le champ DATA ou Adresse est normalement l'adresse de la variable var1. Sauf qu'il s'agit ici de l'écart relatif et non de l'adresse absolue. C'est-à-dire de l'écart à ajouter à l'adresse actuelle du pointeur d'instruction RIP pour obtenir l'adresse absolue de la variable var1.

Ainsi au moment où l'instuction MOV AL, var1 est exécutée, RIP pointe déjà sur l'instruction suivante.

L'adresse de var1 [], la soustraction  - RIP donne l'adresse qu'on recherche.

Le champ DATA ou adresse étant sur 32 bits pour cette instruction cela donne 00 00 C3 AA et comme le stockage commence par l'octet de poids faible, cela donne bien AA c3 00 00 dans le code machine

- Que fait ce programme ?

Ce programme fait la somme de var1 et var8 et stocke le résultat dans var12.

Notes:

Instuction contient Valeur -> Immédiat

Instruction contient l'adresse -> Direct

Registre contient valeur -> Registre

Registre contient l'adresse -> Indirect

4\. Si ... alors ... sinon

Considérons le programme ci-dessous:

main.cpp

#include <iostream>

using namespace std;

extern "C" unsigned char majorite(unsigned int age);

int main()

{

`	`unsigned int age;

`	`cout << "Quel est votre age ? : "; cin >> age;

`	`if (majorite(age))

`		`cout << "Vous etes Majeur." << endl;

`	`else

`		`cout << "Vous etes Mineur." << endl;

`	`return 0;

}


prog.asm

.CODE

`	`majorite PROC

`		`si\_supegal18 : CMP ECX,18

`		`JAE alors\_majeur

`		`sinon\_mineur : MOV AL,0

`		`JMP fin\_si

`		`alors\_majeur : MOV AL,1

`		`fin\_si : RET

`	`majorite ENDP

END



Comparer les instructions en lignes 6 et 9.

La ligne 6 effectue un saut conditionnel à alrs\_majeur, si ECX est supérieur ou égal (JAE -> Jump if Above or Equal) à 18. Sinon, l'exécution continue vers sinon\_mineur, la ligne 9 effectue un saut inconditionnel à fin\_si pour contourner la partie alors si on est passé dans la partie sinon.

Que fait le programme ?

Le programme reçoit le paramètre age dans le registre ECX (int=32 bits, peu importe unsigned ou pas)

Si ECX >=18 alors AL= 1

sinon AL = 0


5\. Boucles et tableaux

.DATA AA

`	`tab\_src DWORD 15 , 80 , 99 , 45 , 8 , 51 , 3 , 19 , 75 , 10

`	`tab\_dest DWORD 10 DUP (?)

.CODE

`	`multiple3 PROC

`		`MOV RSI,0

`		`MOV RDI,0

`		`MOV EBX,3

`		`boucle :

`			`MOV EDX,0

`			`MOV EAX,tab\_src[RSI\*4]

`			`DIV EBX

`			`CMP EDX,0

`			`JNE suivant

`		`multiple :

`			`MOV ECX,tab\_src[RSI\*4]

`			`MOV tab\_dest[RDI\*4],ECX

`			`INC RDI

`		`suivant :

`			`INC RSI

`			`CMP RSI,9

`			`JBE boucle

`		`RET

`	`multiple3 ENDP

END


Le programme ci-dessus utilise un tableau tab\_src de dix nombres, recherche les multiples de 3 et les copie

dans un autre tableau tab\_dest.

Comment est déclaré le deuxième tableau tab\_dest ?

Avec la directive DUP qui permet de réserver de multiples éléments, ici 10 éléments DWORD dont le conu est non initialisé


Quels sont les registres qui sont utilisés comme indice pour ces tableaux ?


RSI, et RDI.


Quel est le rôle de la ligne 9 ?

Prépare le diviseur en mettant EBX à 3.


Quel est le rôle des lignes 11 et 12 ?

Ces lignes préparent le dividendes dans EAX, EBX.


Pourquoi les indices RSI et RDI sont-ils multipliés par 4 dans les lignes 12, 19 et 20 ?

Chaque élément du tableau occupe 4 octet, pour passer à l'élément suivant, il faut multiplier par 4.

Expliquez comment fonctionne la division de la ligne 14.

Nan flemme


Quel est le rôle de la ligne 17 ?

Il va trop vite


Est-il possible de remplacer les 2 instructions des lignes 19 et 20 par une seule instruction

Non

MOV tab\_dest[RDI4] , tab\_src[RSI4] ?


Quel est le rôle de la ligne 25 ?

RSI <= 9 on continue la boucle. JBE c'est pour les nombres non-signés.


Quel est le contenu du tableau tab\_dest à la fin du programme ?

15 99 45 51 03 75 00 00 00 00 (les multiples de 3)


Expliquez ce que fait le programme.

Mets dans tab\_dest tout les multiples de trois de tab\_src.


Que faudrait-il changer dans le programme si on veut qu’il fonctionne aussi avec des valeurs

négatives ?

Il faudrait mettre des FF... sur 32 bits, et utiliser IDIV





6\. À vous de jouer

.DATA

`	`n		QWORD	10

`	`somme	QWORD	0

`	`produit	QWORD	1

.CODE

`	`awa	PROC

`		`MOV RAX, 1

`		`MOV RBX, n

`		`boucle:

`			`AVX somme, RAX

`			`IMUL produit, RAX

`			`INC RAX

`			`CMP RAX, RBX

`			`JLE boucle

`			`RET

`	`awa	ENDP

END


Version du professeur:

.DATA

`	`n		QWORD	10

`	`somme	QWORD	0

`	`produit	QWORD	1

.CODE

`	`sommeproduit	PROC

`			`MOV RAX, 1

`			`MOV RBX, 0

`			`MOV RCX, 1

`		`Repet:

`			`CMP RCX, n

`			`JA fin

`			`MUL RCX

`			`ADD RBX, RCX

`			`INC RCX

`			`JMP Repet

`		`fin:

`			`MOV produit, RAX

`			`MOV somme, RBX

`			`RET

`	`sommeproduit ENDP

END
