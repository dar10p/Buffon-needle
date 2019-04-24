%% LINEAS VERTICALES CONSECUTIVAS
%Esta función crea lineas verticales con espaciado horizontal igual a
%"d"... Esta función es complemento de buffonneedle, asi que el tamaño del
%espacio acá debe ser igual al definido en la función buffonneedle.
%d=espaciado horizontal. k=tamaño del espacio.
function LV = verticallines(k)
m=1;
j=1;
c=1;
y=(0:k);
x=zeros(1,k+1);
p=zeros(k,1);
for i = 1:k
    j=j+1;
    m=m+1;
    p(m,1) = polyfit([1, 1], [0, 2*i], 0);
    x(1,:,j) = polyval(p(j,1),y);
end
for i=1:k+1
    plot(x(1,:,c),y)
    %axis([-1 k 0 k]);
    c=i+1;
    hold on
end
save LV
