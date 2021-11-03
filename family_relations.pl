married(X, Y):- husband(X, Y) ; husband(Y, X).
parent(X, Y):- father(X, Y); mother(X, Y).
son(X, Y):- man(X), parent(Y, X).
daughter(X, Y):- woman(X), parent(Y, X).
father_in_law(X, Y):- married(Y, Z), father(X, Z).
mother_in_law(X, Y):- married(Y, Z), mother(X, Z).
grandfather(X, Y):- man(X), parent(Z, Y), parent(X, Z).
grandmother(X, Y):- woman(X), parent(Z, Y), parent(X, Z).
brother(X, Y):- man(X), father(Z, X), father(Z, Y), X\=Y.
sister(X, Y):- woman(X), father(Z, X), father(Z, Y), X\=Y.
uncle(X, Y):- (brother(X, Z), parent(Z, Y)) ; (husband(X, I), sister(I, Z), parent(Z, Y)).
aunt(X, Y):- (sister(X, Z), parent(Z, Y)) ; (wife(X, I), brother(I, Z), parent(Z, Y)).
cousin(X, Y) :- parent(Z, X), aunt(Z, Y) ; parent(Z, X), uncle(Z, Y).
brother_in_law(X, Y) :- (married(Y, Z), brother(X, Z)) ; husband(X, I), (sister(I, Y) ; (married(Y, J), sister(I, J))).
sister_in_law(X, Y) :- (married(Y, Z), sister(X, Z)) ; wife(X, I), (brother(I, Y) ; (married(Y, J), brother(I, J))).
nephew(X, Y) :- son(X, Z), (brother(Z, Y) ; sister(Z, Y) ; brother_in_law(Z, Y) ; sister_in_law(Z, Y)).
niece(X, Y) :- daughter(X, Z), (brother(Z, Y) ; sister(Z, Y) ; brother_in_law(Z, Y) ; sister_in_law(Z, Y)).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
