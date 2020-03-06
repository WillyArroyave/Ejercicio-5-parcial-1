%Ejercicio 5 parcial 1
clf; clc;

Ts = 0.01; t = -5:Ts:5;       

y1 = 2*tri(t,1,-1);
y2 = tri(0.5*t,1,-2);
y3 = impulse(t,3);
y4 = ustep(t,-3);
y5 = ramp(3*t,3,-6); 

y = y1+y2+y3+y4+y5;

plot(t,y); axis([-5 5 -1 7]); 
grid on; a=12;                                                                      
title('$Ejercicio 5$','interpreter','latex','FontSize',a)
xlabel('$t$','interpreter','latex','FontSize',a)
ylabel('$y(t)$','interpreter','latex','FontSize',a)

function y = tri(t,m,ad)
    y = m*( ramp(t,m,ad+1) - 2*ramp(t,m,ad) + ramp(t,m,ad-1) );
end

function y = ramp(t,m,ad)  % generacion de la señal rampa 
                           % t: tiempo evaluado                                                 
                           % m: pendiente de la rampa                                                 
                           % ad : retardo (negativo), avance (positivo)
N= length(t);
y = zeros(1,N);
    for i = 1:N
        if t(i)>= -ad
            y(i) =m* (t(i)+ad);
        end
    end
end

function y = impulse(t,ad)  % Generacion del impulso
                            % t: tiempo
N= length(t);
y = zeros(1,N);
    for i = 1:N
        if t(i)== -ad
            y(i) = 1000;
        end
    end
end

function y = ustep(t,ad)   % Generacion del escalon unitario
                           % t: tiempo
                           % ad : retardo (negativo), avance (positivo)                 
N= length(t);
y = zeros(1,N);
    for i = 1:N
        if t(i)>= -ad
            y(i) = 1;
        end
    end
end