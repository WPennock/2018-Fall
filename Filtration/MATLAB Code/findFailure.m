function [failTime failNTU] = findFailure(data)
% find failure time
% failTime(i) = [index timeFail ET]

[m n] = size(data);
failTime = zeros(n,3);
failNTU = zeros(n,3);

delta = 1; % NTU
maxNTU = 2.5; % NTU

for i = 2:n
    j = 1;
%     while j < m-1 && (abs(data(j+1,i) - data(j,i)) < delta || data(j,i) < maxNTU)
%         j = j+1;
%         if abs(data(j+1,i) - data(j,i)) < delta
%             failTime(i,:) = [j data(j,1) data(j,i)];  
%         end
%         if data(j,i) < maxNTU
%             failNTU(i,:) = [j data(j,1) data(j,i)];
%         end
%     end 
    while j < m-6 && (data(j+5,i) - data(j,i)) < delta
        j = j+1;
    end
    failTime(i,:) = [j data(j,1) data(j,i)]; 
    failNTU(i,:) = [j data(j,1) data(j,i)];
end