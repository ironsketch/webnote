convert(0,0).
convert(succ(X),Y):- convert(X,Y1), Y is Y1 + 1.

numeral(0).
numeral(succ(X)):- numeral(X).

add(0,Z,Z).
add(succ(X),Y,Z):- add(X,succ(Y),Z).

mul(_,0,0).
mul(X,Y,Z):- Y1 is Y - 1, mul(X,Y1,Z1), !, Z is X + Z1.

mulNum(X,succ(0),X).
mulNum(X,succ(Y),Z):- mulNum(X,Y,Z1), !, add(X,Z1,Z).

greater_than(succ(_),0).
greater_than(succ(X),succ(Y)):- greater_than(X,Y).

less_than(0,succ(_)).
less_than(succ(X),succ(Y)):- less_than(X,Y).

equal(X,Y):- X = Y.

ge(X,Y):- equal(X,Y); greater_than(X,Y).
le(X,Y):- equal(X,Y); less_than(X,Y).
ne(X,Y):- not(equal(X,Y)).

factorial(1,1).
factorial(X,Z):- X1 is X - 1, factorial(X1,Z1),!, Z is X * Z1.

factNum(succ(0),succ(0)).
factNum(succ(X),Z):- factNum(X,Z1), !, mulNum(Z1,succ(X),Z).

fib(0,_).
fib(1,_).
fib(X,Y):- X1 is X - 1, fib(X1,Y1), Y is Y1 + X.
