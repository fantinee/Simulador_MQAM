%[n_I, n_Q, EstadoAWGN_I, EstadoAWGN_Q] = ...
%    awgn(EbNo, length(r), EstadoAWGN_I, EstadoAWGN_Q, M);
function [n_I, n_Q, EstadoAWGN_I, EstadoAWGN_Q] = awgn(EbNo, r, EstadoAWGN_I, EstadoAWGN_Q, M)
% r es el largo
SNR_B = 10^(EbNo/10);
SNR_S = SNR_B*log2(M);
[n_I, EstadoAWGN_I] = randg(r, EstadoAWGN_I);
[n_Q, EstadoAWGN_Q] = randg(r, EstadoAWGN_Q);
n_I = n_I/sqrt(2*SNR_S);
n_Q = n_Q/sqrt(2*SNR_S);
end
