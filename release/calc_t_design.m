function td_layout=calc_t_design(vis)
%this file is to read the t-design speakers layout 
% and draw a polyhedron
clear
%tdesign_file=fopen("des.3.6.3.txt");
tdesign_file=fopen("../source/t_design_des.3.24.7.txt");
data_cell=textscan(tdesign_file,'%f');
fclose(tdesign_file);
data_matrix=data_cell{1};
n_speaker=length(data_matrix)/3;

x=zeros(n_speaker,1);
y=zeros(n_speaker,1);
z=zeros(n_speaker,1);

for i=1:(n_speaker)
    x(i)=data_matrix(3*(i-1)+1);
    y(i)=data_matrix(3*(i-1)+2);
    z(i)=data_matrix(3*(i-1)+3);
end
td_layout=[x,y,z];
%generate standard csv file
%writematrix([x,y,z],'../source/t_design_layout.csv')

%% Visualization
if vis==1
    %draw scatter points
    figure(1)
    scatter3(x,y,z,'*')
    axis vis3d
    title('scatter points')
    %draw triangulation
    % DT=delaunay(x,y,z);%construct link matrix of delaunay triangulation 
    P=[x,y,z];
    DT=delaunayTriangulation(P);%create delaunay triangulation object
    
    %in this matrix, each row: index of 3 points of this convex hull triangle
    C=convexHull(DT);%create convex hull
    
    figure(2)
    trisurf(C,DT.Points(:,1),DT.Points(:,2),DT.Points(:,3))
    axis vis3d %keep axis aspect ratio constant
    % tetramesh(DT,[x,y,z])
    % tetramesh(DT)
    title('delauney triangulation')
    grid("on")
end
end