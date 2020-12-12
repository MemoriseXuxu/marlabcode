for i = 1:10:100
    x = (1:1:100); 
    t = 10+20*i*x ;
    plot(x,t)
    print(num2str(i),'-dpng')
end
