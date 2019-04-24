function [BN,origins, seed] = buffonneedle(N,l,k,varargin)
%% BUFFON NEEDLE
% El problema de la aguja de Buffon pide encontrar la probabilidad de que 
% una aguja de longitud l aterrice en una línea, dado un piso con 
% líneas paralelas igualmente espaciadas a una distancia d. 
%
%  BN = BUFFONNEEDLE(N,k)
%
%   BN is the set of positions, for the rearend of the needle.
%   
%   N is the number of needles required.
%
%   k is the region within the needles must fall.
%
%   l is the length of the needle (missing here).
%
%   Created by Elram.
%   Revision by Dario.
%% See documentation about random number generation: Random Number Generation (rng & rand usage).
if nargin > 3
    seed = rng(varargin{1}); %use the predefined seed state to run over the same sample.
else
    seed = rng; % for repeateability, if no seed is given.
end
% Now we calculate the slopes of the needles.
Y = rand(1,N); 
XY=[sqrt(ones(1,N)-Y.^2); Y]; %N pairs of slopes.
% **BEWARE** THIS METHOD ONLY CONSIDERS SLOPES IN THE FIRST QUADRANT...
% THERE ARE MISSING SLOPES. CHECK THIS.
origins=k*rand(2,N);%posiciones (x,y) de los de la posición inicial de las rectas pero de largo 1 (!) 
BN=l*XY + origins; % ORIGINS is the STARTING POINT of the needle.
%final(1,:)= abs(X-origins(1,:));%componente horizontal final
%final(2,:)= abs(Y-origins(2,:));%componente vertical final

%% All of this cannot be part of a function as it is just plotting.
% rectangle('Position',[0 0 k k]);
% axis([-.5 k+1 -.5 k+1])
% box on
% hold
% for i=1:N
% polyfit([origins(1,i) final(1,i)],[origins(2,i) final(2,i)],1);
% plot([origins(1,i) final(1,i)],[origins(2,i) final(2,i)],'LineWidth',2);
% end
% save BM

