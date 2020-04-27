% Nume, Prenume, Grupa

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

	if x >= 0 & x < val1
		y = 0;
	elseif x >= val1 & x <= val2
		% conditiile ca functia sa fie continua sunt:
		% a*val1 + b = 0 si a*val2 + b = 1
		% de unde rezulta a si b
		a = 1/(val2 - val1);
		b = -val1/(val2 - val1);
		y = a*x + b;
	else
		y = 1;
	end
end
			