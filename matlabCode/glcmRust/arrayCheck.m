function output = arrayCheck(temp)
output.counter1 = 0;
output.counter2 = 0;
output.counter3 = 0;
output.counter4 = 0;
for i = 1:size(temp,1)
    for j=1:size(temp,2)
        if temp(i,j)==1
            output.counter1=output.counter1+1;
        end
        if temp(i,j)==2
            output.counter2=output.counter2+1;
        end
        if temp(i,j)==3
            output.counter3=output.counter3+1;
        end
        if temp(i,j)==4
            output.counter4=output.counter4+1;
        end
    end
end
output.counter1 = output.counter1/400;
output.counter2 = output.counter2/400;
output.counter3 = output.counter3/400;
output.counter4 = output.counter4/400;
        