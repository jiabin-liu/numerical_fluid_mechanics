function C=leapfrog(C_init,Cr,deltax,t,smoothing)
%smoothing=0 is no smoothing; smoothing=1 is alpha=0.05;
%smoothing=2 is alpha = 1

u=1;
deltat=Cr/u*deltax;
nt= t/deltat+1;
nx=length(C_init);

%use upwind forward difference to advance the first step
for j=2:nx
    C_init2(j)=C_init(j)-Cr*(C_init(j)-C_init(j-1));
end

%C_old1=Cn-1
%C_old2=Cn
%C = Cn+1
C=C_init;
C_old1=C_init;%initial step
C_old2=C_init2;%second step

for k = 3:nt
    C_old1=C_old2;%Cn becomes Cn-1
    C_old2=C; %Cn+1 becomes Cn
    for j=2:nx-1
        C(j)=C_old1(j)-Cr*(C_old2(j+1)-C_old2(j-1));
    end
    
    C(nx)=C(nx-1);
    
    if smoothing==1
        for j=1:nx
            C_old2(j)=C_old2(j)+0.025*(C(j)-2*C_old2(j)+C_old1(j));
        end
    elseif smoothing==2
        for j=1:nx
            C_old2(j)=C_old2(j)+0.5*(C(j)-2*C_old2(j)+C_old1(j));
        end
    end 
    
end


end