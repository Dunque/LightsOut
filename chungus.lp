#program initial.
cell(1..n,1..n).
action(tog(X,Y)) :- cell(X,Y).

neigbor(X1,Y1,X2,Y2) :- |X1-X2|=1, |Y1-Y2|=0, cell(X1,Y1), cell(X2,Y2).
neigbor(X1,Y1,X2,Y2) :- |X1-X2|=0, |Y1-Y2|=1, cell(X1,Y1), cell(X2,Y2).

#program dynamic.
1{o(A): _action(A)}1.

h(cell(X,Y),on) :- 'h(cell(X,Y),off), o(tog(X,Y)).
h(cell(X,Y),off) :- 'h(cell(X,Y),on), o(tog(X,Y)).
h(cell(X-1,Y),on) :- 'h(cell(X-1,Y),off), o(tog(X,Y)).
h(cell(X-1,Y),off) :- 'h(cell(X-1,Y),on), o(tog(X,Y)).
h(cell(X+1,Y),on) :- 'h(cell(X+1,Y),off), o(tog(X,Y)).
h(cell(X+1,Y),off) :- 'h(cell(X+1,Y),on), o(tog(X,Y)).
h(cell(X,Y-1),on) :- 'h(cell(X,Y-1),off), o(tog(X,Y)).
h(cell(X,Y-1),off) :- 'h(cell(X,Y-1),on), o(tog(X,Y)).
h(cell(X,Y+1),on) :- 'h(cell(X,Y+1),off), o(tog(X,Y)).
h(cell(X,Y+1),off) :- 'h(cell(X,Y+1),on), o(tog(X,Y)).

%Estas dos no funcionan. Arreglar y borrar las 8 anteriores
%h(cell(X2,Y2),on) :- 'h(cell(X2,Y2),off), neighbor(X1,Y1,X2,Y2), cell(X2,Y2), o(tog(X1,Y1)).
%h(cell(X2,Y2),off) :- 'h(cell(X2,Y2),on), neighbor(X1,Y1,X2,Y2), cell(X2,Y2), o(tog(X1,Y1)).

h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

#program final.
:- h(cell(X,Y),on).
#show o/1.
