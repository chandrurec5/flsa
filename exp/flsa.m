function [errx,erry,errz]=flsa(iters)sigma=0.5;alpha=0.05;n=2;I=eye(n);A=[10 100; 0 10];B=[10 9.99; 0 10];C=[10 0; 0 10];U=[1 0; 0 0.2];x=zeros(n,iters);x(:,1)=rand(n,1);%x(:,1)=rand(n,1);x(:,1)=x(:,1)/norm(x(:,1));y=zeros(n,iters);y(:,1)=ones(n,1);y(:,1)=x(:,1);z=zeros(n,iters);z(:,1)=ones(n,1);z(:,1)=x(:,1);%y(:,1)=rand(n,1);%y(:,1)=y(:,1)/norm(y(:,1));errx(1)=norm(x(1))^2;erry(1)=norm(y(1))^2;errz(1)=norm(z(1))^2;for i=2:itersn=sigma*(rand-0.5);x(:,i)=(I-alpha*A)*x(:,i-1)+n;y(:,i)=(I-alpha*B)*y(:,i-1)+n;z(:,i)=(I-alpha*C)*z(:,i-1)+n;x_mean(i)=mean(x(:,i));y_mean(i)=mean(y(:,i));z_mean(i)=mean(z(:,i));errx(i)=norm(x_mean(i))^2;erry(i)=norm(y_mean(i))^2;errz(i)=norm(z_mean(i))^2;end;