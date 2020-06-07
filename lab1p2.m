disp('M�TODO DE NEWTON-RAPHSON');
disp('A continuaci�n el programa le solicitara ingresar una funci�n continua para calcular el cero de la funci�n f(x).');
disp(' ');

consola='Ingrese la funcion f(x) completa (La variable debe ser "x" Ejemplo "1980*(1-exp(-x/10))-98*x"): ';
fun= input(consola,'s');%Solicita ingresar la funci�n

f=inline(fun);%Construye la funci�n a partir de la expresi�n de entrada fun
syms x;%Se define una variable simb�lica. Para este programa debe ser x
dfun=diff(str2sym(fun));%Se calcula la derivada de la funci�n
p0=0;%Inicializar p0 desde el valor que se empezar� a probar

%Halla el valor inicial de p0 (proceso de ensayo y error)
while f(p0)>=0
    p0=p0+1;
end

raphson(p0-1,fun,dfun);%Se llama a la funci�n Raphson que recibe como par�metro el valor inicial p0, la funci�n y su derivada
