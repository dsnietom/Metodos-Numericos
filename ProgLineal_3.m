function [sol fobj la c_r iters B N Binv] = ProgLineal_3(c,A,b,eps1,bfs)
% Resuelve min. c’x sujeto a Ax=b, x >= 0 (problema estándar)
% B_i, vector de columnas de A en la base = B; bfs=base factible
% N_i, vector de columnas de A fuera de la base = N
disp('It. Sale B Entra B Cos. red. fobj Inf. dual');
[m n]=size(A); iters=0; c=c(:); B_i=bfs; N_i=setdiff(1:n,B_i);
[L U]=lu(A(:,B_i)); % LU de la base inicial
while 1==1 % Itera Símplex
xb =U\(L\b); % xb=B^-1*b vector solución actual
la =L'\(U'\c(B_i)); % Multiplicadores símplex
c_r=zeros(n,1);
c_r(N_i)=c(N_i)-A(:,N_i)'*la; % Costes reducidos: c_r=c_N-c_B*B^-1*N
[cj j]=min(c_r); % Cos. redu. más negativo; entra j. Bland implícita
if cj>-eps1 % si todos cj >= 0, óptimo;
sol=zeros(n,1); sol(B_i)=xb; % dar solución
fobj=c(B_i)'*xb;
N = N_i; B=B_i;
if nargout==8, Binv=U\(L\eye(m)); end
return % Salir; FIN algoritmo
end
y=U\(L\A(:,j)); % y = B^-1 * a[j]
zz=find(y>eps1)'; % Sale de base: mín d(i)/y(i), y(i)>0;
if isempty(zz), error('Problema no acotado.'); end % Direc. de no acotado
[yy ii]=min((xb(zz)./y(zz))); % Sale i
i=zz(ii); % Regla de Bland implícita: primera i
k=B_i(i); B_i(i)=j; N_i(j==N_i)=k; % Adaptación datos
[L U]=lu(A(:,B_i)); iters=iters+1; Di=norm(c_r(c_r<0));
fprintf('%3d%6d%7d %20.6f %20.6f %20.6f\n',iters,k,j,cj,c(B_i)'*xb,Di); % Info. itera
end
end