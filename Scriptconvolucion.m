%si funciona, solo se tarda :c pero es muy cool
clear all, clc, close all
syms t
%x = heaviside(t-1) - heaviside(t-3); % Input - Señal fija
%h = heaviside(t) - heaviside(t-2); % Impulse response - Señal mueve
%convolution_integral3(x,h)

% v=exp(-t).*heaviside(t);
% s=heaviside(t)-heaviside(t-2);
% convolution_integral3(v,s)

% i=(t-1).*(heaviside(t-1)-heaviside(t-3));
% a=heaviside(t+1)-2.*heaviside(t-2);
% convolution_integral3(i,a)

% s=exp(-2*t + 2).*heaviside(t-1);
% v=exp(-3*t - 6).*heaviside(t+2);
% [Y,v] = convolution_integral3(v,s)

x=t*(heaviside(t-2)-heaviside(t-3));
h=t*(heaviside(t+1)-heaviside(t-1));
[Y,v] = convolution_integral3(x,h)