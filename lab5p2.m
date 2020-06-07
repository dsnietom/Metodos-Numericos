clc;
fprintf('INTEGRACION NUMERICA\n');
fprintf('A continuación el programa solicitara ingresar la funcion, el intervalo y la cantidad de nodos.\n');


f=input('Ingrese la funcion f(x) (Recuerde que la variable indepediente es "x"): \n','s');
ab=input('\nIngrese los limites de la integral como un vector, ejemplo "[a,b],[limInf,limSup]": \n');
M=input('\nIngrese el valor de "M": \n');

trapecio(ab(1),ab(2),M,f);
simpson(ab(1),ab(2),M,f);