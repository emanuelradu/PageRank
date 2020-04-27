% Nume, Prenume, Grupa

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	[A n] = ReadGraf(nume);
  L = sum(A');
	K_inv = diag(1./L);

	M = (K_inv * A)';
	T = eye(n) - d * M;
	T_inv = GramSchmidt(T);

	R = T_inv * ones(n,1) * (1-d)/n;
end