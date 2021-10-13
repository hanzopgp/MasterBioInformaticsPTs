/* Exercice 1 */

/*
1. ?- [a, [b, c], d] = [X]. 
false.
X étant deja une liste, elle ne peut pas être une liste hetero-dimensionnelle.

2. ?- [a, [b, c], d] = [X, Y, Z]. 
X = a,
Y = [b, c],
Z = d.
Possible car les variables peuvent prendre la forme de liste.

3. ?- [a, [b, c], d] = [a | L]. 
L = [[b, c], d].
Hetero-dimensionnelle possible car L represente la tail.

4. ?- [a, [b, c], d] = [X, Y]. 
false.
Impossible de separer sans que X ou Y soit une variable etant une liste hetero-dimensionnelle.

5. ?- [a, [b, c], d] = [X | Y].
X = a,
Y = [[b, c], d].
Possible car X et Y represente la head et la tail.

6. ?- [a, [b, c], d] = [a, b | L].
false.
Impossible de faire apparaitre a,b sans casser la liste.

7. ?- [a, b, [c, d]] = [a, b | L].
L = [[c, d]].
Fonctionne normalement.

8. ?- [a, b, c, d | L1] = [a, b | L2].
L2 = [c, d|L1].
L2 peut prendre la forme d'une liste exprime avec head et tail.
*/

/*====================================================================*/

/* Exercice 2 */

xadd([X|Xs],Y,[X|Xs2]) :- xadd(Xs,Y,Xs2).
xadd([],_,[]).

xdelete([X|Xs],Y,[X|Xs2]) :- X\==Y, xdelete(Xs,Y,Xs2).
xdelete([X|Xs],X,Xs2) :- xdelete(Xs,X,Xs2).
xdelete([],_,[]).

/*xreverse([X|Xs],[X|Xs2]) :- xreverse(Xs2,Xs).*/
xreverse([X|Xs], Z) :- xreverse(Xs, T), xadd(T, [X], Z).
xreverse([],[]).

/*xconcatene([_|Xs],Y,Z) :- xadd(Xs,Y,Z). 

xinverse(L1,L2) :- L2 is [A | B].

xsupprime(X,Y,Z) :- .

xfiltre(L1,L2,L3) :- .*/

/*====================================================================*/

/* Exercice 3 */