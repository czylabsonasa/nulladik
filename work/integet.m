f = @(t) 2*x.^3-3*x^2+11;

m=10;
a=3;
b=10;

h=(b-a)/m;

erint=h*sum(f(a+0.5*h:h:b))


trapez=(sum(f(a:h:b))-0.5*(f(a)+f(b)))*h

igazi=integral(f,a,b)



