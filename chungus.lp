#program initial.
cell(1..n,1..n).
action(tog(X,Y)) :- cell(X,Y).

neigbor(X1,Y1,X2,Y2) :- |X1-X2|=1, |Y1-Y2|=0.
neigbor(X1,Y1,X2,Y2) :- |X1-X2|=0, |Y1-Y2|=1.

#program dynamic
1{o(A): _action(A)}1.

h(cell(X,Y),on) :- 'h(cell(X,Y),off), o(tog(X,Y)).
h(cell(X,Y),off) :- 'h(cell(X,Y),on), o(tog(X,Y)).
h(cell(X2,Y2),on) :- 'h(cell(X2,Y2),off), neighbor(X2,Y2), cell(X2,Y2), o(tog(X1,Y1))
h(cell(X2,Y2),off) :- 'h(cell(X2,Y2),on), neighbor(X2,Y2), cell(X2,Y2), o(tog(X1,Y1))

o(tog(X,Y)).

h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

#program final.
goal :- h(cell(X,Y),off), cell(X,Y).
:- not goal.
#show o/1.
