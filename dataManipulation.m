%% Extracting data from the file
clc, clearvars
%folder path of the individual data
folderPath = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/individual_data_paper';

% List all .csv file under the individual_data_paper folder
% should be 115 participants
files = dir(fullfile(folderPath, '*.csv'));

% All partitcipants file, 115*148*3
allParticipants = zeros(numel(files),148, 3);

%display all file contents
for i = 1:numel(files)
    filePath = fullfile(folderPath, files(i).name);
    % Read the file
    fileData = readtable(filePath);

    %check number of rows for each individual files
    tableSize = size(fileData);
    numRows = tableSize(1);
    numcols = tableSize(2);

    %set individual input data matrix
    inputIndData = zeros(numRows,3);
    
    % extract data from each file
    % 1st column condition (trial type (need to alter later for different
    % fit test)
    % 2nd column response type (win/lose)
    % 3rd column rt
    inputIndData(:,1) = fileData.trial_type;
    inputIndData(:,2) = fileData.gamble;
    inputIndData(:,3) = fileData.rt / 1000; % reaction time have to be in sec

    % condition = inputIndData(:,1) == -999.000;
    % inputIntData(condition, :) = [];
    % disp(filePath);
    % disp(inputIndData);

    %append individual data to the all data matrix
    allParticipants(i,:,:) = inputIndData;
end
    disp(allParticipants)


%% Deal with NaN situation
%ignoring the function by using omitmissing in mean function
% allParticipants(isnan(allParticipants)) = 0


%% clean up data that participants exceed the time
%remove all -999, by replacing the rt from NaN to 0
allparticipantsClean = [];
for j = 1:numel(files)
    for k = 1:numRows
        if allParticipants(j,k,1) ~= -999;
            allParticipantsClean(j,k,:) = allParticipants(j, k, :);
        else
            disp(j)
        end 
    end
end

%% Calculating avg
%create a 115*1 matrix to store each participants avg reaction time
rtAvg = zeros(115,1)
for i = 1:numel(files)
    rtAvg(i) = mean(allParticipants(i,:,3),"omitmissing");
end
disp(rtAvg)
    




