% File: switches.lp (domain description)
switch(1..3).
action(tog(X)) :- switch(X).

#program dynamic.
% Effect axioms
  h(sw(X),up)   :- 'h(sw(X),down), o(tog(X)).
  h(sw(X),down) :- 'h(sw(X),up),   o(tog(X)).
  h(light,off)  :- 'h(light,on),   o(tog(_)).
  h(light,on)   :- 'h(light,off),  o(tog(_)).
% Executability constraints: none in this case
% Inertia: c(F,V)=value V has changed
  h(F,V) :- 'h(F,V), not c(F).
  c(F)   :- 'h(F,V), h(F,W), V!=W.  

% Action generation
  1 { o(A): _action(A) } 1.
