function derivacion(x,H,N,f)

fd=diff(f);%Calcula la derivada de f
fun=inline(f,'x');
dfun=inline(fd,'x');


%%INTERPOLADOR DE NEWTON
%Una iteracion por valor h
fprintf("\n  k        Incremento h   DerivadaPorMetodo     DerivadaReal        error       \n")
for i=1: length(H)
    h=H(i);

    %Creamos los vectores X y Y
    X=zeros(1,N);
    Y=zeros(1,N);
    X(1)=x;
    Y(1)=fun(X(1));
    %disp(Y(1));

    %Guardamos los valores correspondientes para el polinomio de grado N, en los vectores X y Y
    for k=2:N
        if(rem(k,2)==0)
            X(k)=X(1)+ floor(k/2)*h;
            Y(k)=feval(fun,X(k));
        else
            X(k)=X(1)- floor(k/2)*h;
            Y(k)=feval(fun,X(k));
        end
    end

    %Creamos y guardamos el primer valor de las diferencias divididas
    A=Y;

    %Calulamos las diferencias divididas para grado N
    for j=2:N
        for k=N:-1:j
            A(k)=(A(k)-A(k-1))/(X(k)-X(k-j+1));
        end
    end

    %Creamos el valor de la derivada para la primera diferencia dividida
    x0=X(1);
    df=A(2);
    prod=1;

    %Calculamos el valor de la derivada de la funcion por el metodo de newton
    for k=2:N-1
        prod=prod*(x0-X(k));
        df=df+prod*A(k+1);
    end

    %Imprimimos los resultados
    fprintf("%3i  %17.9f %17.9f %17.9f %17.9f \n",i,h,df,feval(dfun,x),abs(df-feval(dfun,x)))
end
end