neigbor(cell(X1,Y1),cell(X2,Y2)) :- |X1-X2|=1, |Y1-Y2|=0.
neigbor(cell(X1,Y1),cell(X2,Y2)) :- |X1-X2|=0, |Y1-Y2|=1.

#program dynamic
h(cell(X,Y),on) :- 'h(cell(X,Y),off), o(tog(X,Y)).
h(cell(X,Y),off) :- 'h(cell(X,Y),on), o(tog(X,Y)).


o(tog(X,Y)).


h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

1{o(A): _action(A)}1.

#program final.
goal :- h(cell(X,Y),off), cell(X,Y).
:- not goal.
#show o/1.
