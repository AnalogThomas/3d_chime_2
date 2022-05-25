% basic AmbiX, sorted by ACN and use the SN3D factor
% the order N must be smaller than 4
% theta: azimuth, phi: elevation angle
function M=encode(N,theta,phi)
C={};
M=[];
for i=0:N
    switch i
        case 0
            C{1}=1;
            M=[M,C{1}];
        case 1
            C{2}=[sin(theta)*cos(phi),sin(phi),cos(theta)*cos(phi)];
            M=[M,C{2}];
        case 2
            C{3}=[sqrt(3/4)*cos(phi)^2*sin(2*theta),sqrt(3/4)*sin(theta)*...
                sin(2*phi),0.5*(3*cos(phi)^2-1),sqrt(3/4)*cos(theta)*sin(2*phi)...
                ,sqrt(3/4)*cos(phi)^2*cos(2*theta)];
            M=[M,C{3}];
        case 3
            C{4}=[sqrt(5/8)*cos(phi)^3*sin(3*theta),sqrt(15/4)*sin(2*theta)*sin(phi)*cos(phi)^2,...
                sqrt(3/8)*sin(2*theta)*sin(phi)*cos(phi)^2,0.5*sin(phi)*(5*sin(phi)^2-1)*cos(phi),...
                sqrt(3/8)*cos(theta)*(5*sin(phi)^2-3)*cos(phi),sqrt(15/4)*cos(2*theta)*sin(phi)*cos(phi)^2,...
                sqrt(5/8)*cos(phi)^3*cos(3*theta)];
            M=[M,C{4}];
        case 4
            C{5}=[];% ------------to be done--------- %
            M=[M,C{5}];
    end
end
end