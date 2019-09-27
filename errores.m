function [Err_s, Err_b] = errores (MensajeBinario, MensajeBinarioRx, M)
% Err_b = error de bit
Err_b = sum(MensajeBinario ~= MensajeBinarioRx);
% Err_s = error de simbolo
%Err_s = Err_b;
N = length(MensajeBinario)/log2(M);
MensajeBinario = reshape(MensajeBinario,log2(M), N)';
MensajeBinarioRx = reshape(MensajeBinarioRx,log2(M), N)';
Err_s = sum(sum(MensajeBinario ~=MensajeBinarioRx,2)~=0);
end 