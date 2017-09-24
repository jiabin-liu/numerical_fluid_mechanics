function C=dupontfrankel(xmin,xmax,N,r,D,C_init,t)
%N is how many points you want, N-1 is how many grids
deltax=(xmax-xmin)/(N-1);
deltat=r*deltax^2/D;
nt=ceil(t/deltat);
%C=[C_init(1);C_init;C_init(end)];
C_old=C_init;
C=C_init;
nx=length(C);


C_init=[C_init(1);C_init;C_init(end)];
C_old=C_init;
C=C_init;
nx=length(C);
for n = 2:numt
		t(n+1) = t(n) + dt;
		for j  = 2:numx-1
			C(j,n+1) = (1-2*r)/(1+2*r)*C(j,n-1) + 2*r/(1+2*r)*(C(j+1,n)+C(j-1,n));
        end
        C(1,n+1) = C(2,n+1);         
        C(numx,n+1) = C(numx-1,n+1); 
end

end