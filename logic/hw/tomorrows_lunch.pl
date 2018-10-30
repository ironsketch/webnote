/**
* Michelle Bergin
* Logic Programming
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
