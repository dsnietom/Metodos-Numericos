function trapecio(a,b,M,fun)
fprintf("\n----------REGLA COMPUESTA DEL TRAPECIO----------\n");

format long;
syms x;

%integral(@(x) fun,a,b)
f=inline(fun);
fp=quad(f,a,b);

h=(b-a)/M;

integra=(h/2)*(f(a)+f(b));
suma=0;
fprintf("\nFUNCION:\n");
disp(f);

fprintf("RESULTADOS \n\n");
fprintf("X%d = %g\n",0,a);
for k=1:M-1
    xk=a+k*h;
    fprintf("X%d = %g\n",k,xk);
    suma=suma+f(xk);
end
fprintf("X%d = %g\n",M,b);

integra=integra+h*suma;

fprintf("\nf(x) ? %g\n",integra);
fprintf("E(x) = %g\n",abs(integra-fp));
fprintf("\n----------REGLA COMPUESTA DEL TRAPECIO----------\n");

end