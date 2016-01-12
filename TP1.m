%%% Burak Morali - Alexandre Carbonneau  %%%
%%%                TP 1                  %%%
clear;clc;

n=100;

% Question 1

f=zeros(n,1);
f(1)=1;
f(2)=1;

for i=3:n
    f(i)=f(i-2)+f(i-1);
end

c=1+sqrt(3)/100;
p=zeros(n,1);
p(1)=1;
p(2)=1;

for i=3:n
    p(i)=p(i-2)+c*p(i-1);
end

figure(1)
semilogy(1:n,f)
hold on
semilogy(1:n,p)
epsmachine=ones(n,1)/eps;
semilogy(1:n,epsmachine)
title('Semi-log of Fibonacci and pib')
hold off

% Question 2 and 3

n_test=5:n;
results=zeros(length(n_test),3);

for j=1:length(n_test)
    freverse=zeros(n_test(j),1);
    freverse(n_test(j))=f(n_test(j));
    freverse(n_test(j)-1)=f(n_test(j)-1);
    for i=(n_test(j)-2):-1:1
        freverse(i)=freverse(i+2)-freverse(i+1);
    end
    
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