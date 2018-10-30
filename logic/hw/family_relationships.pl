/**
* Michelle Bergin
* Logic Programming
*/
male(paul).
male(albert).
male(james).
male(vernon).
male(dudley).
male(harry).
female(ruth).
female(helen).
female(petunia).
female(lili).
parent_of(paul,petunia).
parent_of(paul,lili).
parent_of(helen,petunia).
parent_of(helen,lili).
parent_of(albert,james).
parent_of(ruth,james).
parent_of(lili,harry).
parent_of(james,harry).
parent_of(vernon,dudley).
parent_of(petunia,dudley).

father_of(X,Y):- male(X), parent_of(X,Y).
mother_of(X,Y):- female(X), parent_of(X,Y).
grandfather_of(X,Y):- father_of(X,Z), parent_of(Z,Y).
grandmother_of(X,Y):- mother_of(X,Z), parent_of(Z,Y).
sister_of(X,Y):- female(X), parent_of(Z,X), parent_of(Z,Y).
brother_of(X,Y):- male(X), parent_of(Z,X), parent_of(Z,Y).
aunt_of(X,Y):- sister_of(X,Z), parent_of(Z,Y).
uncle_of(X,Y):- brother_of(X,Z), parent_of(Z,Y).


