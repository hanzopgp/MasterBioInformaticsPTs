/*Exercice 1*/

/*r(a,b).
r(f(X),Y) :- p(X,Y).
p(f(X),Y) :- r(X,Y).*/

/*Exercice 2*/

/*r(a,b).
q(X,X).
q(X,Z) :- r(X,Y),q(Y,Z).*/

/*Exercice 3*/

/*consciencieux(zoe).
consciencieux(pascal).
reussir(X) :- revise(X).
revise(X) :- serieux(X).
serieux(X) :- devoir(X).
devoir(X) :- consciencieux(X).*/

/*Exercice 4*/

pere(stephane,enzo).
pere(stephane,stessie).
pere(stephane,kelly).
pere(bernard,stephane).
pere(august,stephane).
mere(marie,enzo).
mere(marie,stessie).
mere(marie,kelly).
parent(X,Y) :- pere(X, Y).
parent(X,Y) :- mere(X, Y).
parents(X,Y,Z) :- mere(Y,X), pere(Z,X).
siblings(X,Y) :- mere(_,X), mere(_,Y), pere(_,X), pere(_,Y), X\==Y.
grandpere(X,Y) :- pere(Z,Y), pere(X,Z).
arrieregrandpere(X,Y) :- pere(Z,Y), pere(W,Z), pere(X,W).
ancetre(X,Y) :- parent(X,Y).
ancetre(X,Y) :- parent(X,Z), ancetre(Z,Y), X\==Y.

/*Exercice 5*/

/*et(0,0,0).
et(0,1,0).
et(1,0,0).
et(1,1,1).
ou(0,0,0).
ou(0,1,1).
ou(1,0,1).
ou(1,1,1).
non(0,1).
non(1,0).
xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).
circuit(X,Y,Z) :- et(X,Y,A), non(A,B), non(X,C), xor(B,C,D), non(D,Z).*/ 