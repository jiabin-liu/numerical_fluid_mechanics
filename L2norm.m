function L=L2norm(C_exact,C_num)
%a function that calculates the L2 norm, using the numerical solution C_num
%and the exact solution C_exact


m=length(C_num);
sum_diff=0;
for s=1:m
   sum_diff=sum_diff+(C_exact(s)-C_num(s))^2;
end

L=(sum_diff/m)^0.5;

end