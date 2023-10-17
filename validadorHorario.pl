






% Asignaturas
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

HorasAsignatura(a , 2).
HorasAsignatura(b, 3).
HorasAsignatura(c,2).
HorasAsignatura(d,1).
HorasAsignatura(o1, 1).
HorasAsignatura(o2, 1).
HorasAsignatura(o3, 1).

% Aulas
Aula(A1).
Aula(A2).
Aula(A3).
Aula(A0).

% Clases por cada asignatura

AulaA(a, A2).
AulaA(b, A1).
AulaA(c, A3).
AulaA(d, A3).
AulaA(o1, A0).
AulaA(o2, A0).
AulaA(o3, A0).

% Aulas ocupadas

lunes(A1, n, n).
martes(n, A2, A2).
miercoles(A3, A2, A1).



