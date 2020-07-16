es_padre(juan, maria).
es_padre(pedro, muriel).
es_padre(ana, maria).
es_padre(jose, juan).
es_padre(jose, pedro).
es_padre(pedro, karen).
es_padre(valentina,muriel).
es_padre(valentina,karen).
es_padre(carmen,juan).
es_padre(ruth,pedro).

es_hermano(A,B):- es_padre(C,B), es_padre(C,A), A\==B.
es_hijo(A,B):- es_padre(B,A).
es_primo(A,B):- es_padre(C,B), es_padre(D,A), es_hermano(C,D).
es_abuelo(A,B):- es_padre(A,C), es_padre(C,B).
es_tio(A,B):- es_hermano(A,C), es_padre(C,B).
es_casado(A,B):- es_padre(A,C), es_padre(B,C).
es_feliz(A) :- es_casado(A,B).

es_familiar(A,B):-
    es_padre(B,A);
    es_abuelo(B,A);
    es_primo(B,A);
    es_hermano(B,A);
    es_tio(B,A);
    es_casado(B,A).

familia(A,L):-findall(B,es_familiar(B,A),L).


