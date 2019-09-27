function[s_I, s_Q] = qammod(MensajeBinario, M)
N = length(MensajeBinario)/log2(M);
%unit_Factor = (1./sqrt(t));
MensajeBinario = reshape(MensajeBinario,log2(M), N)';
s_I = zeros(1,N);
s_Q = zeros(1,N);
for index = 1:N
	if M == 2
        %BPSK
		s_I = (-1).^(MensajeBinario+1)';
	else
	    m1 = MensajeBinario(index,1:end/2);
    	m2 = MensajeBinario(index,end/2+1:end);
    	if (M == 4)
    		axis = [[-1 0]; [1 1]];
    	    for i = 1:2
    	        if isequal(m1, axis(i,2))
    	            s_I(index)= axis(i,1);
    	        end
    	        if isequal(m2, axis(i,2))
    	            s_Q(index)= axis(i,1);
    	        end
    	    end
    	elseif (M == 16)
    		axis = [-3 0 0; -1 0 1; 1 1 1; 3 1 0];
    	    for i = 1:4
    	        if isequal(m1, axis(i,2:3))
    	            s_I(index) = axis(i,1);
    	        end
    	        if isequal(m2, axis(i,2:3))
    	            s_Q(index) = axis(i,1);
    	        end
    	    end
    	else
    		axis = [[-7 0 0 0]; [-5 0 0 1]; [-3 0 1 1]; [-1 0 1 0]; [1 1 1 0]; [3 1 1 1]; [5 1 0 1]; [7 1 0 0]];
    	    for i = 1:8
    	        if isequal(m1, axis(i,2:4))
    	            s_I(index)= axis(i,1);
    	        end
    	        if isequal(m2, axis(i,2:4))
    	            s_Q(index)= axis(i,1);
    	        end
    	    end
    	end
    end
end   
switch M
 	case 4
 		s_I = 1/sqrt(2).* s_I;
 		s_Q = 1/sqrt(2).* s_Q;
 	case 16
 		s_I = 1/sqrt(10).*s_I;
 		s_Q = 1/sqrt(10).*s_Q;
 	case 64
 		s_I = 1/sqrt(42).*s_I;
 		s_Q = 1/sqrt(42).*s_Q;
end
end