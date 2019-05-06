function [needdle_prob]=needle(nl,N,s) % nl: number of vertical lines
tic                                    % N: Number of needles
ny=10;                                 % s: neddle-line ratio
nx=10;
step=1e-2;
[x,y]=meshgrid(-nx:step:nx,-ny:step:ny);
% nl=10;%vertical lines number (approx)
d=round(length(x)/nl+1);
line_grid=x;
for k=1:numel(x)
    if line_grid(k)==1;
        line_grid(k)=0;
    end
end
for k=0:d:length(x)
    for j=1:length(x)
        line_grid(j+length(x)*k)=1;
       if line_grid(:,j)~=ones(length(x),1);
          line_grid(:,j)=zeros(length(x),1);
       end
    end
end
toc
l=round(s*d);
vec=1:length(x)+l;
rnd_1=round(length(x)*rand(1,N)+l);
rnd_2=round(length(x)*rand(1,N)+l);
line_grid=cat(1,line_grid,zeros(round(l),length(x)));%
line_grid=cat(1,zeros(round(l),length(x)),line_grid);%    matrix re-sized
line_grid=cat(2,line_grid,zeros(length(x)+2*round(l),round(l)));%
line_grid=cat(2,zeros(length(x)+2*round(l),round(l)),line_grid);%
line_grid_F=zeros(size(line_grid,2),size(line_grid,1));
bottom_vec=ones(1,l)*0.5;
theta=rand(1,N)*360; %random angles
X_0=vec(rnd_1);Y_0=vec(rnd_2); %origen aleatorio de la aguja
tic
for j=1:N
line_grid_0=zeros(size(line_grid,2),size(line_grid,1));
bottom_vec_R=imrotate(bottom_vec,theta(j));
X=Y_0(j)-round(size(bottom_vec_R,2)/2):Y_0(j)+round(size(bottom_vec_R,2)/2)-1;
Y=X_0(j)-round(size(bottom_vec_R,1)/2):X_0(j)+round(size(bottom_vec_R,1)/2)-1;
if length(X)<size(bottom_vec_R,2)
    X=X(:,1:end+1);
elseif length(X)>size(bottom_vec_R,2)
    X=X(:,1:end-1);
end
if length(Y)<size(bottom_vec_R,1)
    Y=Y(:,1:end+1);
elseif length(Y)>size(bottom_vec_R,1)
    Y=Y(:,1:end-1);
end
line_grid_0(Y,X)=bottom_vec_R;
line_grid_F=line_grid_0+line_grid_F;
end
line_grid_F=line_grid_F+line_grid;
toc
loc_line=find(line_grid(round(length(line_grid)/2),:)==1);%localizar líneas de intersección
inter_cat=zeros(1,1);
for m=1:length(loc_line)
inter=find(line_grid_F(:,loc_line(m))>=1.5);
inter_cat=cat(1,inter_cat,inter);
end
N_inter=length(inter_cat)-1;
prob=N_inter/N;s=l/d;needle_prob=2*s/prob
imagesc(line_grid_F)
impixelinfo