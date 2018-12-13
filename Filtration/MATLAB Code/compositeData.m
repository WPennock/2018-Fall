% composite the data
close all
clear all

fileName = 'Composite - Clay HA.xlsx';
sheetNames = {'HL'; 'ET'; 'pC'};
newSheetNames = {'Smooth HL', 'Smooth ET', 'Smooth pC'};
% sheetNames = {'ET'};
% newSheetNames = {'Smooth ET'};

block = 50;
hour = 24;
header = {'Index', 'Time', 'Magnitude'};

for i = 1:length(sheetNames)
    tic
    fprintf('Data processing %s \n', char(sheetNames(i)));
    [data, txt] = xlsread(fileName, char(sheetNames(i)));
    data(isnan(data)) = 0;
    s = smoothData(data, block, hour);
    if (strcmp(sheetNames(i),'HL')==1)
        [jump HL] = normalizeHL(s);
        xlswrite(fileName, header, 'HL jump');
        xlswrite(fileName, jump, 'HL jump', 'A2');
        s = HL;
    end
    if (strcmp(sheetNames(i),'ET')==1)
        [failTime failNTU] = findFailure(s);
        xlswrite(fileName, header, 'Fail Time');
        xlswrite(fileName, failTime, 'Fail Time', 'A2');
        
%         xlswrite(fileName, header, 'Fail NTU');
%         xlswrite(fileName, failNTU, 'Fail NTU', 'A2');
    end
    visualizeData(s, char(sheetNames(i)), txt);
    xlswrite(fileName, txt, char(newSheetNames(i)));
    xlswrite(fileName, s, char(newSheetNames(i)), 'A2');
    toc
end
