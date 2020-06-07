function [res,reseq]=res(X)
Xp=0.000218*X(1)^2+0.000228*X(2)^2+0.000179*X(3)^2; %Perdidas
reseq=150+Xp-X(1)-X(2)-X(3);        %Balance de las toneladas
res=[];
end