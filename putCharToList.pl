
findPos([],Char,_,[]).

findPos([H|T],H,Counter,[Counter|ListPos]):-
        NewCounter is Counter+1,
        findPos(T,H,NewCounter,ListPos).
	

findPos([H|T],Char,Counter,ListPos):-
	NewCounter is Counter+1,
	findPos(T,Char,NewCounter,ListPos).
	
putPos(L,[],Char,_,L).
	
putPos([H|T],[Counter|T2],Char,Counter,[Char|NewList]):-
	NewCounter is Counter+1,
	putPos(T,T2,Char,NewCounter,NewList).

putPos([H|T],[X|T2],Char,Counter,[H|NewList]):-
        NewCounter is Counter+1,
	putPos(T,[X|T2],Char,NewCounter,NewList).
