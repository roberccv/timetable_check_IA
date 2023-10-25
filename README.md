# Validador Horarios Académicos

  

  Esta aplicación sirve para validar Horarios académicos bajo las restricciones definidas en la base de conocimiento, como son, las clases libres a cada hora, las clases donde se imparte cada asignatura y la cantidad de horas que se le deben asignar a cada asignatura.

  

## Comenzando

  

__Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas.__

  

Lea el apartado ****Instalación**** para conocer como desplegar el proyecto.

  

  

### Pre-requisitos

  

__Para poder ejecutar todo sin riesgo de error debe tener instalado en su dispositivo un editor de textos con swi-prolog o la propia aplicación de swi-prolog.__

  

  

### Instalación

  

__1. Clonar este repositorio en su dispositivo para acceder al programa.__

  

```



```

__2. Para inicializar el programa abra dicha aplicación y escriba:__

 

```

 consult("ruta/del/archivo.pl").

```

  

## Funciones básicas

  

NOMBRE:

Validador de horarios 

  
DESCRIPCIÓN:

Valida horarios conforme los criterios en la base de conocimientos


MODO DE USO: 

```

comprobacionFinal([lunes([a,b,c]), martes([a,b,o1]), miercoles([b,c,d])]).
```


El comando superior se corresponde con un horario válido, las asignaturas pueden ser modificadas a gusto.
Las asignaturas existentes son las obligatorias (a,b,c y d)  y las optativas (o1, o2, o3). Importante destacar que el programa esta configurado para que solo pueda haber una asignatura de 
caracter optativo.

EJEMPLOS ERRONEOS:

```

comprobacionFinal([lunes([a,b,c]), martes([a,b,d]), miercoles([b,c,d])]). %(Exceso horas d).
comprobacionFinal([lunes([b,a,c]), martes([a,b,o1]), miercoles([b,c,d])]). %(Aula de B el lunes ocupada).
comprobacionFinal([lunes([a,b,c]), martes([a,b,o1]), miercoles([b,c,o2])]). %(Varias optativas y falta de horas asignatura d).

```


## Despliegue

  

_Este proyecto consta de un archivo .pl_ 

  

## Licencia

  

[Apache](https://www.apache.org/licenses/LICENSE-2.0)

  

![Licencia](https://licensebuttons.net/l/by/3.0/88x31.png "Licencia")

  

## Autor

**Roberto Cinos Vega** (roberto.cinosvega@usp.ceu.es)

