function diferenciasfin(P,Q,R,a,b,alpha,beta,h)

syms t

p=inline(P);
q=inline(Q);
r=inline(R);
fun='1.25+0.4860896526*t-2.25*t^2+2*t*atan(t)+(1/2)*((t^2)-1)*log(1+t^2)';
f=inline('1.25+0.4860896526*t-2.25*t^2+2*t*atan(t)+(1/2)*((t^2)-1)*log(1+t^2)');

N=(b-a)/h;
T=zeros(1,N+1);
X=zeros(1,N-1);
Va=zeros(1,N-2);
Vb=zeros(1,N-1);
Vc=zeros(1,N-2);
Vd=zeros(1,N-1);
%h=(b-a)/N;


%Se calcula el vector de los términos independientes B en AX=B
for j=1:N-1
  Vt(j) = a + h*j;
end

for j=1:N-1
  Vb(j) = -h^2*r(Vt(j));
end

% Con las siguientes expresiones se evaluan de manera particular los limites del intervalo
Vb(1)   = Vb(1)   + (1 + h/2*p(Vt(1)))*alpha;
Vb(N-1) = Vb(N-1) + (1 - h/2*p(Vt(N-1)))*beta;

% Se evalua de manera primaria la diagonal principal de A en AX=B
for j=1:N-1
  Vd(j) = 2 + h^2*q(Vt(j));
end

% Se procede a calcular la superdiagonal de A en AX=B
for j=1:N-2
  Va(j) = -1 - h/2*p(Vt(j+1));
end

% Ahora se calcula la subdiagonal de A en AX=B
for j=1:N-2
  Vc(j) = -1 + h/2*p(Vt(j));
end

% Finalmente se obtiene la solución de AX=B
% De la aplicacion sucesiva del metodo, 
% se obtiene el sistema de ecuaciones expresado en una matiz tridiagonal
M=length(Vb);
for k=2:M
    mult=Va(k-1)/Vd(k-1);
    Vd(k)=Vd(k)-mult*Vc(k-1);
    Vb(k)=Vb(k)-mult*Vb(k-1);
end



X(M)=Vb(M)/Vd(M);
for k=M-1:-1:1
    X(k)=(Vb(k)-Vc(k)*X(k+1))/Vd(k);
end

T = [a,Vt,b];
X = [alpha,X,beta];
F=[T' X'];

%Calcular el error
[m,n]=size(F);
E=zeros(1,m);
S=zeros(1,m);


for i=1:m 
  E(i) = abs(f(F(i,1))-F(i,2));
  S(i)=f(F(i,1));
end

F=[F S' E'];

%Construccion de la tabla que se va a mostrar
TABLA=table(T',X',S',E');
TABLA.Properties.VariableNames = {'Tj','Xj','Exacta','Error'};%Se agrega el encabezado de cada columna de la tabla
fprintf("\nRESULTADOS \n\n");
disp(TABLA);%Se imprime la tabla en pantalla

%Construye las graficas
clf;%Borra las graficas
subplot(211),plot(T,X, '-b'),title(strcat("Diferencias Finitas con h = ",num2str(h))), xlabel('t'), ylabel('y'), legend(strcat(P,"+",Q,"+",R)), grid;
subplot(212),plot(T,S, '-r'),title("Solucion Exacta"), xlabel('t'), ylabel('y'), legend(fun), grid;


end