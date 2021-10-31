male(jack).
male(edward).
male(mark).
male(ian).
male(nick).
male(paul).
male(sam).

female(catherine).
female(elizabeth).
female(sophia).
female(rose).
female(emily).

married(jack,rose).
married(edward,emily).
married(paul,elizabeth).
married(sam,sophia).

parent(jack,edward).
parent(rose,edward).
parent(jack,elizabeth).
parent(rose,elizabeth).
parent(edward,catherine).
parent(edward,mark).
parent(edward,ian).
parent(emily,catherine).
parent(emily,mark).
parent(emily,ian).
parent(elizabeth,sophia).
parent(paul,sophia).
parent(sam,nick).
parent(sophia,nick).

father(X,Y)	:-male(X),parent(X,Y).
mother(X,Y)	:-female(X),parent(X,Y).
son(X,Y):- male(X), parent(Y,X).
daughter(X,Y):-female(X),parent(Y,X).
brother(X,Y):- male(X), father(F, Y), father(F,X), mother(M,Y),  mother(M,X), X \= Y.
sister(X,Y):- female(X), father(F, Y), father(F,X), mother(M,Y),  mother(M,X), X \= Y.
child(X,Y):-  son(Y,X); daughter(Y,X).
grandfather(X,Y):- male(X), parent(X,Z), parent(Z,Y).
grandmother(X,Y):- female(X), parent(X,Z), parent(Z,Y).
grandchild(X,Y):- child(X,Z), child(Z,Y).
aunt(X,Y):- female(X), sister(X,Z), parent(Z,Y).
uncle(X,Y):- male(X), brother(X,Z), parent(Z,Y).
nephew(X,Y):- male(X), aunt(Y,X); male(X), uncle(Y,X).
niece(X,Y):- female(X), aunt(Y,X); female(X), uncle(Y,X).
