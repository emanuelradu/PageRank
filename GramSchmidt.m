function [ B ] = GramSchmidt(A)
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

	% T = QR; T * T^-1 = I_N => T * x_k = e_k 
	% x_k = coloana k din T^-1
	% e_k = coloana k din I_n
	% QR * x_k = e_k => R * x_k = Q' * e_k

	% fac primul pas in afara for-ului

	x = zeros(n,1);
	y = zeros(n,1);
	y(1) = 1;
	b = Q' * y;

	x(n) = b(n)/R(n,n);
	for i = [n - 1 : -1: 1]
		x(i) = (b(i) - R(i,i+1:n)*x(i+1:n)) / R(i,i);
	end
	
	B = x;
	% rezolv n-1 sisteme superior triunghiulare si adaug solutia
	% in matricea B care va fi inversa lui A
	for i = 2 : n
		x = zeros(n,1);
		y = zeros(n,1);
		y(i) = 1;
		b = Q' * y;

		x(n) = b(n)/R(n,n);
		for i = [n - 1 : -1: 1]
			x(i) = (b(i) - R(i,i+1:n)*x(i+1:n)) / R(i,i);
		end

		B = [B x];
	end
end