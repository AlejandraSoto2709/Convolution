 %Alejandra Soto  0297684
 %Susana Tristán  0297977
 function [Y,v]= convolution_integral3(x,h)
%oldVal = sympref('HeavisideAtOrigin',1);
sympref('HeavisideAtOrigin',1);

%Variables simbolicas
syms t

% x3 = (t-1)*(heaviside(t-1)-heaviside(t-3));
% h3 = heaviside(t+1)-2*heaviside(t-2);
% Y3 = ConvolutionIntegral(x3,h3,-4,5);

% Nuevos valores de Tau 
step = .01;
Tau = -5:step:4;

%Evaluar h(t) y x(t)
for i = 1:length(Tau)
    H(i) = double(subs(h,t,(Tau(i))));
    X(i) = double(subs(x,t,(Tau(i))));
end 

%Graficas de x(t) y h(t)
figure(1)
title('Convolucion Visual')
subplot(3,2,1)
fplot(x,'LineWidth',3)
xlabel('t')
ylabel('x(t)')
grid on  
subplot(3,2,2)
fplot(h,'LineWidth',3)
xlabel('t')
ylabel('h(t)')
grid on 

% Limites de señales
pos_x = [];
pos_h = [];
k_x = 1;
k_h = 1;

for i = 1:length(Tau)
    if subs(x,t,Tau(i)) > 0 
        pos_x(k_x) = i;
        k_x = k_x + 1;
    end    
    if subs(h,t,Tau(i)) > 0
        pos_h(k_h) = i;
        k_h = k_h + 1; 
    end     
end    

x_x1 = round(Tau(pos_x(1)));
x_x2 = round(Tau(pos_x(end)));

h_x1 = round(Tau(pos_h(1)));
h_x2 = round(Tau(pos_h(end)));    

n=x_x1+h_x1:step:x_x2+h_x2;

v=-1:step:(Tau(end)-Tau(1));
for i = 1:length(Tau)
    t(i) = i;
    
    subplot(3,2,3:4)
    plot(Tau,X,'r',Tau,circshift(fliplr(H),[0,x_x1+h_x1+i]),'LineWidth',3); grid on; 
    xlabel('t')
    
    %INTEGRAL
    subplot(3,2,5:6)
    title('Y(t)')
    Y(i)=trapz(circshift(fliplr(H),[0,x_x1+h_x1+i]).*X)*step;
    %plot(n(1:i),Y(1:i))
    plot(v(1:i),Y(1:i)) 
    grid on; axis tight;
    xlabel('t')
    ylabel('y(t)')
    title('System output y(t)')
 
    pause(0.01); % Pause for a while
    
end   