% Team 4-8 Coronavirus Data Report
% Authors: Claire Kucera, Ian Tracy, Matthew Fortuna, Gabe Montemayor,
% Niloy Neogi, Shirui Zhou

clear; %clear workspace
clc; %clear command window

%% Read the data into a table
data = readtable('COVID_Data_2020_10_07.xlsx');

%% Last n days of US cases
n = 90; %change this to change the number of days counted
[~,index] = ismember('United_States_of_America',data{:,7}); %find the row value for US data
days = (n:-1:1); %days array
cases = (1:1:n); %cases array
temp = 1; %keep track of place in cases
for i = index:index + n - 1
    cases(temp) = data{i, 5};
    temp = temp + 1;
end

plot(days, cases, ".-"); %plot the cases vs days
title("US COVID-19 Cases in the Last " + n + " Days");
ylabel("# of cases (in tens of thousands)");
xlabel("Day");
