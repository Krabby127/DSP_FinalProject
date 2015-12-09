function [output, count] = bounds(output)
count = 0;
for i=1:length(output)
    if output(i)< -1
        output(i)=-1;
        count = count + 1;
    elseif output(i)>1
        output(i)=1;
        count = count + 1;
    end
end