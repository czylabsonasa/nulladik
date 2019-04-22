clf;
t = [ -1 0 2 ];
f = [ 2 3 -4 ];
plot(t,f, 'o');
hold on

p=polyfit(t,f,2);
xx=linspace(...
  min(t)-0.5,max(t)+0.5);
plot(xx,polyval(p,xx));