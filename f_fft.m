function x=f_fft(y,m)
if nargin ==1 || length(y)>2^m               %Adjusting the Input Arguments.
    m=log2(length(y));
    m=floor(m);
end
y=y(1:2^m);
Dec_order=0:(2^m)-1;                        % Making a decimal order from bit reversed order
reversed_order=digitrevorder(Dec_order, 2); % copying original signal y to x in reversed bit order
for index=1:2^m
    x(index)=y(reversed_order(index)+1);
end
for state=1:m                               % state is the each multiplying step
    for kN=1:2^(state-1)                  % there are (2^(state-1) different W for each state
        N=2^state;
        k=kN-1;                             % in real equation actually k=kn 
        W(kN)=exp(-j*2*pi*k/N);
    end                                     % end of W
    index=1;                                % index counter of the equation number
    diff=2^(state-1);
    kN=1;                                   % index counter of the W    
    while (index <= (2^m))                  % there are 2^m equation     
        for plus=1:2^(state-1)              % plus is the number of addition in a seq.
            U(index)=x(index)+W(kN)*x(index+diff);
            index=index+1;
            if kN < 2^(state-1)
                kN=kN+1;
            else
                kN=1;
            end     
        end                                 % end of "for loop" of equations for additon
        
          for minus=1:2^(state-1)
            U(index)=x(index-diff)-W(kN)*x(index);
            index=index+1;
            if kN < 2^(state-1)
                kN=kN+1;
            else
                kN=1;
            end     
          end                               % end of "for loop" of equations for subtraction
        
    end                                
    for index=1:2^m
        x(index)=U(index);
    end                                     % end of "for loop" -- copying array to pass next state
end                                         % end of "for loop" of state value
x;  