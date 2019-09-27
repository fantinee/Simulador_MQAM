function [prbs, estadoN] = prbs15(N, estado0)
prbs = 1:N; % creates vector
n = 1;
estadoN = estado0;
while n < N + 1
    %first and last xor
    prbs(n) = xor(estadoN(1), estadoN(15));
    % shifts 
    estadoN = circshift(estadoN,1);   
    estadoN(1) = prbs(n);
    n= n+1;
end
end