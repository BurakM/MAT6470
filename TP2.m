% Burak Morali - Alexandre Carbonneau
% TP2 - MAT6470

clc;clear

% Constantes
B=0.8;a=4;p0=0.5;A=4*B;q=1.6;

% Conditions frontieres
initix=0.01;
initip=0;

% Resolution algebrique avec Matlab

syms x(t) p(t)
eqn1 = diff(x) == 2*A*(sinh(p+q*x)-x*cosh(p+q*x));
eqn2 = diff(p) == -2*B*(p0*sinh(a*x)+p*cosh(a*x));  
S = dsolve(eqn1, eqn2);

% Resolution numerique

% options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);


[T,Y45] = ode45(@rigid,[0 10],[initix initip]);


plot(T,Y45)

