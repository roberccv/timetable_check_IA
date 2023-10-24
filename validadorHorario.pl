

comprobacionFinal:-
	horario(ListaDias1),
	comprobacionFinal(ListaDias1),
	H is 3.

comprobacionFinal([Dias1| Resto1], H):-
	comprobarAula(Dias1),
	H is H+1,
	write(H),
	comprobacionFinal(Resto1, H).

comprobacionFinal([]).

sumaHorasAsignatura(Asignatura, Horas) :-
	asignatura(Asignatura),
	horario(ListaDias),
	sumaHorasAsignatura(Asignatura, ListaDias, Horas).

sumaHorasAsignatura(_Asignatura, [], 0).
sumaHorasAsignatura(Asignatura, [Dia | Resto], Horas) :-
	seImparteAsignaturaEnDia(Asignatura, Dia),
	sumaHorasAsignatura(Asignatura, Resto, HorasResto),
	Horas is HorasResto + 1.

sumaHorasAsignatura(Asignatura, [Dia | Resto], Horas) :-
	\+ seImparteAsignaturaEnDia(Asignatura, Dia),
	sumaHorasAsignatura(Asignatura, Resto, Horas).

seImparteAsignaturaEnDia(Asignatura, lunes(L)) :- member(Asignatura, L). 
seImparteAsignaturaEnDia(Asignatura, martes(L)) :- member(Asignatura, L). 
seImparteAsignaturaEnDia(Asignatura, miercoles(L)) :- member(Asignatura, L). 

comprobarAula(lunes(ClasesLunes)):-
	ocuLunes(OcupadoLunes),
	comprobacion(ClasesLunes, OcupadoLunes).


comprobarAula(martes(ClasesMartes)):-
	ocuMartes(OcupadoMartes),
	comprobacion(ClasesMartes, OcupadoMartes).

comprobarAula(miercoles(ClasesMiercoles)):-
	ocuLunes(OcupadoMiercoles),
	imprimirLista(ClasesMiercoles),
	comprobacion(ClasesMiercoles, OcupadoMiercoles).

comprobacion([],[]).
comprobacion([Cabeza | Cola], [Z | Y]):-
	\+aulaA(Cabeza, Z),
	comprobacion(Cola, Y).

horario([lunes([a, b, c]),
		 martes([a, b, d]),
		 miercoles([b, c, d])]).

% Asignaturas Oblg
asignatura(a).
asignatura(b).
asignatura(c).
asignatura(d).
asignatura(o1).
asignatura(o2).
asignatura(o3).

% Asignaturas Obligatorias
asignaturaOb(a).
asignaturaOb(b).
asignaturaOb(c).
asignaturaOb(d).

% Horas por asignatura

horasAsignatura(a , 2).
horasAsignatura(b, 3).
horasAsignatura(c,2).
horasAsignatura(d,2).
%horasAsignatura(o1, 1).
%horasAsignatura(o2, 1).
%horasAsignatura(o3, 1).

% Aulas
aula(a1).
aula(a2).
aula(a3).
aula(a0).

% Clases por cada asignatura

aulaA(a, a2).
aulaA(b, a1).
aulaA(c, a3).
aulaA(d, a3).
%aulaA(o1, a0).
%aulaA(o2, a0).
%aulaA(o3, a0).


ocuLunes([a1, n, n]).
ocuMartes([n, a2, a2]).
ocuMiercoles([a3, a2, a1]).

