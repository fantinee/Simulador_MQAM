%% generador numeros aleatorios con distribucion uniforme
function [u, estadoN] = randu(N, estado0)
%fix first number, vector no debe contener seed
u = 1:N+1; % creates vector
u(1) = estado0; % initial seed in range  
n = 1; % current index
while n < N+1
    en = mod(7^5*u(n),2^31-1);
    estadoN = en;
    u(n+1)= en;
    n = n+1;
end
u = u ./ (2^31 - 1); % se divide al final 
u = u(2:N+1);

end

