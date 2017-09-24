function C=scalar_advect(C_init,xs,deltax,Cr,t)

nx=length(xs);
u=1;
deltat=Cr/u*deltax;
nt= t/deltat+1;

C=C_init;

for k = 2:nt
    C_old=C;
    
    for j=2:nx
        C(j)=C_old(j)-Cr*(C_old(j)-C_old(j-1));
    end
end




end