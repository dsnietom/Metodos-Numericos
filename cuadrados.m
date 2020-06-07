function cuadrados(xk,yk,f_xk)

%xk=[-4 -2 0 2 4];
%yk=[1.2 2.8 6.2 7.8 13.2];
%f_xk=[0.44 3.34 6.24 9.14 12.04];


N=length(xk);%El valor de N es la cantidad de elementos de los vectores

%Calcula x*y x^2
xy=zeros(1,N);
x2=zeros(1,N);
for i=1:N
    xy(i)=xk(i)*yk(i);
    x2(i)=xk(i)^2;
end

%Calcula todas las sumatorias
sumaX=0;
sumaY=0;
sumaXY=0;
sumaX2=0;
for i=1:N
    sumaX=sumaX+xk(i);
    sumaY=sumaY+yk(i);
    sumaXY=sumaXY+xy(i);
    sumaX2=sumaX2+x2(i);
end


%Calcula el error cuadratico medio
eCuadratico= 0;
for i=1:N
    eCuadratico=eCuadratico+(abs(f_xk(i)-yk(i)))^2;
end
eCuadratico= ((1/N)*eCuadratico)^(1/2);


%Imprime los resultados
fprintf("\nRESULTADOS \n\n");
fprintf('%gA + %gB = %g\n',sumaX2,sumaX,sumaXY);
fprintf('%gA + %gB = %g\n',sumaX,N,sumaY);

%Resuelve el sistema de ecuaciones
A=[sumaX2 sumaX; sumaX N];
b=[sumaXY;sumaY];
y=A\b;

fprintf("\nSe resuelve el sistema de ecuaciones:\n");
fprintf('m = %g\n',y(1));
fprintf('b = %g\n',y(2));

fprintf('\ny = %gx + %g\n',y(1),y(2));
fprintf('E2(f) = %g\n\n',eCuadratico);

%Construye una cadena con el polinomio
fx=strcat(mat2str(y(1)),'*x+',mat2str(y(2)));
f=inline(fx,'x');%Crea una funcion inline

clf;
vecX=-4:0.1:4;
plot( vecX, f(vecX), '-b');%Grafica el polinomio construido
title("Mínimos Cuadrados"); xlabel('x'); ylabel('f(x)'); grid;
legend( strcat("y=", fx));

end