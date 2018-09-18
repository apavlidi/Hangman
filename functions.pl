
delall(X,L,L):-
	not(member(X,L)).

delall(X,L,NL):-
	del(X,L,NL1),
	delall(X,NL1,NL).


del(X,[X|T],T).

del(X,[H|T],[H|NL1]):-
	del(X,T,NL1).	
