clc;
fprintf('METODO DE RUNGE-KUTTA ORDEN 4 (RK4)\n');
fprintf('A continuación el programa solicitara ingresar la funcion, el intervalo y el valor inicial para y.\n');


f=input("Ingrese la funcion y'(t): \n",'s');
a=input('\nIngrese el limite inferior del intervalo: \n');
b=input('\nIngrese el limite superior del intervalo: \n');
y=input('\nIngrese el valor de "y0": \n');

%Lamado de la funcion RK4
rungek4(f,a,b,y);