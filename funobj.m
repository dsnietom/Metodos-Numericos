function fobj=funobj(X)
c1=200+7*X(1)+0.008*X(1)^2;     %Costo planta 1
c2=180+6.6*X(2)+0.009*X(2)^2;   %Costo planta 2
c3=140+6.8*X(3)+0.007*X(3)^2;   %Costo planta 3
fobj=c1+c2+c3                  %Funcion objetivo
end
