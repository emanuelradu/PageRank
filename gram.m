function [ B ] = gram(A)
	% m == n
	[m n]=size(A);
	B = zeros(m,1);

  
	% Algoritmul Gram-Schmidt de factorizare QR din laboratorul 3
	Q = A;
	R = zeros(m,n);
	for k = 1 : n
		R(k,k) = norm(Q(1:m,k));
		Q(1:m,k) = Q(1:m,k)/R(k,k);
		for j = k+1:n
			R(k,j) = Q(1:m, k)' * Q(1:m, j);
			Q(1:m,j) = Q(1:m,j) - Q(1:m,k) * R(k,j);
		end
	end
  disp(Q);
  disp(R);