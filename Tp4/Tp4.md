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
