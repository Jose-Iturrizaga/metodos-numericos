%Ejemplos metodos iterativos
A = [4 1 -1; -2 5 0;2 1 6]; 
b = [1; -7;13]; 
x0 = [0;1;1];

[x, k] = Jacobi(A, b, x0, 1e-4, 1)
[x, k] = Jacobi(A, b)
[x, k] = Jacobi2(A, b)

[x, k] = GaussSeidel(A, b, x0, 1e-4, 1)
[x, k] = GaussSeidel(A, b)
[x, k] = GaussSeidel2(A, b)

A=[4 2 3;3 -5 2;-2 3 8];
b=[8; -14; 27];

[x, k]= SOR(A, b, 1.25,[0 0 0],10^-3,29)
[x, k]= SOR(A, b, 1.25)

A=[3 -2;-2 4];
b=[4;8];
[x, k] = grad(A,b,[3; -1])