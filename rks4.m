function [T,Z]=rks4(fun,a,b,Za,M)
h=(b-a)/M;
T=zeros(1,M+1);
Z=zeros(M+1,length(Za));
T=a:h:b;
Z(1,:)=Za;
F=inline(fun,'t','x');


%Algoritmo de RK4
for j=1:M
    %parametros k para evaluar la funcion
    k1=F(T(j),Z(j,:));
    k2=F(T(j)+h/2,Z(j,:)+k1*h/2);
    k3=F(T(j)+h/2,Z(j,:)+k2*h/2);
    k4=F(T(j)+h,Z(j,:)+h*k3);
    Z(j+1,:)=Z(j,:)+h*(k1+2*k2+2*k3+k4)/6;
    Z(j,:)+h*(k1+2*k2+2*k3+k4)/6
end
    
end