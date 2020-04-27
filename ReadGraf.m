function [ A n ] = ReadGraf(name);
	f1 = fopen(name, 'r');
	% numarul de pagini
	C=importdata(name);
  n=C(1);
 [r,c] = size(C);
	A = zeros(n, n);
	B=C(2:(n+1),3:(c));
        for i=1:n
          for j=1:c-2
            if B(i,j)=='\n'
              break
              continue
            end
            if B(i,j) ~= 0
              A(i,B(i,j))=1;
            end
          end
        end
  A = A - diag(diag(A));
	fclose(f1);
end
        