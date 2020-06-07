function rungek4(fun,a,b,y0)
h=1/8;
cuadrante=224;%Posicion de la grafica
Tk=[a:h:b];%Valores de tk
[tcol, tfil]=size(Tk); 
tabla=zeros(1,tfil);
format short;
syms t y;
f=inline(fun,'t','y');

    clf;%Borra las graficas
    while (h<=1)
    T=[a:h:b]; %Vector con los valores de Tk
    [N,M]=size(T);
    M=M-1;
    Y=zeros(1,M+1); %Vector para guardar los valores de Yk
    
    Y(1)=y0; %Valor inicial de y

    %Algoritmo de RK4
    for i=1:M
        %parametros k para evaluar la funcion
        f1=f(T(i),Y(i));
        f2=f(T(i)+h/2,Y(i)+f1*h/2);
        f3=f(T(i)+h/2,Y(i)+f2*h/2);
        f4=f(T(i)+h,Y(i)+h*f3);
        Y(i+1)=Y(i)+h*(f1+2*f2+2*f3+f4)/6; %Sucesion de aproximacion
    end
       
    hcol=NaN(1,tfil); %Crea una matriz vector NaN de 25 posiciones
    %Se crea una matriz para crear una tabla con cada valor del vecto Y
    for j=1:tfil
        for k=1:M+1
            if Tk(j)==T(k)
                hcol(j)=Y(k);
            end
        end
    end
    
    tabla=[hcol;tabla]; %Concatena cada fila al final de la tabla

    %Construye las graficas
    if cuadrante==224
    subplot(cuadrante),plot(T,Y, '-m'),title("h = 1/8"), xlabel('Tk'), ylabel('Yk'), legend("RK4: y'=(t-y)/2"), grid;
    elseif cuadrante==223
        subplot(cuadrante),plot(T,Y, '-b'),title("h = 1/4"), xlabel('Tk'), ylabel('Yk'), legend("RK4: y'=(t-y)/2"), grid;
    elseif cuadrante==222
        subplot(cuadrante),plot(T,Y, '-g'),title("h = 1/2"), xlabel('Tk'), ylabel('Yk'), legend("RK4: y'=(t-y)/2"), grid;
    elseif cuadrante==221
        subplot(cuadrante),plot(T,Y, '-r'),title("h = 1"), xlabel('Tk'), ylabel('Yk'), legend("RK4: y'=(t-y)/2"), grid;
    end
    
    cuadrante=cuadrante-1;
    h=h*2;
     
    end
    %Construccion de la tabla que se va a mostrar
    tabla=tabla(1:4,1:tfil);
    tabla=[Tk;tabla];
    TABLA=table((tabla(1,1:tfil))',(tabla(2,1:tfil))',(tabla(3,1:tfil))',(tabla(4,1:tfil))',(tabla(5,1:tfil))');
    TABLA.Properties.VariableNames = {'Tk','h1','h1_2','h1_4','h1_8'};%Se agrega el encabezado de cada columna de la tabla
    fprintf("\nRESULTADOS \n\n");
    disp(TABLA);%Se imprime la tabla en pantalla
    
end