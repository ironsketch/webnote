/**
* Michelle Bergin
* Logic Programming
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

