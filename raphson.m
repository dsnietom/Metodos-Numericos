%La función de Raphson calcula la raíz o la aproximación de una ecuación o cero de una función, partiendo de un valor inicial. La función Raphson (p, f, df) recibe como parámetros un valor inicial p, una función f y la derivada de la función df.
function raphson(p,F,dF)
    %p es P sub k-1
    %F es la función continua
    %dF es la derivada de la función continua
    
    format long;%Se cambia el formato de los resultados para visualizar la mayor cantidad de cifras significativas
    
    %Se construyen las funciones a partir de las expresiones de entrada F y dF
    f=inline(F);
    df=inline(dF);
    
    %Se calcula f(p), f prima(p) y p subk
    px=f(p);
    dpx=df(p);
    pk=p-(px/dpx);%pk=(p subk-1) - (f(p subk?1)/f prima(p subk?1))
    

    global TABLA;%Se crea una variable global para almacenar los resultados en una tabla
    [m,n]=size(TABLA);%Calcula el número de filas y columnas en cada iteración, m es el valor de la columna K
    fila=table(m, p, px, dpx);%Se crea una tabla a partir de todos los valores calculados en una iteración
    TABLA=[TABLA;fila];%Se concatenan los valores de la fila al final de la tabla
    
    %El programa se detiene cuando el valor de f(p) es igual a cero o menor a 1x10^-12
    if abs(px)<1*10^(-12) || px==0
        disp(' ');
        disp('TABLA DE RESULTADOS');
        
        %Se agrega la última fila a la tabla con el valor de K y de pk, los valores de f(pk)y f prima(pk) serán reemplazados por ceros (0) en esta ultima fila y no son validados ya que no se calcularon
        m=m+1;
        p=pk;
        px=0;
        dpx=0;
        fila=table(m, p, px, dpx);
        TABLA=[TABLA;fila];
        TABLA.Properties.VariableNames = {'K','Pk','f_Pk','df_Pk'};%Se agrega el encabezado de cada columna de la tabla
        disp(TABLA);%Se imprime la tabla en pantalla
        clearvars -global;%Se eliminan las variables globales creadas
    else
        raphson(pk,F,dF)%Se vuelve a llamar la función Raphson (proceso recursivo)
    end
end