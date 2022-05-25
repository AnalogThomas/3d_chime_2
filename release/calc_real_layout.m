function r_layout=calc_real_layout(vis)
% this file is to read the t-design speakers layout 
% and draw a polyhedron

%tdesign_file=fopen("des.3.6.3.txt");

data_matrix=readmatrix("../source/real_layout.csv");

x=data_matrix(:,1);
y=data_matrix(:,2);
z=data_matrix(:,3);

r_layout=data_matrix;
%% Visualization
%draw scatter points
if vis==1
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