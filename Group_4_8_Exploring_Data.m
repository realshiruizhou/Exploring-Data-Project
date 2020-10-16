% Team 4-8 Coronavirus Data Report
% Authors: Claire Kucera, Ian Tracy, Matthew Fortuna, Gabe Montemayor,
% Niloy Neogi, Shirui Zhou

clear; %clear workspace
clc; %clear command window

%% Read the data into a table
data = readtable('COVID_Data_2020_10_07.xlsx');

%% Last n days of cases for different countries
n = 90; %change this to change the number of days counted

[~,index_us] = ismember('United_States_of_America',data{:,7}); %find the row value for US data
[~,index_mexico] = ismember('Mexico',data{:,7}); %find the row value for Mexico data
[~,index_canada] = ismember('Canada',data{:,7}); %find the row value for Mexico data

days = (n:-1:1); %days array
cases_us = (1:1:n); %cases array for us
cases_mexico = (1:1:n); %cases array for mexico
cases_canada = (1:1:n); %cases array for canada

temp = 1; %keep track of place in cases
for i = 0:n - 1
    cases_us(temp) = data{i + index_us, 5};
    cases_mexico(temp) = data{i + index_mexico, 5};
    cases_canada(temp) = data{i + index_canada, 5};
    temp = temp + 1;
end

plot(days, cases_us, "b.-"); %plot the cases vs days for us in blue
hold on;
plot(days, cases_mexico, "g.-");
plot(days, cases_canada, "r.-");
title("North America COVID-19 Cases in the Last " + n + " Days");
ylabel("# of cases (in tens of thousands)");
xlabel("Day");
legend("US", "Mexico", "Canada");
hold off;

%% Plot the pie chart
pie([sum(cases_us) sum(cases_mexico) sum(cases_canada)]);
title("Percentage of Total NA cases in the last " + n + " days.");
legend("US", "Mexico", "Canada", "Location", "southoutside", "Orientation", "horizontal"); 
