%No comments
u0=0;     u1=0.1;  %Include BC's as variables
N=100;
vec1=ones(N,1);
M=spdiags([vec1 -2*vec1 vec1],[-1 0 1], N, N);
M(1,:)=zeros(1,N);
M(1,1)=1;
M(N,:)=zeros(1,N);
M(N,N)=1;
x=linspace(0,1,N)';
f=10*sin(20*x)+cos(x.^5);
f(1)=u0;
f(N)=u1;
u=(1/N^2)*M\f;  %Included factor of 1/N^2
figure(1);
plot(x,u);
xlabel('x');
ylabel('u(x)');
title('u(x) estimated by finite difference');