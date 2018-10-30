/**
* Michelle Bergin
* Logic Programming
*
* TOC
* Gryffindor_Table, Family_Relationships, Tomorrow's Lunch
*
* Gryffindor_Table
*/
sits_right_of("Katie Bell","Parvati Patil").
sits_right_of("Natalie McDonald","Katie Bell").
sits_right_of("Ron Weasley","Natalie McDonald").
sits_right_of("Hermione Granger","Ron Weasley").
sits_right_of("Harry Potter","Hermione Granger").
sits_right_of("Colin Creevey","Harry Potter").
sits_right_of("Seamus Finnigan","Colin Creevey").
sits_right_of("Angelina Johnson","Seamus Finnigan").
sits_right_of("Ginny Weasley","Angelina Johnson").
sits_right_of("Dean Thomas","Ginny Weasley").
sits_right_of("Dennis Creevey","Dean Thomas").
sits_right_of("Lee Jordan","Dennis Creevey").
sits_right_of("Gorge Weasley","Lee Jordan").
sits_right_of("Fred Weasley","George Weasley").
sits_right_of("Alicia Spinnet","Fred Weasley").
sits_right_of("Neville Longbottom","Alicia Spinnet").
sits_right_of("Lavender Brown","Neville Longbottom").
sits_right_of("Parvati Patil","Lavender Brown").

sits_left_of(X,Y):- sits_right_of(Y,X).
are_neighbors_of(X,Y,Z):- sits_left_of(X,Z), sits_right_of(Y,Z).
next_to_each_other(X,Y):- sits_right_of(X,Y).
next_to_each_other(X,Y):- sits_left_of(X,Y).

/**
* Output:
* ?- consult("gryffindor_table.pl").
* true.
* 
* ?- sits_right_of("Katie Bell","Parvati Patil").
* true.
* 
* ?- sits_left_of("Parvati Patil","Lavender Brown").
* false.
* 
* ?- sits_left_of("Parvati Patil","Katie Bell").
* true.
*
* ?- are_neighbors_of("Natalie McDonald","Parvati Patil","Katie Bell").
* false.
*
* ?- are_neighbors_of("Parvati Patil","Natalie McDonald","Katie Bell").
* true.
*
* ?- next_to_each_other("Katie Bell","Parvati Patil").
* true .
*
* ?- next_to_each_other("Parvati Patil","Katie Bell").
* true.
*
* Is Lavender to the right of Parvati?
* ?- sits_right_of("Lavender Brown","Parvati Patil").
* false.
*
* Is Lavender to the right of Neville?
* ?- sits_right_of("Lavender Brown","Neville Longbottom").
* true.
*
* Who is to the right of Hermione?
* ?- sits_right_of("Hermione Granger",X).
* X = "Ron Weasley".
*
* Who is sitting at the table?
* 
* Who is sitting two seats to the right of Hermione?
*
* Who is sitting between Neville and Fred?
*/

/**
* Family_Relationships
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

/**
* Output:
* ?- aunt_of(T,harry).
* T = petunia ;
* T = petunia ;
* T = lili ;
* T = lili ;
*
* ?- grandfather_of(paul,D).
* D = dudley ;
* D = harry.
*
* ?- mother_of(P,harry).
* P = lili .
*
* ?- mother_of(lili,K).
* K = harry.
*
* ?- sister_of(lili,P).
* P = petunia ;
* P = lili ;
* P = petunia ;
* P = lili.
*/

/**
* Tomorrow's Lunch
*/
starter("green salad").
starter(melon).
starter("tomato salad").
starter("rabbit pate").
main_dish("rock salmon with mayonnaise and capers").
main_dish("roast beef with girolle mushroom sauce").
main_dish("pasta, courgette and cheese bake").
desert(cheese).
desert(yoghurt).
desert("Paris Brest pastry").

menu(hungry,X,Y,Z):- starter(X), main_dish(Y), desert(Z).
menu(not_so_hungry,X,Y,nothing):- starter(X), main_dish(Y).
menu(not_so_hungry,nothing,Y,Z):- main_dish(Y), desert(Z).
menu(on_diet,X,nothing,nothing):- starter(X).

/**
* Output:
* ?- menu(on_diet,H,B,D).
* H = "green salad",
* B = D, D = nothing ;
* H = melon,
* B = D, D = nothing ;
* H = "tomato salad",
* B = D, D = nothing ;
* H = "rabbit pate",
* B = D, D = nothing.
*/
