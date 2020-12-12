[pk1,lc1] = findpeaks(c17_B,'Threshold',1e10);
lc1 = c17_A(lc1)
plot(c17_A,c17_B);
hold
plot(lc1,pk1)

