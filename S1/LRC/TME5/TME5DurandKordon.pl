subs(chat,felin).                                    /* ligne 3 */
subs(felin,mammifere).
subs(mammifere,animal).
subs(canide,mammifere).
subs(chien,canide).
subs(canide,chien).
subs(canari,animal).
subs(animal,etreVivant).
subs(lion,felin).
subs(lion,carnivoreExc).
subs(carnivoreExc,predateur).
subs(chihuahua,and(chien,pet)).                      /* ligne 14 */
subs(souris,mammifere).
subs(and(animal,some(aMaitre)),pet).                 /* ligne 16 */
subs(pet,some(aMaitre)).
subs(animal,some(mange)).
subs(some(aMaitre),all(aMaitre,personne)).           /* ligne 19 */
subs(and(animal,plante),nothing).
subs(and(all(mange,nothing),some(mange)),nothing).   /* ligne 21 */
equiv(carnivoreExc,all(mange,animal)).               /* ligne 22 */
equiv(herbivoreExc,all(mange,plante)).

/* Exercice 2. 6. */
subsS(C,D):-equiv(C,D).
subsS(C,D):-equiv(D,C).

/* Exercice 3. 2. */
/* C subsume (D1 inter D2) implique que C subsume D1 et C subsume D2 et D1 != D2 
requete qui ne fonctionnerait pas sans cette regle : subsS(chihuahua,and(pet,chien))*/
subsS(C,and(D1,D2),L):-D1\=D2,subsS(C,D1,L),subsS(C,D2,L). 
/* Si D1 et D2 subsument D et que D1 et D2 ne sont pas dans la liste deja testé, alors C subsume D1 et D2 
et on ajoute D1 et D2 à la liste, D1 et D2 != C 
requete qui ne fonctionnerait pas sans cette regle : subS(C,D,L) avec D1,D2 deux elements qui subsume D, mais ou C ne subsumerait pas explicitement D */
subsS(C,D,L):-subs(and(D1,D2),D),E=and(D1,D2),not(member(E,L)), subsS(C,E,[E|L]),E\==C. 
/* Si C est instancié alors C subsume D et on ajoute C à la liste. Donc C inter C subsume aussi D 
requete qui ne fonctionnerait pas sans cette regle :  */
subsS(and(C,C),D,L):-nonvar(C),subsS(C,D,[C|L]).
/* C1 et C2 subsume D implique que C1 sub D et on ajoute C1 a la liste 
L'algorithme prouvant la subsomption n'est pas symetrique, il faut donc tester la subsomption de C1 et C2 
requete qui ne fonctionnerait pas sans cette regle : subsS(and(A,B),C) (avec subsS(and(B,A),C) true) */
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C1,D,[C1|L]).
/* C1 et C2 subsume D implique que C2 sub D et on ajoute C2 a la liste 
L'algorithme prouvant la subsomption n'est pas symetrique, il faut donc tester la subsomption de C1 et C2 
requete qui ne fonctionnerait pas sans cette regle : subsS(and(B,A),C) (avec subsS(and(A,B),C) true) */
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C2,D,[C2|L]).
/* C1 et C2 subsume D implique que C1 et C2 ne sont pas dans la liste testé et que C1 et C2 subsume D 
requete qui ne fonctionnerait pas sans cette regle :  */
subsS(and(C1,C2),D,L):-Cinv=and(C2,C1),not(member(Cinv,L)),subsS(Cinv,D,[Cinv|L]).

/* Exercice 2. 3.*/
subsS(C,C,_).
subsS(C,D,_):-subs(C,D),C\==D.
subsS(C,D,L):-subs(C,E),not(member(E,L)),subsS(E,D,[E|L]),E\==D.
subsS(C,D):-subsS(C,D,[C]).

/* Exercice 4. 1. */
subsS(all(R,C),all(R,D)):-subsS(C,D).

/* Exercice 2. 1. */
subsS1(C,C). /* C subsume C */
subsS1(C,D):-subs(C,D),C\==D. /* C subsume D et C != D */
subsS1(C,D):-subs(C,E),subsS1(E,D). /* C subsume D si C subsume E et E subsume D --> transitivité */

/*==================================================================================================================================*/

/* Exercice 1 */
/* Les chats sont des felins. ligne 3 */
/* chat sub felin */
/* Un chihuahua est à la fois un chien et un animal de compagnie ligne 14 */
/* chihuahua sub (chien inter pet) */ 
/* Un animal qui a un maitre est un animal de compagnie ligne 16 */
/* (EaMaitre inter animal) sub pet */
/* Toute entite qui a maitre ne peut avoir qu’un (ou plusieurs) maitre(s) humain(s) ligne 19 */
/* EaMaitre sub VaMaitre.Personne */ 
/* On ne peut pas a la fois ne rien manger (ne manger que des choses qui n’existent pas) et manger quelque chose ligne 21 */
/* (Vmange.nothing inter Emange) sub nothing */ 
/* Un carnivore exclusif est d´efini comme une entite qui mange uniquement des animaux ligne 22 */
/* carnivoreExc equiv Vmange.animal */ 

/*==================================================================================================================================*/

/* Exercice 2 */

/* 2. chien sub souris --> avec la trace on voit que le programme boucle a l'infinie en essayant de trouver une correspondance entre chien et souris, 
il voit que le chien est un canide, il regarde si la souris est aussi un canide etc... Il ne trouve aucune reponse et semble chercher a l'envers 
(est ce que animal sub souris) etc... Il essaie toutes les sub en remplacant chien par souris mais cela ne fonctionne pas. */

/* 3. Ce code permet de ne pas boucler à l'infini en gardant une trace des subsomptions deja essayées. 
chat sub etre vivant --> Etrevivant = chat 
chien sub canide     --> true
chien sub chien      --> true
chien sub souris     --> false
chien sub souris avec la trace : Cette fois le programme ne boucle pas a l'infini, il fait le tour des concepts, ne trouve rien, et repond false. */

/* 4. souris sub Emange --> true 
Cette requete fonctionne car souris sub mammifere, mammifere sub animal, animal sub Emange.
Prolog ne fait pas la distinction, il utilise juste les regles et ne sait pas ce qu'est un concept atomique */

/* 5. Cette requete doit renvoyer tous les roles qui subsume chat
chat sub X 
--> 
X = chat ;
X = felin ;
X = mammifere ;
X = animal ;
X = etreVivant ;
X = some(mange) ;
false.
Cette requete doit renvoyer tous les roles qui sont subsumés par mammifere
X sub mammifere  
-->
X = mammifere ;
X = felin ;
X = canide ;
X = souris ;
X = chat ;
X = chien ;
X = lion ;
false. */

/* 6. */

/*==================================================================================================================================*/

/* Exercice 3 */

/* 1.
chihuahua sub (mammifere inter EaMaitre) --> true
(chien inter EaMaitre) sub pet           --> true
chihuahua sub (pet inter chien)          --> true
*/

/*==================================================================================================================================*/

/* Exercice 4 */

/*==================================================================================================================================*/

/* Exercice 5 */