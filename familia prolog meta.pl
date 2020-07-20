

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



hermano(A,B):- es_padre(C,B), es_padre(C,A), A\==B.


padre(A,B):- es_padre(A,B).
hijo(A,B):- es_padre(B,A).
abuelo(A,B):- es_padre(A,C), es_padre(C,B).
nieto(A,B):- hijo(B,C),hijo(C,A).
tio(A,B):- hermano(A,C), es_padre(C,B).
sobrino(A,B):- hermano(B,C), hijo(A,C).
primo(A,B):- es_padre(C,B), es_padre(D,A), hermano(C,D).
familiar(A,B):-
    padre(A,B);
    hijo(A,B);
    abuelo(A,B);
    nieto(A,B);
    tio(A,B);
    sobrino(A,B);
    primo(A,B).
familiares(A,L):-findall(B,familiar(A,B),L).
casado(A,B):- es_padre(A,C),es_padre(B,C).
feliz(A) :- es_casado(A,B).


