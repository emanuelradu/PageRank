% Radu, Emanuel Ioan, 315 CD

function R = Iterative(name, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	[A n]= ReadGraf(name);
  D = sum(A');
  K = diag(D);
  Kinv = diag(1./D);
  R(1:n,1) = 1/n;
  M = (Kinv * A)';
  
  do
		aux = R;
		R = d * M * aux + ones(n,1)*(1 - d)/n;
	until ( norm(R - aux,1) < eps )
 output_precision(6);
end