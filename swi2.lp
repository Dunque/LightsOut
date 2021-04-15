% File: switches-predict.lp (instance of prediction problem)

#program initial.
h(light,off).
h(sw(X),up) :- switch(X).

% Sequence of performed actions
&tel{
    &true
 ;> o(tog(3))
 ;> o(tog(1))
 ;> o(tog(2))
 ;> o(tog(2))
}.

#show h/2.
#show o/1.
