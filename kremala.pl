%elegxi_an_i_leksi_einai_megaliteri_apo_5_proeretiko
testWord([H|T]):-
	length([H|T],Length),
	Length>5.

testWord([H|T]):-
	length([H|T],Length),
	Length<5,
	write('Dose mia leksi me megethos megalitero to 5\n'),
	run.

%main 
run:-
	write('Doste tin leksi\n'),
	read(Word),
	atom_chars(Word,WordList), %mou_kanei_to_string_se_lista
	testWord(WordList),
	startGame(WordList,6).


%methodos_gia_na_emfanisti_ston_pekti_i_leksi 
displayWord([H|T],NewWord,RemainWords):-
	length([H|T],Length),
	myDisplay([H|T],0,Length,NewWord,RemainWords),nl. %pata_enter_meta_tin_leksi



%myDisplay
%pairnei_tin_sosti_leksi_kai_epistrefi_to_proto_kai_to_teleutaio_kai_to
%string_tis_kremalas
:- consult('myDisplay.pl').


startGame(CW,Lifes):-
	%%
	write('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),
	%%
	write('\t WELCOME TO MY GAME \n\n'),
	write('H leksi einai: \n'),
	displayWord(CW,NewWord,RemainWords), %dose_sosti_kai_pare_proto_teleutaio_gramma
	write('Oi prospatheies einai : '),
	write(Lifes),nl,
	write('Ta xrisimopoioumena grammata einai: '),
	write([]),nl,
%DEBUG %write('Apeminan: '),
%DEBUG	%write(RemainWords),nl,
	play(CW,NewWord,Lifes,[],RemainWords). %perna_sosti_trexousa_zoes_xrisimopoioumena_grammata 

play(CW,CurrentWord,Lifes,UsedWords,RemainWords):-
	guess(CW,CurrentWord,Lifes,UsedWords,RemainWords).

guess(CW,CurrentWord,Lifes,UsedWords,RemainWords):-
	Lifes>0,
	write('\nCurrent Word --> '),
	write(CurrentWord),nl,
	write('Words Used --> '),
	write(UsedWords),nl,
	write('Lifes remain --> '),
	write(Lifes),nl,
%DEBUG	%write('DEBUGG--> '),
%DEBUG	%write(RemainWords),
	write('Doste ena char'),
        read(Char),
	checkChar(CW,CurrentWord,Lifes,UsedWords,Char,RemainWords).

guess(CW,CurrentWord,Lifes,UsedWords,RemainWords):-
    Lifes<1,
	write('To paixnidi teliose,xasate'). 

checkChar(CW,CurrentWord,Lifes,UsedWords,Char,RemainWords):-
	member(Char,UsedWords),
	write('Iparxei sta xrisimopoioumena chars,try again \n'),
	guess(CW,CurrentWord,Lifes,UsedWords,RemainWords).

checkChar(CW,CurrentWord,Lifes,UsedWords,Char,RemainWords):-
        not(member(Char,RemainWords)),
        write('Kanate lathos!!\n'),
	LifesUpdated is Lifes-1,
	write('H zoes sas einai pleon: '),
	write(LifesUpdated),nl,
	append(UsedWords,[Char],UpdatedUsedWords),
	guess(CW,CurrentWord,LifesUpdated,UpdatedUsedWords,RemainWords).

checkChar(CW,CurrentWord,Lifes,UsedWords,Char,RemainWords):-
	member(Char,RemainWords),
	findPos(CW,Char,0,ListPos),
	putPos(CurrentWord,ListPos,Char,0,UpdatedCurrentWord),
	append(UsedWords,[Char],UpdatedUsedWords),
	delall(Char,RemainWords,UpdatedRemainWords),
	not(checkIfWin(UpdatedRemainWords)),
	guess(CW,UpdatedCurrentWord,Lifes,UpdatedUsedWords,UpdatedRemainWords).	

checkChar(CW,CurrentWord,Lifes,UsedWords,Char,RemainWords):-
	member(Char,RemainWords),
	findPos(CW,Char,0,ListPos), %vriski_tis_thesis_gia_to_gramma
    putPos(CurrentWord,ListPos,Char,0,UpdatedCurrentWord), %vazi_stis_thesis_pou_vrike_to_gramma
    append(UsedWords,[Char],UpdatedUsedWords),
	delall(Char,RemainWords,UpdatedRemainWords),
	checkIfWin(UpdatedRemainWords).        


checkIfWin([]):-
	write('Nikisate!!!').

%ERG_5___________
%methodoi_gia_diagrafi_grammaton_apo_lista

:- consult('erg5.pl').

%________________ 
%methodoi_gia_topo8etisi_grammaton_se_lista

:- consult('putCharToList.pl').