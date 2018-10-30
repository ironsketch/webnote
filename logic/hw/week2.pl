/*
* Logic Programming
* Michelle Bergin
*
* TOC Trace, A very simple sentence generator, Finding paths through a maze, A representation of natural numbers, add, Traveling by car, train, and plane, Crossword puzzle 
*
* Trace
*/
kicking(malfoy,harry).
eating(dudley).

happy(aunt_petunia) :- happy(dudley).
happy(uncle_vernon) :- happy(dudley), unhappy(harry).
happy(dudley) :- kicking(dudley,harry).
happy(dudley) :- eating(dudley).
/*
* ?- consult(week2).
* true.
* 
* ?- trace
* |    .
* true.
* 
* [trace]  ?- happy(aunt_petunia).
*    Call: (8) happy(aunt_petunia) ? creep
*    Call: (9) happy(dudley) ? creep
*    Call: (10) kicking(dudley, harry) ? creep
*    Fail: (10) kicking(dudley, harry) ? creep
*    Redo: (9) happy(dudley) ? creep
*    Call: (10) eating(dudley) ? creep
*    Exit: (10) eating(dudley) ? creep
*    Exit: (9) happy(dudley) ? creep
*    Exit: (8) happy(aunt_petunia) ? creep
* true.
* 
* [trace]  ?- notrace
* |    .
* true.
* 
* 
* A very simple sentence generator
*/
word(article,a).
word(article,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
    word(article,Word1),
    word(noun,Word2),
    word(verb,Word3),
    word(article,Word4),
    word(noun,Word5).

/*
* Finding paths through a maze
*/
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,Y):- connected(X,Y).
path(X,Y):- connected(X,Z),path(Z,Y). 

/*
* A representation of natural numbers
*/
numeral(0).
numeral(succ(X)):- numeral(X).
greater_than(succ(_),0).
greater_than(succ(X),succ(Y)):- greater_than(X,Y).

/*
* Add
*/
add(0,Z,Z).
add(succ(X),Y,Z):- add(X,succ(Y),Z).

/*
* Convert
*/
convert(0,0).
convert(succ(X),Y):- convert(X,Y1), Y is Y1 + 1. 

/*
* Traveling by car, train, and plane
*/
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

oneStep(X,Y):- byCar(X,Y).
oneStep(X,Y):- byTrain(X,Y).
oneStep(X,Y):- byPlane(X,Y).
travel(X,Y):- oneStep(X,Y).
travel(X,Y):- oneStep(X,Z), travel(Z,Y).

oneStep(X,Y,byCar):- byCar(X,Y).
oneStep(X,Y,byTrain):- byTrain(X,Y).
oneStep(X,Y,byPlane):- byPlane(X,Y).
travel(X,Y,go(X,Y,Transport)):- oneStep(X,Y,Transport).
travel(X,Y,go(X,Z,Transport,Path)):- oneStep(X,Z,Transport), travel(Z,Y,Path).

/*
* Crossword Puzzle
*/
word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crossword(V1,V2,V3,H1,H2,H3):- 
    word(V1,_,A,_,B,_,C,_),
    word(V2,_,D,_,E,_,F,_),
    word(V3,_,G,_,H,_,I,_),
    word(H1,_,A,_,D,_,G,_),
    word(H2,_,B,_,E,_,H,_),
    word(H3,_,C,_,F,_,I,_).

/*
* ?- crossword(A,B,C,D,E,F).
* A = abalone,
* B = anagram,
* C = connect,
* D = abandon,
* E = elegant,
* F = enhance ;
* A = abandon,
* B = elegant,
* C = enhance,
* D = abalone,
* E = anagram,
* F = connect ;
*/

