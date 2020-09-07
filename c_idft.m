function Xk = c_idft(xn)
%To compute the dft of the sequence x(n)
[L, P] = size(xn);
%Check for the length of the DFT
x1 = [xn zeros(1,0)];%Zero padding to the input sequence and assigning the value to the other vector
%Twiddle factors
for n=0:1:P-1;
    for k=0:1:P-1;
         p = exp(2*pi*j*n*k/P);
         p = (1/P) * p;
         x2(n+1,k+1) = p;
    end
end
Xk=x1*x2;