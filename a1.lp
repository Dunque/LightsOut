%Domain description
cell(1..5,1..5).
action(tog(X,Y)) :- cell(X,Y).

#program initial.
h(cell(1,1),off).
h(cell(1,2),off).
h(cell(1,3),off).
h(cell(1,4),off).
h(cell(1,5),on).
h(cell(2,1),on).
h(cell(2,2),on).
h(cell(2,3),on).
h(cell(2,4),on).
h(cell(2,5),on).
h(cell(3,1),off).
h(cell(3,2),off).
h(cell(3,3),off).
h(cell(3,4),on).
h(cell(3,5),off).
h(cell(4,1),off).
h(cell(4,2),on).
h(cell(4,3),on).
h(cell(4,4),on).
h(cell(4,5),off).
h(cell(5,1),off).
h(cell(5,2),on).
h(cell(5,3),off).
h(cell(5,4),off).
h(cell(5,5),on).

#program final.
goal :- h(cell(X,Y),off), cell(X,Y).
:- not goal.
#show o/1.