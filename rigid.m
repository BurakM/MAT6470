function dy=rigid(t,y)

B=0.8;a=4;p0=0.5;A=4*B;q=1.6;

dy=zeros(2,1);
dy(1)= 2*A*(sinh(y(2))+q*y(1)-y(1)*cosh(y(2)+q*y(1)));
dy(2)= -2*B*(p0*sinh(a*y(1)+y(2)*cosh(a*y(1))));  
end