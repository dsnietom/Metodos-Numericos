function mincuadrados(x,y)
%x=[-3 0 2 4];
%y=[3 1 1 3];

N=length(x);%El valor de N es la cantidad de elementos de los vectores

vecX=x(1):0.5:x(N);
X=x;
Y=y;

%Construye vectores con ceros de tamaño N+1
x2=zeros(1,N+1);
x3=zeros(1,N+1);
x4=zeros(1,N+1);
xy=zeros(1,N+1);
x2y=zeros(1,N+1);

%Calcula los valores x^2, x^3, x^4, x*y, x^2*y y los almacena en el vector
%correspondiente
for i=1:N
    x2(i)=x(i)^2;
    x3(i)=x(i)^3;
    x4(i)=x(i)^4;
    xy(i)=x(i)*y(i);
    x2y(i)=x2(i)*y(i);
end

%Agrega un valor adicional a los vectores x y donde se almacenara la
%sumatoria
x=[x 0];
y=[y 0];

%Calcula la sumatoria de todos los valores
for i=1:N
    x(N+1)=x(N+1)+x(i);
    y(N+1)=y(N+1)+y(i);
    x2(N+1)=x2(N+1)+x2(i);
    x3(N+1)=x3(N+1)+x3(i);
    x4(N+1)=x4(N+1)+x4(i);
    xy(N+1)=xy(N+1)+xy(i);
    x2y(N+1)=x2y(N+1)+x2y(i);
end

%Contruye una tabla con cada una uno de los vectores
%Cada vector es una columna y la ultima fila es la sumatoria de cada col
tabla=table(x',y',x2',x3',x4',xy',x2y');
tabla.Properties.VariableNames = {'x','y','x2','x3','x4','xy','x2y'};%Se agrega el encabezado de cada columna de la tabla

%Se imprimen los resultados
fprintf("\nRESULTADOS \n\n");
disp(tabla);%Imprime la tabla

%Contruye el sistema de ecuaciones
fprintf("Sistema de Ecuaciones\n");
fprintf('%gA + %gB + %gC = %g\n',x4(N+1),x3(N+1),x2(N+1),x2y(N+1));
fprintf('%gA + %gB + %gC = %g\n',x3(N+1),x2(N+1),x(N+1),xy(N+1));
fprintf('%gA + %gB + %gC = %g\n',x2(N+1),x(N+1),N,y(N+1));

%Resuelve el sistema de ecuaciones
A=[x4(N+1) x3(N+1) x2(N+1); x3(N+1) x2(N+1) x(N+1);x2(N+1) x(N+1) N];
b=[x2y(N+1);xy(N+1);y(N+1)];
y=A\b;

%Imprime los valores de las incognitas
fprintf("\nSe resuelve el Sistema de Ecuaciones:\n");
fprintf('A = %g\n',y(1));
fprintf('B = %g\n',y(2));
fprintf('C = %g\n',y(3));

%Contruye el polinomio
fprintf('\ny = %gx^2 + %gx + %g\n',y(1),y(2),y(3));

%Construye una cadena con el polinomio
fx=strcat(mat2str(y(1)),'*x.^2+',mat2str(y(2)),'*x+',mat2str(y(3)));
f=inline(fx,'x');%Crea una funcion inline

%Construye una cadena con todos los puntos
P='';
for i=1:N
    P=strcat(P,"(",num2str(X(i)),",",num2str(Y(i)),") ");
end

%Grafica la funcion y la aproximacion
clf;
plot( vecX, f(vecX), '-b');%Grafica el polinomio construido
hold on
plot(X,Y,'-r')%Grafica los puntos
scatter(X,Y) 
hold off
%Propiedades adicionales de la grafica
title("Combinaciones Lineales en Mínimos Cuadrados"); xlabel('x'); ylabel('f(x)'); grid;
legend( strcat("y=", fx),strcat("Puntos: ", P) );

end