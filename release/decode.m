function decode(M,N_sph)
t_design=readmatrix("../source/t_design_layout.csv");
x=t_design(:,1);
y=t_design(:,2);
z=t_design(:,3);
% virtual ambisonic decoder
[azi,colat]=cart2sph(x,y,z);
% band-limited Dirac -> spherical harmonics
Y_bld=sh_matrix(N_sph,azi,colat);
% VBAP
vis=0;% do not visualize here
r_layout=calc_real_layout(vis);
G_k=vbap(t_design,r_layout);
end

%% functions
function Ymn=sh_matrix(N_sph, azi, colat)
% calculate spherical harmonics matrix of virtual t-design speakers column
% by column
if ndims(azi)==0
    Q=1;
else 
    Q=length(azi);
end
Ymn=zeros(Q,(N+1)^2);
idx=0;
for n=0:N_sph
    for m=-n:n
        if m==0
            Ymn(:,idx)=real(sph_harm(0,n,azi,colat));
        elseif m<0
            Ymn(:,idx)=sqrt(2)*(-1)^(abs(m))*imag(sph_harm(abs(m),n,azi,colat)); % ?
        elseif m>0
            Ymn(:,idx)=sqrt(2)*(-1)^(abs(m))*real(sph_harm(abs(m),n,azi,colat));
        end
        idx=idx+1;
    end
end
end

function Ymn=sph_harm(m,n,azi,colat)
% calculate the spherical harmonics by using associated Legendre function 
% because matlab cannot calculate spherical hamonics directly
Pnm=legendre(n,cos(azi));
Pnm=Pnm(m+1,:).';
Ymn=sqrt((2*n+1)/4/pi*factorial(n-m)/factorial(n+m))*exp(m*colat*1i).*Pnm;
end

function vbap(src,hull)
% ------------to be done--------- %
end