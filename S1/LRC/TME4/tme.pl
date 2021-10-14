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

xadd([X|L1],Y,[X|Lres]) :- xadd(L1,Y,Lres).
xadd([],X,[X]).
xadd(X,[],[X]).

xdelete([X|L1],Y,[X|Lres]) :- X\==Y, xdelete(L1,Y,Lres).
xdelete([X|L1],X,Lres) :- xdelete(L1,X,Lres).
xdelete([],_,[]).

xreverse([X|L1], Lres) :- xreverse(L1, TMP), xadd(TMP, X, Lres).
xreverse([],[]).

xconcatene([X|L1],L2,[X|Lres]) :- xconcatene(L1,L2,Lres). 
xconcatene([],X,X).
xconcatene(X,[],X).

xfiltre([X|L1],[_|L2],Lres) :- xdelete(L1,X,TMP), xfiltre(TMP,L2,Lres).
xfiltre(X,[],X).
xfiltre([],_,[]).

/*====================================================================*/

/* Exercice 3 */

listeeq([X|_],[_|L2]) :- listeeq(X,L2).
listeeq(X,Y) :- X=Y.

palindrome(L1) :- xreverse(L1,L1).

/*last([_|L1], LAST) :- last(L1,LAST).
last([X], X). 

palindrome2([_|L1]) :- palindrome2(L1).
palindrome2([X|L1]) :- last(L1)\==X.*/

palindrome2([]).
palindrome2([_]).
palindrome2([X|L1]) :- xconcatene(TMP, [X], L1), palindrome2(TMP).