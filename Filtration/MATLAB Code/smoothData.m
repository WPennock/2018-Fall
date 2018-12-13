function s = smoothData(data, block, hour)
% block is number of data points that will go into the average
% data is matrix of data with time in first column

[m n] = size(data);
s = zeros(floor(m/block),n);
r = rem(m, block);

for i = 1:length(s)
    s(i,:) = mean(data(i*block-block+1:i*block,:));
end

% smooths leftover data
s(i+1) = mean(data(end-r+1:end));

t = linspace(0,hour,floor(m/block));
% fprintf('length of t: %i \n', length(t));
% fprintf('length of s: %i \n', length(s));
% replace first column with new time
s(:,1) = t;