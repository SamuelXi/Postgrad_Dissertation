%% Clean
clc, clearvars

%% Extracting data from the file
%folder path of the individual data
folderPath = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/data/individual_data_paper';

% List all .csv file under the individual_data_paper folder
% should be 115 participants
files = dir(fullfile(folderPath, '*.csv'));

% All partitcipants file, 115*148*3
allParticipants = zeros(numel(files),148, 3);
allParticipants101 = zeros(numel(files),98,3);
allParticipants102 = zeros(numel(files),50,3);

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
    inputIndData101 = zeros(98,3);
    inputIndData102 = zeros(50,3);
    
    % extract data from each file
    % 1st column condition (trial type (need to alter later for different
    % fit test)
    % 2nd column response type (win/lose)
    % 3rd column rt
    inputIndData(:,1) = fileData.trial_type;
    inputIndData(:,2) = fileData.gamble;
    inputIndData(:,3) = fileData.rt / 1000; % reaction time have to be in sec
    % Check for trial type for later testing
    trialTemp = fileData.trial_type;
    gambleTemp = fileData.gamble;
    rtTemp = fileData.rt / 1000;
    count101 = 0;
    count102 = 0;
    for j = 1:148
        if trialTemp(j) == 101
            count101 = count101 + 1;
            inputIndData101(count101,1) = trialTemp(j);
            inputIndData101(count101,2) = gambleTemp(j);
            inputIndData101(count101,3) = rtTemp(j);
        else
            count102 = count102 + 1;
            inputIndData102(count102,1) = trialTemp(j);
            inputIndData102(count102,2) = gambleTemp(j);
            inputIndData102(count102,3) = rtTemp(j);
        end 
    end

    %append individual data to the all data matrix
    allParticipants(i,:,:) = inputIndData;
    allParticipants101(i,:,:) = inputIndData101;
    allParticipants102(i,:,:) = inputIndData102;
end

%% Deal with NaN situation
%ignoring the function by using omitmissing in mean function
% allParticipants(isnan(allParticipants)) = 0


%% clean up data that participants exceed the time
%remove all -999, by replacing the rt from NaN to 0
% allparticipantsClean = [];
% for j = 1:numel(files)
%     for k = 1:numRows
%         if allParticipants(j,k,1) ~= -999;
%             allParticipantsClean(j,k,:) = allParticipants(j, k, :);
%         else
%             disp(j)
%         end 
%     end
% end

%% Calculating avg (only for testing)
%create a 115*1 matrix to store each participants avg reaction time
rtAvg = zeros(115,1)
for i = 1:numel(files)
    rtAvg(i) = mean(allParticipants(i,:,3),"omitmissing");
end
% disp(rtAvg);
    
%% List for anxious and non anxious patient

% Save anxious and non anxious participant's ID
anxPar = [];
anxNoPar = [];

% File path
gad7file = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/data/data_anx_gad7_prior.csv';
gad7 = readtable(gad7file);

% Get column
parID = gad7.id;
anxIndex = num2cell(gad7.gad7);
gadInfo = [parID anxIndex];

% Append pariticipant ID based on GAD
for i = 1:115
    if cell2mat(gadInfo(i,2)) <= 7
        anxNoPar = [anxNoPar, gadInfo(i,1)];
    else
        anxPar = [anxPar, gadInfo(i,1)];
    end
end

