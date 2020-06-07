function disparo(F1,F2,a,b,alpha,beta,h)

fun='1.25+0.4860896526*t-2.25*t^2+2*t*atan(t)+(1/2)*((t^2)-1)*log(1+t^2)';
f=inline('1.25+0.4860896526*t-2.25*t^2+2*t*atan(t)+(1/2)*((t^2)-1)*log(1+t^2)');

M=(b-a)/h;

Za=[alpha,0];
[T,Z]=rks4(F1,a,b,Za,M);
U=Z(:,1)

Za=[0,1];
[T,Z]=rks4(F2,a,b,Za,M);
V=Z(:,1)

X=U+(beta-U(M+1))*V/V(M+1);
L=[T' X];

%Calcular el error
[m,n]=size(L);
E=zeros(1,m);
S=zeros(1,m);

for i=1:m 
  E(i) = abs(f(L(i,1))-L(i,2));
  S(i)=f(L(i,1));
end

L=[L S' E'];

%Construccion de la tabla que se va a mostrar
TABLA=table(T',X,S',E');
TABLA.Properties.VariableNames = {'Tj','Xj','Exacta','Error'};%Se agrega el encabezado de cada columna de la tabla
fprintf("\nRESULTADOS \n\n");
disp(TABLA);%Se imprime la tabla en pantalla


%Construye las graficas
clf;%Borra las graficas
subplot(211),plot(T,X', '-b'),title(strcat("Diferencias Finitas con h = ",num2str(h))), xlabel('t'), ylabel('y'), legend(F1), grid;
subplot(212),plot(T,S, '-r'),title("Solucion Exacta"), xlabel('t'), ylabel('y'), legend(fun), grid;


end