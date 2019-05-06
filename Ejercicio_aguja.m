                          %% AGUJA DE BUFFON %%
                          
                         %Ricardo Correa Toledo%
                          
% Este problema trata sobre lanzar una aguja en un espacio con lineas
% separadas una de otra a una distancia "d" y determinar la probabilidad de
% que una aguja de largo "d" (igual que el espaciado de lineas)corte una de
% las lineas, de esta manera se pude encontrar el valor de pi.

 
N = 150006000;   %n�mero de lanzamientos.
L = 1;      %Longitud de la aguja.
D = 1;      %Separaci�n entre las lineas horizontales.

Nc = 0;     %contador para saber cuantas veces la aguja cort� una de las 
            %lineas.

%tomando en cuenta que para este ejemplo las lineas son horizontales
%separadas la misma distancia D entre ellas.

for a = 1:N
    
%Ahora bien, para esta demostraci�n, tomaremos en cuenta el punto medio de       
%la aguja y ademas el �ngulo con respecto a la horizontal con que cae 
%la aguja.

    X = (D/2)*rand; % X denota la distancia del centro de la aguja con 
                    % alguna de las lineas del plano.
                    
    T = 2*pi*rand;  % Es el �ngulo con el que cae la aguja con respecto a la
                    % horizontal.
 
    if X <= (0.5)*L*sin(T) %Si esta condici�n se cumle entonces la aguja 
                           %intersecta una de las lineas.
                        
        Nc = Nc + 1;
    else
        
    end
    
    P  = (2*L)/(pi*D);  %Prpbabilidad que la aguja cort� una de las lineas.
    Pi = (N)/Nc;        %Estimacion del n�mero pi.
        
end              
disp(Pi);