%Ejercicio Programacion No Lineal transporte de mercancia

linf=[];    %Limite inferior variables
lsup=[];    %Limite superior variables
A=[];               %Matriz de desigualdades
b=[];
Aeq=[];             %Matriz de equivalencias
beq=[];
P0=[0 0 0];         %Punto inicial de cada planta
[Potencia,Costo]=fmincon(@funobj2,P0,A,b,Aeq,beq,linf,lsup,@res2)