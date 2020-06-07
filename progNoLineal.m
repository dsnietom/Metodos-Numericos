%Ejercicio Programacion No Lineal transporte de mercancia

linf=[10 10 10];    %Limite inferior variables
lsup=[85 80 70];    %Limite superior variables
A=[];               %Matriz de desigualdades
b=[];
Aeq=[];             %Matriz de equivalencias
beq=[];
X0=[15 15 15];         %Punto inicial de cada planta
[Toneladas,Costo]=fmincon(@funobj,X0,A,b,Aeq,beq,linf,lsup,@res)