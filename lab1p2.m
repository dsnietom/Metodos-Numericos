disp('MÉTODO DE NEWTON-RAPHSON');
disp('A continuación el programa le solicitara ingresar una función continua para calcular el cero de la función f(x).');
disp(' ');

consola='Ingrese la funcion f(x) completa (La variable debe ser "x" Ejemplo "1980*(1-exp(-x/10))-98*x"): ';
fun= input(consola,'s');%Solicita ingresar la función

f=inline(fun);%Construye la función a partir de la expresión de entrada fun
syms x;%Se define una variable simbólica. Para este programa debe ser x
dfun=diff(str2sym(fun));%Se calcula la derivada de la función
p0=0;%Inicializar p0 desde el valor que se empezará a probar

%Halla el valor inicial de p0 (proceso de ensayo y error)
while f(p0)>=0
    p0=p0+1;
end

raphson(p0-1,fun,dfun);%Se llama a la función Raphson que recibe como parámetro el valor inicial p0, la función y su derivada
