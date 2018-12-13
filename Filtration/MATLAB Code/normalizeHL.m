function [jump HL] = normalizeHL(data)
% returns matrix jump of where jump occurs
% jump(i) is [index time magnitude]
% returns matrix HL of new head loss
% returns vector of doubles f of subtracting factor
% data is a matrix of data, with the first column being time
% remove large jumps in head loss data that are incorrect
% find where change in HL is small, then subtract
[m n] = size(data);

jump = zeros(n,3);
HL = data; % initializes as data, but replaced with normalized data

threshold = 2; % cm

for i = 2:n % for each column/PACl dosage
    j = 1;
    while abs(data(j+1,i) - data(j,i)) > threshold
        j = j+1;
    end
    jump(i,:) = [j data(j,1) data(j,i)];
    HL(:,i) = data(:,i)-data(j,i);
    HL(1:j,i) = 0; % make negative values 0
end
