function Xk = teste(xn)
%To compute the dft of the sequence x(n)
[L, P] = size(xn);
%Check for the length of the DFT
x1 = [xn zeros(1,0)];%Zero padding to the input sequence and assigning the value to the other vector
%Twiddle factors
for n=0:1:P-1;
    for k=0:1:P-1;
        p = exp(2*pi*-j*n*k/P);
        x2(k+1,n+1) = p;
    end
end
Xk=x1*x2;