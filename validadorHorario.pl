
% Copyright (C) 2023
 
% Validador Horario

% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at

%      http://www.apache.org/licenses/LICENSE-2.0

% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

 %@Author Roberto Cinos Vega
 %@version 1 25/10/23


comprobacionFinal(M):-
	comprobacionTodasLasAulas(M),
	sumaHorasAsignatura(a, M, Horasa),
	horasAsignatura(a, Horasa),
	sumaHorasAsignatura(b,M, Horasb),
	horasAsignatura(b, Horasb),
	sumaHorasAsignatura(c, M, Horasc),
	horasAsignatura(c, Horasc),
	sumaHorasAsignatura(d, M, Horasd),
	horasAsignatura(d, Horasd),
	optativa(M).

optativa(M):-
	(sumaHorasAsignatura(o1, M , Horas1), horasAsignatura(o1, Horas1));
	(sumaHorasAsignatura(o2, M , Horas2), horasAsignatura(o2, Horas2));
	(sumaHorasAsignatura(o3, M , Horas3), horasAsignatura(o3, Horas3)).

comprobacionTodasLasAulas(horario(ListaDias1)):-
	comprobacionTodasLasAulas(ListaDias1).

comprobacionTodasLasAulas([Dias1| Resto1]):-
	comprobarAula(Dias1),
	comprobacionTodasLasAulas(Resto1).

comprobacionTodasLasAulas([]).

sumaHorasAsignatura(Asignatura, horario(ListaDias), Horas) :-
	asignatura(Asignatura),
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
	ocuMiercoles(OcupadoMiercoles),
	comprobacion(ClasesMiercoles, OcupadoMiercoles).

comprobacion([],[]).
comprobacion([Cabeza | Cola], [Z | Y]):-
	\+aulaA(Cabeza, Z),
	comprobacion(Cola, Y).

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
horasAsignatura(d,1).
horasAsignatura(o1, 1).
horasAsignatura(o2, 1).
horasAsignatura(o3, 1).

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
aulaA(o1, a0).
aulaA(o2, a0).
aulaA(o3, a0).


ocuLunes([a1, n, n]).
ocuMartes([n, a2, a2]).
ocuMiercoles([a3, a2, a1]).

