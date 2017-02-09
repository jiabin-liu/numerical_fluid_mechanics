function phi=thomas2(a,b,c,d)
%a,b,c are the three diagonal vectors. 
%d is the vector of known value, modified
%phi returns the solution 
N=length(d);
bnew=b;
phi=zeros(N,1);

for i=2:N
    bnew(i)=b(i)-c(i-1)*a(i)/bnew(i-1);
    d(i)=d(i)-d(i-1)*a(i)/bnew(i-1);
end
phi(N)=d(N)/bnew(N);
for i=N-1:-1:1
   phi(i)=(d(i)-c(i)*d(i+1))/bnew(i);
end

end