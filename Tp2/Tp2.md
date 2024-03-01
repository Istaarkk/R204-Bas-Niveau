  -----------------------------------------------------------------------
  1\. Microprocesseur élémentaire
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Chargez le circuit **micro1.circ**. Ce circuit représente un
microprocesseur élémentaire composé des éléments suivants :

-   1 horloge (en bas à gauche) produisant alternativement un 0 et un 1

-   1 composant cycleur prenant en entrée le signal de l'horloge et
    produisant en sortie 4 signaux s'activant à tour de rôle et
    permettant d'activer successivement les différents composants : o
    Activation de la mémoire pour lire la prochaine instruction à
    exécuter o Activation de l'UAL pour réaliser l'opération indiquée
    par l'instruction o Activation de l'écriture dans les registres pour
    stocker le résultat dans les registres o Incrémentation du compteur
    indiquant l'adresse de la prochaine instruction à exécuter

-   1 compteur (à gauche au milieu) dont la sortie O est reliée à
    l'entrée A (Adresse) de la mémoire. Ce compteur s'incrémente
    automatiquement à chaque cycle d'horloge afin d'indiquer l'adresse
    de la prochaine instruction à exécuter.

-   1 mémoire dont chaque case contient une instruction en langage
    machine.

-   1 unité arithmétique et logique (ALU) permettant de réaliser des
    calculs. L'ALU possède 2 entrées I0 et I1 et produit le résultat sur
    sa sortie O, lorsqu'elle reçoit le signal d'activation sur son
    entrée E. L'opération réalisée par l'ALU dépend des entrées C3,C2,C1
    et C0. La table à droite indique l'opération réalisée en fonction
    des valeurs de C3,C2,C1,C0.

> Z, N et C sont des bits en sortie (appelés indicateurs ou drapeaux ou
> flags) dont la valeur dépend du résultat de la dernière opération
> réalisée par l'UAL.

-   Si le résultat est nul alors Z passe à 1 sinon il passe à 0. o Si le
    résultat est négatif alors N passe à 1 sinon il passe à 0.

-   Si le résultat comporte une retenue alors C passe à 1 sinon il passe
    à 0.

```{=html}
<!-- -->
```
-   2 registres 16 bits A et B servant à stocker le résultat produit par
    l'UAL (à condition que l'écriture dans le registre soit activée par
    son entrée **en**). La valeur apparaissant à l'intérieur du registre
    est exprimée en hexadécimal. La sonde sur le fil à droite du
    registre permet d'afficher cette valeur en décimal. L'entrée des
    registres est D et la sortie est Q.

-   1 multiplexeur servant à choisir quelle valeur envoyer vers l'entrée
    I0 de l'UAL : soit le champ DATA ou Adresse, soit le registre A. Ce
    multiplexeur possède 2 entrées sur 16 bits I0 et I1, 1 entrée de
    contrôle sur 1 bit C, et 1 sortie sur 16 bits O. Si la valeur de
    l'entrée C est à 0 alors c'est son entrée I0 (DATA ou Adresse) qui
    est envoyée vers sa sortie O, sinon c'est I1 (Registre A).

Observez bien le circuit puis répondez aux questions suivantes :

Sur combien de bits est codée une instruction ?

  -----------------------------------------------------------------------
  **4 bits \* 6 chiffres, puisqu'hexa donc 24 bits**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Sur combien de bits est codé le champ DATA ou adresse ?

  -----------------------------------------------------------------------
  **16 bits**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Quelles sont les positions, dans le code de l'instruction, des bits du
champ DATA ou adresse (0 étant la position du bit de poids le plus
faible) ?

  -----------------------------------------------------------------------
  **De 0 à 15**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Sur combien de bits est codé le code opératoire ?

  -----------------------------------------------------------------------
  **8**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Quelles sont les positions dans le code de l'instruction, des bits du
code opératoire (0 étant la position du bit de poids le plus faible) ?

  -----------------------------------------------------------------------
  **16 à 23**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Indiquez le rôle de chacun des bits du code opératoire

  ----------------------------------------------------------------------------
  **Position**   **Nom**       **Rôle**
  -------------- ------------- -----------------------------------------------
  Bit 0          **JMP**       **Pour faire des instructions de saut**

  Bit 1          **REGISTRE    **Activation de l'écriture dans le registre B**
                 B**           

  Bit 2          **REGISTRE    **Activation de l'écriture dans le registre A**
                 A**           

  Bit 3          **MUX**       **Sert à choir entre DATA et registre A pour
                               l'entrée 10 de L'UAL**

  Bits 4,5,6,7   **ALU**       **Serve à choisir l'opérations faite par
                               L'ALU**
  ----------------------------------------------------------------------------

Ce microprocesseur supporte (entre autres) les instructions suivantes :

+--------------------+-------------------------------------------------+
| > **Instruction    | **Signification**                               |
| > (mnémonique      |                                                 |
| > assembleur)**    |                                                 |
+====================+=================================================+
| LOAD_A #valeur     | Copie une valeur dans le registre A             |
+--------------------+-------------------------------------------------+
| LOAD_B #valeur     | > Copie une valeur dans le registre B           |
+--------------------+-------------------------------------------------+
| LOAD_A\_B          | > Copie le registre B dans le registre A        |
+--------------------+-------------------------------------------------+
| LOAD_B\_A          | > Copie le registre A dans le registre B        |
+--------------------+-------------------------------------------------+
| ADD_A\_B           | > Additionne les registres A et B et stocke le  |
|                    | > résultat dans le registre A                   |
+--------------------+-------------------------------------------------+
| ADD_B\_A           | > Additionne les registres A et B et stocke le  |
|                    | > résultat dans le registre B                   |
+--------------------+-------------------------------------------------+
| NOT_A              | Inverse (complément à 1) le contenu du registre |
|                    | A                                               |
+--------------------+-------------------------------------------------+
| NOT_B              | Inverse (complément à 1) le contenu du registre |
|                    | B                                               |
+--------------------+-------------------------------------------------+
| INC_B              | > Incrémente le registre B                      |
+--------------------+-------------------------------------------------+
| JMP \<label\>      | > Saut à l'instruction étiquetée par \<label\>  |
+--------------------+-------------------------------------------------+

**Remarque** : dans toutes les instructions, le premier registre est le
registre destination.

**[Sans utiliser la simulation, mais en analysant uniquement le code
binaire de chaque instruction]{.underline}**, donnez en assembleur le
programme contenu dans la mémoire. Que fait ce programme ?

+-------+-------+---------------------+------------------------------+
| *     | **Co  | **Code**            | > **Instruction (mnémonique  |
| *Adre | ntenu |                     | > assembleur)**              |
| sse** | mémo  | **Instruction**     |                              |
|       | ire** |                     |                              |
| > *   |       | **(en binaire)**    |                              |
| *mémo | >     |                     |                              |
| ire** | **(en |                     |                              |
|       | > hé  |                     |                              |
|       | xa)** |                     |                              |
+=======+=======+=====================+==============================+
| 0000  | 1     | > 0001 0100 0000    | **LOAD_A #0**                |
|       | 40000 | > 0000 0000 0000    |                              |
+-------+-------+---------------------+------------------------------+
| 0001  | 1     | > 0001 0010 0000    | **LOAD_B #10**               |
|       | 2000a | > 0000 0000 1010    |                              |
+-------+-------+---------------------+------------------------------+
| 0002  | 5     | > 0101 1100 0000    | **Boucle : ADD_A\_B**        |
|       | c0000 | > 0000 0000 0000    |                              |
+-------+-------+---------------------+------------------------------+
| 0003  | 0     | > 0000 0001 0000    | **JMP boucle**               |
|       | 10002 | > 0000 0000 0010    |                              |
+-------+-------+---------------------+------------------------------+
| *     |       |                     | Calcul dans les registres A  |
| *Rôle |       |                     | les multiples de             |
| du    |       |                     | 10(0,10,20,30,40 etc. ou     |
| p     |       |                     | hexa 0, A,14,1 etc.)         |
| rogra |       |                     |                              |
| mme** |       |                     |                              |
+-------+-------+---------------------+------------------------------+

**[Vérifiez en faisant une simulation]{.underline}** : cliquez sur la
main dans la barre d'outils, puis cliquez à plusieurs reprises sur
l'horloge (ou appuyez sur CTRL-T). [Pour réinitialiser la simulation
appuyez sur CTRL+R]{.underline}

**[Modifiez le programme contenu dans la mémoire pour avoir le résultat
dans B au lieu de A]{.underline}**. Cliquez avec le bouton droit sur la
mémoire puis choisir **Edit Contents**. Entrez ensuite le code héxa de
chaque instruction dans la bonne case mémoire. La première colonne
indique l'adresse de la première case située dans la 2^ème^ colonne (les
adresses des cases suivantes dans une même ligne seront déduites
mentalement). Testez le bon fonctionnement de votre programme à l'aide
d'une simulation.

+-------+-------+---------------------+------------------------------+
| *     | **Co  | **Code**            | > **Instruction (mnémonique  |
| *Adre | ntenu |                     | > assembleur)**              |
| sse** | mémo  | **Instruction**     |                              |
|       | ire** |                     |                              |
| > *   |       | **(en binaire)**    |                              |
| *mémo | >     |                     |                              |
| ire** | **(en |                     |                              |
|       | > hé  |                     |                              |
|       | xa)** |                     |                              |
+=======+=======+=====================+==============================+
| 0000  | >     | > **0001 0100 0000  | **LOAD_A #10**               |
|       | **140 | > 0000 0000 0000**  |                              |
|       | 00a** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0001  | >     | > **0001 0010 0000  | **LOA_B #0**                 |
|       | **120 | > 0000 0000 1010**  |                              |
|       | 000** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0002  | >     | > **0101 1010 0000  | **Boucle ADD_B\_A**          |
|       | **5a0 | > 0000 0000**       |                              |
|       | 000** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0003  | >     | > **0000 0001 0000  | **JMP Boucle**               |
|       | **010 | > 0000 0000**       |                              |
|       | 002** |                     |                              |
+-------+-------+---------------------+------------------------------+

**[Ecrire un programme]{.underline}** qui charge dans le registre A une
valeur de votre choix puis calcule dans le registre B son complément à 2
(complément à 1 + 1).

+-------+-------+---------------------+------------------------------+
| *     | **Co  | **Code**            | > **Instruction (mnémonique  |
| *Adre | ntenu |                     | > assembleur)**              |
| sse** | mémo  | **Instruction**     |                              |
|       | ire** |                     |                              |
| > *   |       | **(en binaire)**    |                              |
| *mémo | >     |                     |                              |
| ire** | **(en |                     |                              |
|       | > hé  |                     |                              |
|       | xa)** |                     |                              |
+=======+=======+=====================+==============================+
| 0000  | >     | > **0001 0100 0000  | **LOAD_A #5**                |
|       | **140 | > 0000 0000 0101**  |                              |
|       | 005** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0001  | >     | > **0001 1010 0000  | **LOAD_B\_A**                |
|       | **1A0 | > 0000**            |                              |
|       | 000** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0002  | >     | > **1100 0010 0000  | **NOT_B**                    |
|       | **C20 | > 0000**            |                              |
|       | 000** |                     |                              |
+-------+-------+---------------------+------------------------------+
| 0003  | >     | > **0011 0010 0000  | INC_B                        |
|       | **320 | > 0000**            |                              |
|       | 000** |                     |                              |
+-------+-------+---------------------+------------------------------+

> 2\. Microprocesseur avec sauts conditionnels

Chargez le circuit **micro2.circ**

Sur combien de bits est codée une instruction ?

  -----------------------------------------------------------------------
  **32 bits**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Sur combien de bits est codé le code opératoire ?

  -----------------------------------------------------------------------
  **16 bits**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

Sur combien de bits est codé le champ DATA ou adresse ?

  -----------------------------------------------------------------------
  **16 bits**
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

A quoi servent les 4 bits JMPZ, JMPNZ, JMPN, JMPPZ ?

+------+---------------------------------------------------------------+
| **B  | **Rôle**                                                      |
| it** |                                                               |
+======+===============================================================+
| JMPZ | **Jump If = 0**                                               |
+------+---------------------------------------------------------------+
| > J  | **Jump If not 0**                                             |
| MPNZ |                                                               |
+------+---------------------------------------------------------------+
| JMPN | **Jump if négatif**                                           |
+------+---------------------------------------------------------------+
| > J  | **Jump if positif or NULL**                                   |
| MPPZ |                                                               |
+------+---------------------------------------------------------------+

**[Donnez les codes binaires et hexa]{.underline}** des instructions
suivantes :

+---------------+---------------------------------------+-------------+
| > **          | > **Code Binaire**                    | > **Code    |
| Instruction** |                                       | > Héxa**    |
+===============+=======================================+=============+
| NOP           | > 0000 0000 X000 XXXX                 | > 0x0000    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| LOAD_A        | > 0000 0001 0100 VVVV                 | > 0x0014    |
| #valeur       |                                       | > VVVV      |
+---------------+---------------------------------------+-------------+
| LOAD_B\_A     | > 0000 0001 1010 XXXX                 | > 0x001A    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| MUL_A\_B      | > 0000 1000 1100 XXXX                 | > 0x008C    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| DEC_B         | > 0000 1000 1100 XXXX                 | > 0x0042    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| JMP \<label\> | > 0000 0000 0001 AAAA                 | > 0x0001    |
|               |                                       | > AAAA      |
+---------------+---------------------------------------+-------------+
| JMPZ          | > 1000 0000 0000 AAAA                 | > 0x0001    |
| \<label\>     |                                       | > AAAA      |
+---------------+---------------------------------------+-------------+
| JMPNZ         | > 0100 0000 0000 AAAA                 | 0x0400 AAAA |
| \<label\>     |                                       |             |
+---------------+---------------------------------------+-------------+

En utilisant les instructions ci-dessus, **[écrire un
programme]{.underline}** qui charge dans le registre A la valeur 5 puis
calcule sa factorielle. Vous donnerez 2 versions. La première version
utilisera l'instruction JMPNZ. La deuxième version utilisera les
instructions JMPZ et JMP. Ecrivez les codes hexa trouvés dans la mémoire
puis testez à l'aide de simulations.

**1^ère^ version (JMPNZ)**

+--------+---------------------------------------+--------------------+
| >      | > **Instruction (mnémonique           | > **Contenu        |
|  **Adr | > assembleur)**                       | > mémoire (en      |
| esse** |                                       | > héxa)**          |
+========+=======================================+====================+
| > 0000 | **LOAD_A #5**                         | > **0x0014 0005**  |
+--------+---------------------------------------+--------------------+
| > 0001 | **LOAD_B 8A**                         | > **001A 0000**    |
+--------+---------------------------------------+--------------------+
| > 0002 | **DEC_B**                             | > **0042 0000**    |
+--------+---------------------------------------+--------------------+
| > 0003 | **MUL_A\_B**                          | **008C 0000**      |
+--------+---------------------------------------+--------------------+
| > 0004 | **DEC_B**                             | > **0042 0000**    |
+--------+---------------------------------------+--------------------+
| > 0005 | **JMPNZ**                             | > **0400 0003**    |
+--------+---------------------------------------+--------------------+
| > 0006 | **NOP**                               | > **0000 0000**    |
+--------+---------------------------------------+--------------------+

**2ème version (JMPZ et JMP)**

+--------+---------------------------------------+--------------------+
| >      | > **Instruction (mnémonique           | > **Contenu        |
|  **Adr | > assembleur)**                       | > mémoire (en      |
| esse** |                                       | > héxa)**          |
+========+=======================================+====================+
| > 0000 | **LOAD_A #5**                         | > **0014 0005**    |
+--------+---------------------------------------+--------------------+
| > 0001 | **LOAD_B \_A**                        | > **001A 0000**    |
+--------+---------------------------------------+--------------------+
| > 0002 | **DEC_B**                             | > **0042 0000**    |
+--------+---------------------------------------+--------------------+
| > 0003 | **JMPZ**                              | > **0800 0006**    |
+--------+---------------------------------------+--------------------+
| > 0004 | **MUL_A\_B**                          | > **008c 0000**    |
+--------+---------------------------------------+--------------------+
| > 0005 | **JMP**                               | > **0001 0002**    |
+--------+---------------------------------------+--------------------+
| > 0006 | **NOP**                               | > **0000 0000**    |
+--------+---------------------------------------+--------------------+

> 3\. Microprocesseur a 3 registres

Chargez le circuit **micro3.circ**. Ce microprocesseur comporte un
registre supplémentaire (le registre C) et un multiplexeur
supplémentaire (MUX1). Le code opératoire des instructions utilise 2
bits supplémentaires par rapport au précédent :

-   Registre C (bit 13 du code opératoire) : permet d'activer l'écriture
    du résultat dans le registre C

-   MUX1 (bit 12 du code opératoire): permet de choisir quoi envoyer à
    l'entrée I1 de l'UAL :

```{=html}
<!-- -->
```
-   le registre B si MUX1=0 o le registre C si MUX1=1 **Trouvez les
    codes binaires et hexa** des instructions suivantes :

-   

+---------------+---------------------------------------+-------------+
| > **          | > **Code Binaire**                    | > **Code    |
| Instruction** |                                       | > Héxa**    |
+===============+=======================================+=============+
| LOAD_A        | > XX0X 0000 0001 0100 0xVVVV          | > 0x0014    |
| #valeur       |                                       | > VVVV      |
+---------------+---------------------------------------+-------------+
| LOAD_B        | > XX0X 0000 0001 0010 0xVVVV          | > 0x0012    |
| #valeur       |                                       | > VVVV      |
+---------------+---------------------------------------+-------------+
| LOAD_A\_B     | > XX00 0000 0010 X100 0xXXXX          | > 0x0024    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| LOAD_B\_C     | > XX01 0000 0010 X010 0xXXXX          | > 0x1022    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| LOAD_C\_A     | > XX01 0000 0010 X010 0xXXXX          | > 0x2018    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| ADD_C\_AB     | > XX10 0000 0101 1000 0xXXXX          | > 0x2058    |
|               |                                       | > 0000      |
+---------------+---------------------------------------+-------------+
| JMP \<label\> | > XX0X 0000 0000 0001 0xAAAA          | 0x0001 AAAA |
+---------------+---------------------------------------+-------------+

En utilisant les instructions précédentes, **[écrire un
programme]{.underline}** qui charge dans le registre A la valeur 3 et
dans le registre B la valeur 5 puis permute le contenu des 2 registres A
et B. On utilisera le registre C comme variable temporaire pour
effectuer la permutation. Ecrivez les codes hexa trouvés dans la mémoire
puis testez à l'aide de simulations.

+-------+-----------------------------------+-------------------------+
| > *   | > **Instruction assembleur**      | > **Code Héxa**         |
| *Adre |                                   |                         |
| sse** |                                   |                         |
+=======+===================================+=========================+
| >     | **LOAD_A #3**                     | > **0014 0003**         |
|  0000 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_B #5**                     | > **0012 0005**         |
|  0001 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_C \_A**                    | > **2018 0000**         |
|  0002 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_A\_B**                     | > **0024 0000**         |
|  0003 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_B\_C**                     | > **1022 0000**         |
|  0004 |                                   |                         |
+-------+-----------------------------------+-------------------------+

On considère la suite de Fibonacci : 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,
... dans laquelle chaque élément est obtenu en faisant la somme des 2
éléments précédents (hormis les 2 premiers). **[Ecrire un
programme]{.underline}** qui charge dans le registre A la valeur 0 et
dans le registre B la valeur 1 puis calcule dans le registre C les
valeurs de la suite de Fibonacci à l'infini. Ecrivez les codes hexa
trouvés dans la mémoire puis testez à l'aide de simulations.

+-------+-----------------------------------+-------------------------+
| > *   | > **Instruction assembleur**      | > **Code Héxa**         |
| *Adre |                                   |                         |
| sse** |                                   |                         |
+=======+===================================+=========================+
| >     | **LAOD_A #0**                     | > **0014 0000**         |
|  0000 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_B #1**                     | > **0012 0001**         |
|  0001 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **ADD_C AB**                      | > **2058 0000**         |
|  0002 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_A\_B**                     | > **0024 0000**         |
|  0003 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **LOAD_B\_C**                     | > **1022 0000**         |
|  0004 |                                   |                         |
+-------+-----------------------------------+-------------------------+
| >     | **JMP 002**                       | > **0 0001 0002**       |
|  0005 |                                   |                         |
+-------+-----------------------------------+-------------------------+
