urlF = 'http://hq.sinajs.cn/list=sh204';
urlL = {'001','002','003','004','007','014','028','091','182'};

dataM = [];

for i=1:length(urlL)
    data = urlread(strcat(urlF,urlL{i}));
    data = strsplit(data,'"');
    data = data{2};
    data = strsplit(data,',');
    
    dataM=[dataM; data];
end

closes = dataM(:,4);
yesterday = dataM(:,3);
plot(str2double(closes),'k-');
hold on
plot(str2double(yesterday),'r--');
set(gca, 'XTicklabel',dataM(:,1)')

%% Colums in dataM
% [Ticker, Open, Prev Avg, Current, High, Low, Bid1, Ask1, Volume, Volume
% in CNY, (Unknown), (Bids), (Asks), Date, Time];
