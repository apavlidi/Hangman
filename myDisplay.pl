%pairnei_tin_sosti_leksi_kai_epistrefi_to_proto_kai_to_teleutaio_kai_to
%string_tis_kremalas
%private
myDisplay([H|T],CounterSize,Length,[H|NewWord],RemainWords):-
	CounterSize =< 0,
	write(H),
	NewCounterSize is CounterSize+1,
	myDisplay(T,NewCounterSize,Length,NewWord,RemainWords).
%private 
myDisplay([H|T],CounterSize,Length,[H|NewWord],RemainWords):-
	Last is Length-1,
        CounterSize >= Last,
        write(H),
	NewCounterSize is CounterSize+1,
        myDisplay(T,NewCounterSize,Length,NewWord,RemainWords).	
%private 
myDisplay([H|T],CounterSize,Length,['_'|NewWord],[H|RemainWords]):-
        write(' _ '),
	NewCounterSize is CounterSize+1,        
	myDisplay(T,NewCounterSize,Length,NewWord,RemainWords).

%private 
myDisplay([],_,Length,[],[]).
