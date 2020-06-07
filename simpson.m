function simpson(a,b,M,fun)
fprintf("\n----------REGLA COMPUESTA DE SIMPSON----------\n");

format long;
syms x;

%integral(@(x) fun,a,b)
f=inline(fun);
fp=quad(f,a,b);

h=(b-a)/M;

x=zeros(1,2*M+1);

integra=(h/3)*(f(a)+f(b));
suma=0;
fprintf("\nFUNCION:\n");
disp(f);

fprintf("RESULTADOS \n\n");

x(1)=a;
for k=1:length(x)
    x(k+1)=a+k*h;
    %disp(x(k));
end

fprintf("X%d = %g\n",0,a);
for k=1:M/2-1
    xk=a+2*k*h;
    fprintf("X%d = %g\n",2*k,xk);
    suma=suma+f(x(2*k+1));
end

integra=integra+((2*h)/3)*suma;
suma=0;

for k=1:M/2
    xk=a+(2*k-1)*h;
    fprintf("X%d = %g\n",2*k-1,xk);
    suma=suma+f(x(2*k));
end
fprintf("X%d = %g\n",M,b);

integra=integra+((4*h)/3)*suma;

fprintf("\nf(x) ? %g\n",integra);
fprintf("E(x) = %g\n",integra-fp);
fprintf("\n----------REGLA COMPUESTA DE SIMPSON----------\n");

end