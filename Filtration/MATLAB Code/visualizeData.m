function visualizeData(data, yaxis, txt)

t = data(:,1);

% colors = 'bgrcmykds';

figure
hold on
plot(t, data(:,2:end), '.', 'MarkerSize', 10)
xlabel('Time (hr)'), ylabel(yaxis)
legend(txt(1,2:end))