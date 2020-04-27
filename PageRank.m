% Radu, Emanuel Ioan, 315CD

function [R1 R2] = PageRank(name, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
	name_out = strcat(name,'.out');
	out = fopen(name_out, 'w');
  R1 = Iterative(name, d, eps);
  R2 = Algebraic(name, d, eps);
  [n m] = size(R1);

	fprintf(out, '%d\n\n', n);
	fprintf(out, '%.6f\n', R1);
  fprintf(out, '\n');
  fprintf(out,'%.6f\n', R2);
	fprintf(out, '\n');

  

  fclose(out);
end