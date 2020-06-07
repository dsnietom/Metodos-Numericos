function fobj=funobj2(P)
c1=500+5.3*P(1)+0.004*P(1)^2;     %Costo planta 1
c2=400+5.5*P(2)+0.006*P(2)^2;   %Costo planta 2
c3=200+5.8*P(3)+0.009*P(3)^2;   %Costo planta 3
fobj=c1+c2+c3                  %Funcion objetivo
end
