#program initial.
cell(1..n,1..n).
action(tog(X,Y)) :- cell(X,Y).
neighbor(X1,Y1,X2,Y2) :- |X1-X2|+|Y1-Y2|=1, cell(X1,Y1), cell(X2,Y2).

near(X1,Y1,X2,Y2) :- |X1-X2|+|Y1-Y2|<3, cell(X1,Y1), cell(X2,Y2).

#program dynamic.
{o(A): _action(A)}.

:- o(tog(X1,Y1)), o(tog(X1,Y1+1)).
:- o(tog(X1,Y1)), o(tog(X1,Y1+2)).
:- o(tog(X1,Y1)), o(tog(X1+1,Y1)).
:- o(tog(X1,Y1)), o(tog(X1+2,Y1)).
:- o(tog(X1,Y1)), o(tog(X1,Y1-1)).
:- o(tog(X1,Y1)), o(tog(X1,Y1-2)).
:- o(tog(X1,Y1)), o(tog(X1-1,Y1)).
:- o(tog(X1,Y1)), o(tog(X1-2,Y1)).
:- o(tog(X1,Y1)), o(tog(X1+1,Y1+1)).
:- o(tog(X1,Y1)), o(tog(X1-1,Y1-1)).
:- o(tog(X1,Y1)), o(tog(X1+1,Y1-1)).
:- o(tog(X1,Y1)), o(tog(X1-1,Y1+1)).
%:- 'o(tog(X1,Y1)), _near(X1,Y1,X2,Y2), o(tog(X2,Y2)), cell(X1,Y1), cell(X2,Y2).
h(cell(X,Y),on) :- 'h(cell(X,Y),off), o(tog(X,Y)).
h(cell(X,Y),off) :- 'h(cell(X,Y),on), o(tog(X,Y)).
h(cell(X2,Y2),on) :- 'h(cell(X2,Y2),off), _neighbor(X1,Y1,X2,Y2), o(tog(X1,Y1)).
h(cell(X2,Y2),off) :- 'h(cell(X2,Y2),on), _neighbor(X1,Y1,X2,Y2), o(tog(X1,Y1)).

touch(X,Y) :- o(tog(X,Y)).
touch(X,Y) :- 'touch(X,Y). 
:- o(tog(X,Y)), 'touch(X,Y).

h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

touched(S) :- #sum{1,X,Y : touch(X,Y)}=S.


#program final.
:- h(cell(X,Y),on).
#show o/1.
#minimize{1,X,Y : touch(X,Y)}.
