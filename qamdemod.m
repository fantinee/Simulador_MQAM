function [MensajeBinarioRx] = qamdemod(r_real, r_imag, M)
l = log2(M);
N = length(r_real)*log2(M);
MensajeBinarioRx = zeros(1, N);
switch M
	case 2
		values = [-1 0 0; 1 0 1];
	case 4
		values = [1/sqrt(2) 1/sqrt(2) 1 1].*[-1 -1 0 0;
 		-1  1 0 1;
 		 1 -1 1 0;
 		 1  1 1 1;
 		];
	case 16
		values = [1/sqrt(10) 1/sqrt(10) 1 1 1 1].*[-3 -3 0 0 0 0; -3 -1 0 0 0 1;
		-3  1 0 0 1 1;-3  3 0 0 1 0;
		-1 -3 0 1 0 0;-1 -1 0 1 0 1;
		-1  1 0 1 1 1;-1  3 0 1 1 0;
		 1 -3 1 1 0 0; 1 -1 1 1 0 1;
		 1  1 1 1 1 1; 1  3 1 1 1 0;
		 3 -3 1 0 0 0; 3 -1 1 0 0 1;
		 3  1 1 0 1 1; 3  3 1 0 1 0;
 		];
	case 64
		values = [1/sqrt(42) 1/sqrt(42) 1 1 1 1 1 1].*[
		-7 -7 0 0 0 0 0 0; -7 -5 0 0 0 0 0 1; -7 -3 0 0 0 0 1 1; -7 -1 0 0 0 0 1 0;
		-7 1 0 0 0 1 1 0; -7 3 0 0 0 1 1 1; -7 5 0 0 0 1 0 1; -7 7 0 0 0 1 0 0;
		-5 -7 0 0 1 0 0 0; -5 -5 0 0 1 0 0 1; -5 -3 0 0 1 0 1 1; -5 -1 0 0 1 0 1 0;
		-5 1 0 0 1 1 1 0; -5 3 0 0 1 1 1 1; -5 5 0 0 1 1 0 1;-5 7 0 0 1 1 0 0;
		-3 -7 0 1 1 0 0 0;-3 -5 0 1 1 0 0 1; -3 -3 0 1 1 0 1 1;-3 -1 0 1 1 0 1 0;
		-3 1 0 1 1 1 1 0;-3 3 0 1 1 1 1 1;-3 5 0 1 1 1 0 1;-3 7 0 1 1 1 0 0;
		-1 -7 0 1 0 0 0 0;-1 -5 0 1 0 0 0 1;-1 -3 0 1 0 0 1 1;-1 -1 0 1 0 0 1 0;
		-1 1 0 1 0 1 1 0;-1 3 0 1 0 1 1 1;-1 5 0 1 0 1 0 1;-1 7 0 1 0 1 0 0;
		1 -7 1 1 0 0 0 0;1 -5 1 1 0 0 0 1;1 -3 1 1 0 0 1 1;1 -1 1 1 0 0 1 0;
		1 1 1 1 0 1 1 0;1 3 1 1 0 1 1 1;1 5 1 1 0 1 0 1;1 7 1 1 0 1 0 0;
		3 -7 1 1 1 0 0 0;3 -5 1 1 1 0 0 1;3 -3 1 1 1 0 1 1;3 -1 1 1 1 0 1 0;
		3 1 1 1 1 1 1 0;3 3 1 1 1 1 1 1;3 5 1 1 1 1 0 1;3 7 1 1 1 1 0 0;
		5 -7 1 0 1 0 0 0;5 -5 1 0 1 0 0 1;5 -3 1 0 1 0 1 1;5 -1 1 0 1 0 1 0;
		5 1 1 0 1 1 1 0;5 3 1 0 1 1 1 1;5 5 1 0 1 1 0 1;5 7 1 0 1 1 0 0;
		7 -7 1 0 0 0 0 0;7 -5 1 0 0 0 0 1;7 -3 1 0 0 0 1 1;7 -1 1 0 0 0 1 0;
		7 1 1 0 0 1 1 0;7 3 1 0 0 1 1 1;7 5 1 0 0 1 0 1;7 7 1 0 0 1 0 0
		];
end
cuadricula = values(:,1:2); % generates the signal space
for index = 1:length(r_real) 
	p = ([r_real(index) r_imag(index)] - cuadricula); % distance vector to every point
	distances = vecnorm(p');
	value = min(distances); % get min distance point
	enumerate = 1:numel(distances);
	selected = enumerate(distances==value);
	if length(selected)>1 % in case of two or more minimum values
		selected = selected(2);
	end
	msg = values(selected,3:end);
	MensajeBinarioRx(index*l-(l-1):index*l) = msg; % index msg to output
end
end