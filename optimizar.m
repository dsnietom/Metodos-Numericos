f=[4 5 7 -1];

A= [-1 -1 -2 1;
    2 -6 3 1];

b =[-1;
    -3];

Aeq=[-2 4 2 2];
beq=[-5];

lb=zeros(4,1);

[Variables,Optimizacion]=linprog(f,A,b,Aeq,beq,lb)
