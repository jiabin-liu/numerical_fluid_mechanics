function C=ftcs(xmin,xmax,N,r,D,C_init,order,t)
%N is how many points you want, N-1 is how many grids
deltax=(xmax-xmin)/(N-1);
deltat=r*deltax^2/D;
nt=ceil(t/deltat);
%C=[C_init(1);C_init;C_init(end)];
C_old=C_init;
C=C_init;
nx=length(C);

if order ==1
    for k = 2:nt
        C_old=C;
        for m=2:nx-1
            C(m)=(1-2*r)*C_old(m)+r*(C_old(m-1)+C_old(m+1));
        end
        C(1)=C(2);
        C(nx)=C(nx-1);%no ghost point used
    end
    
elseif order ==2
    C_init=[C_init(1);C_init;C_init(end)];
    C_old=C_init;
    C=C_init;
    nx=length(C);
    for k=2:nt
        C_old=C;
        for m=2:nx-1
            C(m)=(1-2*r)*C_old(m)+r*(C_old(m-1)+C_old(m+1));
        end
        C(1)=C(3);
        C(nx)=C(nx-2);
    end
    C=C(2:end-1);
end

end