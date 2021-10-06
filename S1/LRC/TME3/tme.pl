
/*r(a,b).
r(f(X),Y) :- p(X,Y).
p(f(X),Y) :- r(X,Y).*/

/*r(a,b).
q(X,X).
q(X,Z) :- r(X,Y),q(Y,Z).*/

/*consciencieux(Zoe, Pascal).
etu(Zoe, Pascal).
reussir(etu) :- revise(etu).
revise(etu) :- serieux(etu).
serieux(etu) :- devoir(etu).
devoir(etu) :- consciencieux(etu).*/

pere(stephane,enzo).
pere(stephane,stessie).
pere(stephane,kelly).
pere(bernard,stephane).
mere(marie,enzo).
mere(marie,stessie).
mere(marie,kelly).
parent(X,Y) :- pere(X, Y).
parent(X,Y) :- mere(X, Y).
parent(X,Y,Z) :- pere(Y,X), mere(Z,X).
parent(X,Y,Z) :- mere(Y,X), pere(Z,X).
siblings(X,Y) :- mere(_,X), mere(_,Y), pere(_,X), pere(_,Y).
grandpere(X,Y) :- pere(Z,Y), pere(X,Z).
/*ancetre(X,Y) :- parent(X,_,_), parent(Y,_,_).*/

/*et(0,0,0).
et(0,1,0).
et(1,0,0).
et(1,1,1).
ou(0,0,0).
ou(0,1,1).
ou(1,0,1).
ou(1,1,1).
non(0,1).
non(1.0).
xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).
et(X,Y,Z) :- .
ou(X,Y,Z) :- .
non(X,Y) :- .
xor(X,Y,Z) :- .
circuit(X,Y,Z) :- no(xor(no(X),no(et(X,Y)))).*/