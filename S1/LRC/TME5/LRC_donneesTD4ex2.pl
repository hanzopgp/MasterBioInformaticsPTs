/*Exo 2*/
/* T-BOX */
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

/* Règles de l'exo 3. à recopier à la suite des règles de l'exo 2 dans le fichier LRC_tme5.pl */
subsS(C,and(D1,D2),L):-D1\=D2,subsS(C,D1,L),subsS(C,D2,L).
subsS(C,D,L):-subs(and(D1,D2),D),E=and(D1,D2),not(member(E,L)), subsS(C,E,[E|L]),E\==C.
subsS(and(C,C),D,L):-nonvar(C),subsS(C,D,[C|L]).
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C1,D,[C1|L]).
subsS(and(C1,C2),D,L):-C1\=C2,subsS(C2,D,[C2|L]).
subsS(and(C1,C2),D,L):-subs(C1,E1),E=and(E1,C2),not(member(E,L)),subsS(E,D,[E|L]),E\==D.
subsS(and(C1,C2),D,L):-Cinv=and(C2,C1),not(member(Cinv,L)),subsS(Cinv,D,[Cinv|L]).

/*==================================================================================================================================*/

/* Début TME */

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