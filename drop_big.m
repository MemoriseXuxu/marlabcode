function [income_new] = drop_big(income)

L = length(income) ; 

for  i = 1:1:L-1
    if abs(income(i+1,1) - income(i,1)) > 0.199 ;
        income_new(i+1,1) = 888.88;
    else
        income_new(i+1,1) = income(i+1,1);
    end
end    