function [g, estadoN] = randg(N, estado0)
n = 0 ;
eta_n = estado0;
g = 1:N; % creates vector
while n < N 
    % paso 2
    [uu, estadoNU] = randu(2, eta_n); % uu u uniform vector
    u1 = uu(1);
    u2 = uu(2);
    eta_n = estadoNU;
    % paso 3
    s = (2*u1-1)^2+(2*u2-1)^2;
    % paso 4
    if (s<1)
        g1 = (2*u1-1)*sqrt((-2*log(s))/s);
        n = n+1;
        g(n) = g1;
    end
end
estadoN = estadoNU;
end