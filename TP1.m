%%% Burak Morali - Alexandre Carbonneau  %%%
%%%                TP 1                  %%%
clear;clc;

n=100;

% Question 1

% Initialisation du vecteur de Fibonacci
f=zeros(n,1);
f(1)=1;
f(2)=1;

% Boucle pour calculer les valeurs de Fibonacci jusqu'à "n"
for i=3:n
    f(i)=f(i-2)+f(i-1);
end

% Initialisation du vecteur des nombres pib
c=1+sqrt(3)/100;
p=zeros(n,1);
p(1)=1;
p(2)=1;

% Boucle pour calculer les valeurs des nombres pib jusqu'à "n"
for i=3:n
    p(i)=p(i-2)+c*p(i-1);
end

% Faire les graphiques des vecteurs de Fibonnaci, des nombres pib
% en fonction de "n" et du log(1/espsilone machine)

figure(1)
semilogy(1:n,f)
hold on
semilogy(1:n,p)      
epsmachine=ones(n,1)/eps;
semilogy(1:n,epsmachine)
title('Semi-log of Fibonacci and pib')
hold off

% Question 2 and 3
% results : matrice où l'on stock nos résultats que l'on analyse
% freverse: vecteur où l'on calcul la suite de Fibonacci de reculons



n_test=5:n;  % Pk 5:n??
results=zeros(length(n_test),3); % Matrice où l'on stock nos résultats

for j=1:length(n_test) % Boucle sur l'ensemble des "n" testés
    
    freverse=zeros(n_test(j),1);
    
    % On stock les deux dernières valeurs de notre suite de Fibonnaci
    % pour initialiser la récurrence
    freverse(n_test(j))=f(n_test(j));
    freverse(n_test(j)-1)=f(n_test(j)-1);
    
    % Boucle pour calculer la suite de Fibonnaci pour i = n-2, n-3...0
    for i=(n_test(j)-2):-1:1
        freverse(i)=freverse(i+2)-freverse(i+1);
    end
    
    % Code équivalent, mais pour les nombres pib.
    
    % On stock les deux dernières valeurs des nombres pib pour initialiser
    % la récurrence 
    preverse=zeros(n_test(j),1);
    preverse(n_test(j))=p(n_test(j));
    preverse(n_test(j)-1)=p(n_test(j)-1);
    
    for i=(n_test(j)-2):-1:1
        preverse(i)=preverse(i+2)-c*preverse(i+1);
    end
    
    results(j,1)=n_test(j);
    results(j,2)=abs(freverse(1)-f(1));
    results(j,3)=abs(preverse(1)-p(1));
    
end

figure(2)
semilogy(results(:,1),results(:,2))
hold on
semilogy(results(:,1),results(:,3))
title('Log of error on reverse calculations of f and p')
xlabel('Start of n return')
ylabel('Absolute error')