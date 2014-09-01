%%%%fitting  exponential function using sdm method
%%%%sdm method ref:Supervised Descent Method for Solving Nonlinear Least
%%%%Squares Problems in Computer Vision
y=[1:0.3:50];
x=log(y);
N=size(y,2);
itercount=7;
c=mean(x);
tempx=ones(1,N);
tempx=tempx*c;
rs=zeros(1,itercount);
for it=1:itercount
    sum1=0;
    sum2=0;
    for i=1:N
        sum1=sum1+(exp(tempx(i))-y(i))*(x(i)-tempx(i));
        sum2=sum2+(exp(tempx(i))-y(i))^2;
    end
    r=sum1/sum2;
    rs(it)=r;
    for i=1:N
        tempx(i)=tempx(i)+rs(it)*(exp(tempx(i))-y(i));
    end
% sum((tempx-x).*(tempx-x))
end
rs
y2=[1:1:60];
M=size(y2,2);
x2=ones(1,M);
x2=x2*c;
for it=1:itercount
    for i=1:M
        x2(i)=x2(i)+rs(it)*(exp(x2(i))-y2(i));
    end
end
% x2
x3=log(y2);
plot(x2,y2);
hold on;
plot(x3,y2,'r.');
