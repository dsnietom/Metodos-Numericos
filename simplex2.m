%**METODO SIMPLEX**
 
%**Para cambiar a metodo simplex de tres dimensiones es necesario agregar
%las terceras variables a cada matriz respectivamente
 
A=[-4 -5 -7 1]; %Se define A como funcion objetivo
 
B=[ 1 1 2 -1 ;     %Se define B como restricciones
    2 -6 3 1;
    -2 4 2 2];
 
C=[ 1;        %Se define C como recursos
    -3;
    -5];
 
In=size(B,1); %Se guarda en In el número de restricciones
Xsol=[B eye(In) C     %Xsol será nuestra matriz con los datos ordenados
    A zeros(1,In) 0]
 
    fin=Xsol(end,1:end-1)<0;
    if fin==0
        %break
    end
    [a,c]=min(Xsol(end,:));    %Columna pivote
    Variable_Entrada1= Xsol(:,c) %Variable de entrada
    Variable_Salida1=Xsol(c,:) %Variable de salida
    Xre= Xsol(:,end)./ Xsol(:,c); %Divide los recursos en la columna pivote    
    i=Xre<=0; %Encuentra negativos o ceros en los recursos
    d=Xre;    %Guarda los recursos en d
    d(i)=inf; %Donde es cero o negativo pone un infinito
    [b,f]=min(d);  %Encuentra en la columna pivote el positivo menor
    Xsol(f,1:end)=Xsol(f,1:end)/Xsol(f,c);   %Divide la fila pivote en el elemento pivote
    for i=1:1:size(Xsol,1)  %Hace el gauss
        if i~=f   %No realiza el gauss en la fila pivote
            Xsol(i,:)=Xsol(i,:)-(Xsol(i,c)*Xsol(f,:)); %nueva_ecua = anterior_ecua - (coef_columna enterante) x (nueva_ecuac_pivote)
        end
    end
 
 
Tabla_Iteracion1=Xsol %Iteracion 1
 
fin=Tabla_Iteracion1(end,1:end-1)<0;
    if fin==0
        %break
    end
    [a,c]=min(Tabla_Iteracion1(end,:));    %Columna pivote
    Variable_Entrada2= Xsol(:,c) %Variable de entrada
    Variable_Salida2=Xsol(c,:) %Variable de salida
    Xre= Tabla_Iteracion1(:,end)./ Tabla_Iteracion1(:,c);   %Divide los recursos en la columna pivote
    i=Xre<=0; %Encuentra negativos o ceros en los recursos
    d=Xre;    %Guarda los recursos en d
    d(i)=inf; %Donde es cero o negativo pone un infinito
    [b,f]=min(d);  %Encuentra en la columna pivote el positivo menor
    Tabla_Iteracion1(f,1:end)=Tabla_Iteracion1(f,1:end)/Tabla_Iteracion1(f,c);   %Divide la fila pivote en el elemento pivote
    for i=1:1:size(Tabla_Iteracion1,1)  %Hace el gauss
        if i~=f   %No realiza el gauss en la fila pivote
            Tabla_Iteracion1(i,:)=Tabla_Iteracion1(i,:)-(Tabla_Iteracion1(i,c)*Tabla_Iteracion1(f,:)); %nueva_ecua = anterior_ecua - (coef_columna enterante) x (nueva_ecuac_pivote)
        end
    end
 
Tabla_Iteracion2=Tabla_Iteracion1  %Tabla de iteracion 2