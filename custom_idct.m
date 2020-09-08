function B = custom_idct(A)
    lc=length(A);
    cc=[A zeros(1,0)];
    CN=zeros(lc);
    for n=0:lc-1
        for k=0:lc-1
            if k==0
                CN(k+1,n+1)=sqrt(1/lc);
            else
                CN(k+1,n+1)=sqrt(2/lc)*cos(pi*(n+0.5)*k/lc);
            end
        end
    end
    B=(CN.'*cc.')';
end